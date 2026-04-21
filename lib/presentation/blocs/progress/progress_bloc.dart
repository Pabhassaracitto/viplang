import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/hive_service.dart';
import '../../../data/content/all_themes_registry.dart';
import '../../../data/models/vocab_model.dart';
import 'progress_event.dart';
import 'progress_state.dart';

class ProgressBloc extends Bloc<ProgressEvent, ProgressState> {
  ProgressBloc() : super(ProgressInitial()) {
    on<LoadTodayVocabEvent>(_onLoadTodayVocab);
    on<RefreshAfterSrsEvent>(_onRefreshAfterSrs);
  }

  // ─── Load Today Vocab ───────────────────────────────────────────────────────
  Future<void> _onLoadTodayVocab(
    LoadTodayVocabEvent event,
    Emitter<ProgressState> emit,
  ) async {
    emit(ProgressLoading());
    try {
      // Seed vocab vào Hive trước (lần đầu tiên dùng app)
      await _seedVocabIfNeeded();
      final result = _computeTodayVocab();
      emit(result);
    } catch (e) {
      debugPrint('ProgressBloc error: $e');
      emit(ProgressError(e.toString()));
    }
  }

  // ─── Refresh sau SRS ────────────────────────────────────────────────────────
  Future<void> _onRefreshAfterSrs(
    RefreshAfterSrsEvent event,
    Emitter<ProgressState> emit,
  ) async {
    try {
      final result = _computeTodayVocab();
      emit(result);
    } catch (e) {
      debugPrint('ProgressBloc refresh error: $e');
      // Không crash UI — giữ nguyên state cũ
    }
  }

  // ─── Seed Vocab vào Hive nếu chưa có ───────────────────────────────────────
  /// Vấn đề cốt lõi: AllThemesRegistry trả về in-memory objects.
  /// VocabModel.save() chỉ hoạt động khi object đã được box.put().
  /// => Cần seed một lần duy nhất khi lần đầu dùng app.
  Future<void> _seedVocabIfNeeded() async {
    final box = HiveService.vocabBox;

    // Nếu box đã có data thì bỏ qua
    // Kiểm tra bằng key của vocab đầu tiên (v01_01)
    if (box.isNotEmpty) return;

    debugPrint('🌱 Seeding vocab into Hive...');

    final allVocabs = _getAllVocabsFromRegistry();
    for (final vocab in allVocabs) {
      // put với key = vocab.id để dễ tra cứu
      await box.put(
        vocab.id,
        VocabModel(
          id: vocab.id,
          wordEn: vocab.wordEn,
          wordVi: vocab.wordVi,
          pronunciation: vocab.pronunciation,
          partOfSpeech: vocab.partOfSpeech,
          themeId: vocab.themeId,
          exampleEn: vocab.exampleEn,
          exampleVi: vocab.exampleVi,
          // SRS fields khởi tạo mặc định
          repetitionCount: 0,
          easeFactor: 2.5,
          intervalDays: 1,
          nextReview: null, // null = chưa học = due ngay
        ),
      );
    }

    debugPrint('✅ Seeded ${allVocabs.length} vocabs into Hive');
  }

  // ─── Core SRS Logic ─────────────────────────────────────────────────────────
  ProgressLoaded _computeTodayVocab() {
    final box = HiveService.vocabBox;

    if (box.isEmpty) {
      return ProgressLoaded(todayVocab: null, dueCount: 0, masteredCount: 0);
    }

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final List<VocabModel> dueVocabs = [];
    final List<VocabModel> newVocabs = [];
    int masteredCount = 0;

    for (final vocab in box.values) {
      // Mastered = đã ôn thành công >= 5 lần
      // (SM-2: repetitionCount >= 5 nghĩa là interval đã dài, ghi nhớ bền)
      if (vocab.repetitionCount >= 5) {
        masteredCount++;
      }

      // Chưa học lần nào
      if (vocab.nextReview == null) {
        newVocabs.add(vocab);
        continue;
      }

      // Kiểm tra due: so sánh theo ngày, không theo giờ
      final reviewDay = DateTime(
        vocab.nextReview!.year,
        vocab.nextReview!.month,
        vocab.nextReview!.day,
      );

      if (!reviewDay.isAfter(today)) {
        dueVocabs.add(vocab);
      }
    }

    // Chọn todayVocab theo ưu tiên SRS:
    // 1. Due sớm nhất (overdue nhiều nhất)
    // 2. Từ mới chưa học
    // Không random — học có chủ đích
    VocabModel? todayVocab;

    if (dueVocabs.isNotEmpty) {
      dueVocabs.sort((a, b) {
        final aDate = a.nextReview ?? DateTime(2000);
        final bDate = b.nextReview ?? DateTime(2000);
        return aDate.compareTo(bDate);
      });
      todayVocab = dueVocabs.first;
    } else if (newVocabs.isNotEmpty) {
      // Giữ thứ tự theme 1→13 — từ mới đầu tiên theo curriculum
      todayVocab = newVocabs.first;
    }

    return ProgressLoaded(
      todayVocab: todayVocab,
      dueCount: dueVocabs.length,
      masteredCount: masteredCount,
    );
  }

  // ─── Helper ─────────────────────────────────────────────────────────────────
  List<VocabModel> _getAllVocabsFromRegistry() {
    final result = <VocabModel>[];
    try {
      final themes = AllThemesRegistry.getAllThemes();
      for (final theme in themes) {
        result.addAll(AllThemesRegistry.getVocabulary(theme.id));
      }
    } catch (e) {
      debugPrint('Lỗi đọc vocab từ registry: $e');
    }
    return result;
  }
}
