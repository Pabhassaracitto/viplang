import '../models/lesson_model.dart';

class ContentValidationResult {
  final String label;
  final List<String> errors;
  final List<String> warnings;

  const ContentValidationResult({
    required this.label,
    required this.errors,
    required this.warnings,
  });

  bool get hasErrors => errors.isNotEmpty;
  bool get hasWarnings => warnings.isNotEmpty;
}

class ContentValidator {
  /// Validate 1 LessonDay.
  ///
  /// - [printResult] = true -> in log ngay cho day này
  /// - [throwOnError] = true -> throw ngay nếu day này có lỗi
  ///
  /// Mặc định KHÔNG throw để có thể quét hết toàn bộ content.
  static ContentValidationResult validateLessonDay(
    LessonDay day, {
    String? label,
    bool printResult = true,
    bool throwOnError = false,
  }) {
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

    final result = ContentValidationResult(
      label: dayLabel,
      errors: List.unmodifiable(errors),
      warnings: List.unmodifiable(warnings),
    );

    if (printResult) {
      _printDayResult(result);
    }

    if (throwOnError && result.hasErrors) {
      throw AssertionError(_buildDayErrorMessage(result));
    }

    return result;
  }

  /// Validate toàn bộ các LessonDay và chỉ throw 1 lần ở cuối.
  static List<ContentValidationResult> validateAllLessonDays(
    Iterable<LessonDay> days, {
    String batchLabel = 'ALL_DAYS',
    bool printPerDay = true,
    bool printSummary = true,
    bool throwOnAnyError = true,
  }) {
    final results = <ContentValidationResult>[];

    for (final day in days) {
      final result = validateLessonDay(
        day,
        printResult: printPerDay,
        throwOnError: false,
      );
      results.add(result);
    }

    final allErrors = <String>[];
    final allWarnings = <String>[];

    for (final result in results) {
      allErrors.addAll(result.errors);
      allWarnings.addAll(result.warnings);
    }

    if (printSummary) {
      // ignore: avoid_print
      print(
        '[ContentValidator][SUMMARY][$batchLabel] '
        'days=${results.length}, warnings=${allWarnings.length}, errors=${allErrors.length}',
      );
    }

    if (throwOnAnyError && allErrors.isNotEmpty) {
      final msg =
          '[ContentValidator][SUMMARY_ERROR][$batchLabel]\n- ${allErrors.join('\n- ')}';
      // ignore: avoid_print
      print(msg);
      throw AssertionError(msg);
    }

    return results;
  }

  static void _printDayResult(ContentValidationResult result) {
    if (result.hasWarnings) {
      // ignore: avoid_print
      print(
        '[ContentValidator][WARN][${result.label}]\n- ${result.warnings.join('\n- ')}',
      );
    }

    if (result.hasErrors) {
      // ignore: avoid_print
      print(
        '[ContentValidator][ERROR][${result.label}]\n- ${result.errors.join('\n- ')}',
      );
    } else {
      // ignore: avoid_print
      print('[ContentValidator][OK] ${result.label}');
    }
  }

  static String _buildDayErrorMessage(ContentValidationResult result) {
    return '[ContentValidator][ERROR][${result.label}]\n- ${result.errors.join('\n- ')}';
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
