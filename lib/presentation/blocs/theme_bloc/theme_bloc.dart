import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/hive_service.dart';
import '../../../data/content/all_themes_registry.dart';
import '../../../data/models/theme_model.dart';

// Events
abstract class ThemeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadThemesEvent extends ThemeEvent {}

class UnlockThemeEvent extends ThemeEvent {
  final String themeId;
  UnlockThemeEvent(this.themeId);
  @override
  List<Object?> get props => [themeId];
}

class UpdateThemeProgressEvent extends ThemeEvent {
  final String themeId;
  final double progress;
  final int completedDays; // ✅ Thêm

  UpdateThemeProgressEvent(
    this.themeId,
    this.progress, {
    this.completedDays = 0, // ✅ Default
  });

  @override
  List<Object?> get props => [themeId, progress, completedDays];
}

/// Danh sách theme ID theo thứ tự học — nguồn sự thật: AllThemesRegistry.
List<String> _orderedThemeIds() {
  final themes = List.of(AllThemesRegistry.getAllThemes())
    ..sort((a, b) => a.themeNumber.compareTo(b.themeNumber));
  return themes.map((t) => t.id).toList();
}

// ✅ Mở theme kế tiếp khi hoàn thành theme hiện tại (đủ 13/13 chủ đề)
Future<void> _unlockNextTheme(String currentThemeId, dynamic box) async {
  final themeOrder = _orderedThemeIds();

  final currentIdx = themeOrder.indexOf(currentThemeId);
  if (currentIdx >= 0 && currentIdx < themeOrder.length - 1) {
    final nextThemeId = themeOrder[currentIdx + 1];
    final nextTheme = box.get(nextThemeId);
    if (nextTheme != null && !nextTheme.isUnlocked) {
      nextTheme.isUnlocked = true;
      await nextTheme.save();
    }
  }
}

// States
abstract class ThemeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ThemeInitial extends ThemeState {}

class ThemeLoading extends ThemeState {}

class ThemeLoaded extends ThemeState {
  final List<ThemeModel> themes;
  ThemeLoaded(this.themes);
  @override
  List<Object?> get props => [themes];
}

class ThemeError extends ThemeState {
  final String message;
  ThemeError(this.message);
  @override
  List<Object?> get props => [message];
}

// BLoC
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<LoadThemesEvent>(_onLoadThemes);
    on<UnlockThemeEvent>(_onUnlockTheme);
    on<UpdateThemeProgressEvent>(_onUpdateProgress);
  }

  Future<void> _onLoadThemes(
    LoadThemesEvent event,
    Emitter<ThemeState> emit,
  ) async {
    emit(ThemeLoading());
    try {
      final box = HiveService.themeBox;

      // Seed data nếu chưa có
      if (box.isEmpty) {
        await _seedThemes(box);
      }

      final themes = box.values.toList()
        ..sort((a, b) => a.themeNumber.compareTo(b.themeNumber));
      emit(ThemeLoaded(themes));
    } catch (e) {
      emit(ThemeError(e.toString()));
    }
  }

  /// Seed từ AllThemesRegistry — một nguồn sự thật duy nhất cho metadata
  /// (tránh hardcode lệch nội dung; theme 1 mở sẵn, các theme sau khóa tuần tự).
  Future<void> _seedThemes(dynamic box) async {
    final allThemes = AllThemesRegistry.getAllThemes();
    for (final theme in allThemes) {
      await box.put(theme.id, theme);
    }
  }

  Future<void> _onUnlockTheme(
    UnlockThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final box = HiveService.themeBox;
    final theme = box.get(event.themeId);
    if (theme != null) {
      theme.isUnlocked = true;
      await theme.save();
    }
    add(LoadThemesEvent());
  }

  Future<void> _onUpdateProgress(
    UpdateThemeProgressEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final box = HiveService.themeBox;
    final theme = box.get(event.themeId);
    if (theme != null) {
      theme.progressPercent = event.progress;
      theme.completedDays = event.completedDays;
      theme.lastStudiedAt = DateTime.now();
      await theme.save();

      // ✅ Mở khóa theme tiếp theo nếu hoàn thành 100%
      if (event.progress >= 1.0) {
        await _unlockNextTheme(event.themeId, box);
      }
    }
    add(LoadThemesEvent());
  }
}
