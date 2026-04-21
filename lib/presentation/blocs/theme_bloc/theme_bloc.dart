import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/hive_service.dart';
import '../../../data/content/theme1_content.dart';
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

// ✅ Thêm hàm unlock theme tiếp theo:
Future<void> _unlockNextTheme(String currentThemeId, dynamic box) async {
  const themeOrder = [
    'theme_01_offices',
    'theme_02_general_business',
    'theme_03_technical_areas',
    'theme_04_travel',
    'theme_05_entertainment',
    'theme_06_purchasing',
    'theme_07_dining_out',
    'theme_08_personnel',
    'theme_09_finance_budgeting',
    'theme_10_corporate_development',
    'theme_11_manufacturing',
    // ... thêm các theme khác
  ];

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

  Future<void> _seedThemes(dynamic box) async {
    final allThemes = _getAllThemes();
    for (final theme in allThemes) {
      await box.put(theme.id, theme);
    }
  }

  List<ThemeModel> _getAllThemes() => [
    Theme1Content.theme,
    ThemeModel(
      id: 'theme_02_general_business',
      themeNumber: 2,
      titleEn: 'General Business',
      titleVi: 'Thương Mại Tổng Quát',
      description: 'Bán hàng, tiếp thị, lập kế hoạch, đàm phán, hợp đồng...',
      iconEmoji: '💼',
      isUnlocked: true,
    ),
    ThemeModel(
      id: 'theme_03_technical_areas',
      themeNumber: 3,
      titleEn: 'Technical Areas',
      titleVi: 'Các Vấn Đề Kỹ Thuật',
      description: 'Công nghệ, máy tính, thiết bị điện tử, phòng thí nghiệm...',
      iconEmoji: '💻',
      isUnlocked: true,
    ),
    ThemeModel(
      id: 'theme_04_travel',
      themeNumber: 4,
      titleEn: 'Travel',
      titleVi: 'Đi Lại và Công Tác',
      description: 'Phương tiện giao thông, mua vé, lịch trình, thuê xe...',
      iconEmoji: '✈️',
      isUnlocked: true,
    ),
    ThemeModel(
      id: 'theme_05_entertainment',
      themeNumber: 5,
      titleEn: 'Entertainment',
      titleVi: 'Giải Trí và Chiêu Đãi',
      description: 'Rạp hát, xem phim, bảo tàng, triển lãm...',
      iconEmoji: '🎭',
      isUnlocked: true,
    ),
    ThemeModel(
      id: 'theme_06_purchasing',
      themeNumber: 6,
      titleEn: 'Purchasing',
      titleVi: 'Mua Sắm Doanh Nghiệp',
      description: 'Đặt mua hàng, cung ứng, hóa đơn mua bán...',
      iconEmoji: '🛒',
      isUnlocked: true,
    ),
    ThemeModel(
      id: 'theme_07_dining_out',
      themeNumber: 7,
      titleEn: 'Dining Out',
      titleVi: 'Đi Ăn Nhà Hàng',
      description: 'Đặt bàn, gọi món từ thực đơn, thanh toán hoá đơn...',
      iconEmoji: '🍽️',
      isUnlocked: true,
    ),
    ThemeModel(
      id: 'theme_08_personnel',
      themeNumber: 8,
      titleEn: 'Personnel',
      titleVi: 'Nhân Sự',
      description: 'Tuyển dụng, lương bổng, thăng tiến, đơn xin việc...',
      iconEmoji: '👥',
      isUnlocked: true,
    ),
    ThemeModel(
      id: 'theme_09_finance_budgeting',
      themeNumber: 9,
      titleEn: 'Finance & Budgeting',
      titleVi: 'Tài Chính và Ngân Sách',
      description: 'Tài chính, ngân hàng, kế toán, đầu tư, cổ phiếu, thuế...',
      iconEmoji: '💰',
      isUnlocked: true,
    ),
    ThemeModel(
      id: 'theme_10_corporate_development',
      themeNumber: 10,
      titleEn: 'Corporate Development',
      titleVi: 'Phát Triển Doanh Nghiệp',
      description: 'Nghiên cứu và phát triển sản phẩm...',
      iconEmoji: '📈',
      isUnlocked: true,
    ),
    ThemeModel(
      id: 'theme_11_manufacturing',
      themeNumber: 11,
      titleEn: 'Manufacturing',
      titleVi: 'Sản Xuất',
      description: 'Dây chuyền sản xuất, quản lý chất lượng...',
      iconEmoji: '🏭',
      isUnlocked: true,
    ),
    ThemeModel(
      id: 'theme_12_housing_property',
      themeNumber: 12,
      titleEn: 'Housing/Corporate Property',
      titleVi: 'Nhà Đất và Tài Sản',
      description: 'Mua bán, thuê mướn tài sản, xây dựng...',
      iconEmoji: '🏠',
      isUnlocked: true,
    ),
    ThemeModel(
      id: 'theme_13_health',
      themeNumber: 13,
      titleEn: 'Health',
      titleVi: 'Sức Khỏe và Y Tế',
      description: 'Thăm khám bác sỹ, bảo hiểm y tế, bệnh viện...',
      iconEmoji: '🏥',
      isUnlocked: true,
    ),
  ];

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
