import '../models/lesson_model.dart';
import '../models/mixed_segment_model.dart';

class ContentValidator {
  static void validateLessonDay(LessonDay day, {String? label}) {
    final dayLabel = label ?? day.id;
    final errors = <String>[];
    final warnings = <String>[];

    for (final phase in day.phases) {
      if (phase.phaseTypeStr == 'mind_game') {
        _validateMindGamePhase(
          phase,
          dayLabel: dayLabel,
          errors: errors,
          warnings: warnings,
        );
      }
    }

    if (warnings.isNotEmpty) {
      // ignore: avoid_print
      print('[ContentValidator][WARN][$dayLabel]\n- ${warnings.join('\n- ')}');
    }

    if (errors.isNotEmpty) {
      final msg =
          '[ContentValidator][ERROR][$dayLabel]\n- ${errors.join('\n- ')}';
      // ignore: avoid_print
      print(msg);
      throw AssertionError(msg);
    } else {
      // ignore: avoid_print
      print('[ContentValidator][OK] $dayLabel');
    }
  }

  static void _validateMindGamePhase(
    LessonPhase phase, {
    required String dayLabel,
    required List<String> errors,
    required List<String> warnings,
  }) {
    final phaseLabel = '$dayLabel / ${phase.id}';

    final segments = phase.mixedSegments;
    if (segments == null || segments.isEmpty) {
      errors.add('$phaseLabel: mixedSegments is null/empty.');
      return;
    }

    final viSegments = segments.where((s) => s.isVietnamese).toList();
    if (viSegments.isEmpty) {
      warnings.add('$phaseLabel: no Vietnamese segments found.');
    }

    // 1) Every Vietnamese segment must have answer
    for (final s in viSegments) {
      if (s.answer == null || s.answer!.trim().isEmpty) {
        errors.add(
          '$phaseLabel: Vietnamese segment "${s.text}" has empty answer.',
        );
      }
    }

    // 2) fabAnswers must exist and contain FabAnswerItem
    final fabAnswersRaw = phase.fabAnswers;
    if (fabAnswersRaw == null || fabAnswersRaw.isEmpty) {
      errors.add(
        '$phaseLabel: fabAnswers is null/empty (required for mind_game).',
      );
      return;
    }

    final fabAnswers = fabAnswersRaw.whereType<FabAnswerItem>().toList();
    if (fabAnswers.isEmpty) {
      errors.add(
        '$phaseLabel: fabAnswers has no FabAnswerItem (type mismatch).',
      );
      return;
    }

    // Build map vi -> en from fabAnswers
    final map = <String, String>{};
    for (final a in fabAnswers) {
      final key = a.vi.trim();
      final val = a.en.trim();
      if (key.isEmpty || val.isEmpty) {
        errors.add(
          '$phaseLabel: FabAnswerItem has empty vi/en: vi="${a.vi}", en="${a.en}".',
        );
        continue;
      }
      if (map.containsKey(key) && map[key] != val) {
        errors.add(
          '$phaseLabel: Duplicate FabAnswerItem.vi="$key" with different en values.',
        );
      }
      map[key] = val;
    }

    // 3) Every VI segment must exist in fabAnswers and match answer
    for (final s in viSegments) {
      final key = s.text.trim();
      final expected = map[key];
      if (expected == null) {
        errors.add(
          '$phaseLabel: Missing FabAnswerItem for Vietnamese segment "$key".',
        );
      } else {
        final actual = (s.answer ?? '').trim();
        if (actual != expected) {
          errors.add(
            '$phaseLabel: Answer mismatch for "$key": segment.answer="$actual" vs fabAnswers.en="$expected".',
          );
        }
      }
    }

    // 4) Warning: extra fabAnswers not used
    final viSet = viSegments.map((e) => e.text.trim()).toSet();
    for (final a in fabAnswers) {
      if (!viSet.contains(a.vi.trim())) {
        warnings.add(
          '$phaseLabel: Extra FabAnswerItem not used in segments: "${a.vi}"',
        );
      }
    }
  }
}
