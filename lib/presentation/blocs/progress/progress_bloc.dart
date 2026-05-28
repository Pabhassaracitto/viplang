// lib/presentation/blocs/progress/progress_bloc.dart

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
    }
  }

  // ─── Seed Vocab vào Hive nếu chưa có ───────────────────────────────────────
  Future<void> _seedVocabIfNeeded() async {
    final box = HiveService.vocabBox;
    if (box.isNotEmpty) return;

    debugPrint('🌱 Seeding vocab into Hive...');

    final allVocabs = _getAllVocabsFromRegistry();
    for (final vocab in allVocabs) {
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
          repetitionCount: 0,
          easeFactor: 2.5,
          intervalDays: 1,
          nextReview: null,
        ),
      );
    }

    debugPrint('✅ Seeded ${allVocabs.length} vocabs into Hive');
  }

  // ─── Core SRS Logic ────────────────────────────────────────────────────────
  /// Tính toán vocab cần ôn hôm nay theo quy tắc:
  /// 1. Due cards (overdue trước) → giới hạn 50 từ
  /// 2. Nếu < 20 từ due → thêm từ mới (max 20)
  /// 3. Chọn 1 từ random từ list để hiển thị "Từ vựng hôm nay"
  ProgressLoaded _computeTodayVocab() {
    final box = HiveService.vocabBox;

    if (box.isEmpty) {
      return ProgressLoaded(
        todayVocab: null,
        dueCount: 0,
        masteredCount: 0,
        todayGoal: 0,
      );
    }

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final List<VocabModel> dueVocabs = [];
    final List<VocabModel> newVocabs = [];
    int masteredCount = 0;

    // ─── Phân loại vocab ────────────────────────────────────────────────────
    for (final vocab in box.values) {
      // Mastered: repetitionCount >= 5
      if (vocab.repetitionCount >= 5) {
        masteredCount++;
      }

      // Chưa học lần nào (new)
      if (vocab.nextReview == null) {
        newVocabs.add(vocab);
        continue;
      }

      // Kiểm tra due
      final reviewDay = DateTime(
        vocab.nextReview!.year,
        vocab.nextReview!.month,
        vocab.nextReview!.day,
      );

      if (!reviewDay.isAfter(today)) {
        dueVocabs.add(vocab);
      }
    }

    // ─── Sắp xếp due cards theo overdue nhiều nhất ─────────────────────────
    dueVocabs.sort((a, b) {
      final aDate = a.nextReview ?? DateTime(2000);
      final bDate = b.nextReview ?? DateTime(2000);
      return aDate.compareTo(bDate);
    });

    // ─── Tính "hôm nay cần ôn" ──────────────────────────────────────────────
    /// Quy tắc Daily Goal:
    /// - Max 50 due cards
    /// - Nếu < 20 due → thêm từ mới để đạt tối thiểu 20 (logic này đã được bao phủ bởi dailyLimit 50)
    const dailyLimit = 50;
    final todayCards = <VocabModel>[];

    // Thêm due cards
    todayCards.addAll(dueVocabs.take(dailyLimit));

    // Nếu chưa đủ, thêm từ mới
    final remainingSlots = dailyLimit - todayCards.length;
    if (remainingSlots > 0 && newVocabs.isNotEmpty) {
      final newCardsToAdd = newVocabs.take(remainingSlots);
      todayCards.addAll(newCardsToAdd);
    }

    // ─── Chọn 1 từ hiển thị trong widget ────────────────────────────────────
    VocabModel? todayVocab;

    if (todayCards.isNotEmpty) {
      // Chọn từ đầu tiên (overdue nhất) để highlight
      todayVocab = todayCards.first;
    }

    debugPrint(
      '📊 Daily Goal: ${todayCards.length} words '
      '(due: ${dueVocabs.length}, new: ${newVocabs.length}, mastered: $masteredCount)',
    );

    return ProgressLoaded(
      todayVocab: todayVocab,
      dueCount: dueVocabs.length,
      masteredCount: masteredCount,
      todayGoal: todayCards.length, // ✅ NEW: Số từ cần ôn hôm nay
    );
  }

  // ─── Helper ────────────────────────────────────────────────────────────────
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
