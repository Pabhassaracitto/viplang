import 'package:flutter_test/flutter_test.dart';
import 'package:viplang/data/content/all_themes_registry.dart';
import 'package:viplang/data/content/content_validator.dart';
import 'package:viplang/data/models/lesson_model.dart';

/// Validate toàn bộ 26 LessonDay (13 theme × 2 ngày) — chạy được cả trong
/// CI (release mode) chứ không chỉ qua assert DEBUG như trước.
void main() {
  group('ContentValidator — 13 chủ đề × 2 ngày', () {
    test('registry trả về đủ 13 theme', () {
      final themes = AllThemesRegistry.getAllThemes();
      expect(themes.length, 13);
      expect(themes.first.themeNumber, 1);
      expect(themes.last.themeNumber, 13);
      // theme 1 mở sẵn, còn lại khóa (tuần tự)
      expect(themes.first.isUnlocked, isTrue);
      for (final t in themes.skip(1)) {
        expect(t.isUnlocked, isFalse, reason: '${t.id} phải khóa khi seed');
      }
    });

    test('mỗi theme có day1 + day2 với id đúng pattern', () {
      final themes = AllThemesRegistry.getAllThemes();
      for (final theme in themes) {
        final day1 = AllThemesRegistry.getLesson(theme.id, 1);
        final day2 = AllThemesRegistry.getLesson(theme.id, 2);
        expect(day1, isNotNull, reason: '${theme.id} thiếu day1');
        expect(day2, isNotNull, reason: '${theme.id} thiếu day2');
        expect(day1!.themeId, theme.id);
        expect(day2!.themeId, theme.id);
        expect(AllThemesRegistry.getLesson(theme.id, 3), isNull);
      }
    });

    test('tất cả LessonDay không có error theo ContentValidator', () {
      final themes = AllThemesRegistry.getAllThemes();
      final days = <LessonDay>[];
      for (final theme in themes) {
        days.add(AllThemesRegistry.getLesson(theme.id, 1)!);
        days.add(AllThemesRegistry.getLesson(theme.id, 2)!);
      }
      expect(days.length, 26);

      final results = ContentValidator.validateAllLessonDays(
        days,
        batchLabel: 'CI_ALL_26_DAYS',
        printPerDay: false,
        printSummary: true,
        throwOnAnyError: true,
      );
      expect(results.length, 26);
      for (final r in results) {
        expect(r.errors, isEmpty, reason: '${r.label}: ${r.errors}');
      }
    });

    test('mỗi day có ≥ 4 phase và đủ 5 loại phaseType cơ bản', () {
      final themes = AllThemesRegistry.getAllThemes();
      for (final theme in themes) {
        for (final dayNum in [1, 2]) {
          final day = AllThemesRegistry.getLesson(theme.id, dayNum)!;
          expect(
            day.phases.length,
            greaterThanOrEqualTo(4),
            reason: '${day.id} quá ít phase',
          );

          final types = day.phases.map((p) => p.phaseTypeStr).toSet();
          // Các phase bắt buộc trong luồng học
          expect(
            types.contains('read_listen') || types.contains('listening_quiz'),
            isTrue,
            reason: '${day.id} thiếu phase nghe',
          );
          expect(
            types.contains('mind_game'),
            isTrue,
            reason: '${day.id} thiếu mind_game',
          );
        }
      }
    });

    test('quiz có câu hỏi hợp lệ (correctIndex trong bounds)', () {
      final themes = AllThemesRegistry.getAllThemes();
      var quizCount = 0;
      for (final theme in themes) {
        for (final dayNum in [1, 2]) {
          final day = AllThemesRegistry.getLesson(theme.id, dayNum)!;
          for (final phase in day.phases) {
            final questions = phase.questions;
            if (questions == null) continue;
            for (final q in questions) {
              quizCount++;
              expect(q.options.length, greaterThanOrEqualTo(2),
                  reason: '${q.id}: options < 2');
              expect(
                q.correctIndex,
                inInclusiveRange(0, q.options.length - 1),
                reason: '${q.id}: correctIndex ngoài bounds',
              );
              expect(q.questionText, isNotEmpty);
            }
          }
        }
      }
      expect(quizCount, greaterThanOrEqualTo(100),
          reason: 'Cần ≥100 câu quiz cho 26 bài');
    });
  });
}
