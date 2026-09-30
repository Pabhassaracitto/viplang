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

      if (phase.phaseTypeStr == 'read_listen' ||
          phase.phaseTypeStr == 'translate') {
        validateBilingualPhase(
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
        // Hợp lệ khi 1 cụm VI có nhiều EN theo ngữ cảnh
        // (vd. "Để nghe" → "To hear" / "To listen to").
        // Match theo cặp (vi,en) trong list vẫn đúng → warning.
        warnings.add(
          '$phaseLabel: Duplicate FabAnswerItem.vi="$key" with different en '
          'values ("${map[key]}" vs "$val") — dùng cặp theo ngữ cảnh.',
        );
      }

      map[key] = val;
    }

    // 3) Every VI segment must match a FabAnswerItem.
    //    Convention data KHÔNG nhất quán giữa các theme:
    //    - theme1: MixedSegment.vietnamese(EN, VI)  → text=EN, answer=VI
    //    - theme2–13: MixedSegment.vietnamese(VI, EN) → text=VI, answer=EN
    //    UI tự nhận diện bằng _isVietnamese(); validator cũng phải khớp cả 2 chiều:
    //    segment (text, answer) khớp item (vi, en) nếu {text,answer} == {vi,en}
    //    đúng phía ngôn ngữ.
    for (final s in viSegments) {
      final t = s.text.trim();
      final a = (s.answer ?? '').trim();

      bool matched = false;
      for (final item in fabAnswers) {
        final vi = item.vi.trim();
        final en = item.en.trim();
        if ((vi == t && en == a) || (vi == a && en == t)) {
          matched = true;
          break;
        }
      }

      if (!matched) {
        // Phân biệt "thiếu item" vs "sai đáp án" để message rõ hơn
        final hasViOnEitherSide = map.containsKey(t) || map.containsKey(a);
        if (hasViOnEitherSide) {
          errors.add(
            '$phaseLabel: Answer mismatch for "$t" / "$a" vs fabAnswers.',
          );
        } else {
          errors.add(
            '$phaseLabel: Missing FabAnswerItem for segment '
            '"$t" ↔ "$a".',
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

  /// Tách nội dung song ngữ thành các đoạn (bỏ đoạn rỗng).
  ///
  /// Dùng CHUNG với `PhaseReadListenScreen` / `PhaseTranslateScreen` để
  /// validator đếm đúng số đoạn mà UI sẽ render.
  static List<String> splitParagraphs(String? content) {
    if (content == null) return const [];
    return content
        .replaceAll('\r\n', '\n')
        .split('\n\n')
        .map((p) => p.trim())
        .where((p) => p.isNotEmpty)
        .toList();
  }

  /// Kiểm tra phase song ngữ (read_listen / translate).
  ///
  /// UI ghép cặp đoạn EN[i] ↔ VI[i], nên lệch số đoạn sẽ khiến học viên thấy
  /// đoạn tiếng Anh không khớp bản dịch (hoặc mất hẳn bản dịch cuối bài).
  static void validateBilingualPhase(
    LessonPhase phase, {
    required String dayLabel,
    required List<String> errors,
    required List<String> warnings,
  }) {
    final phaseLabel = '$dayLabel / ${phase.id}';

    final en = splitParagraphs(phase.contentEn);
    final vi = splitParagraphs(phase.contentVi);

    // Phase không có nội dung chữ (chỉ audio) → bỏ qua.
    if (en.isEmpty && vi.isEmpty) return;

    if (en.isEmpty) {
      errors.add('$phaseLabel: contentEn trống nhưng contentVi có nội dung.');
      return;
    }
    if (vi.isEmpty) {
      errors.add('$phaseLabel: contentVi trống nhưng contentEn có nội dung.');
      return;
    }

    if (en.length != vi.length) {
      errors.add(
        '$phaseLabel: lệch số đoạn EN/VI (EN=${en.length}, VI=${vi.length}) — '
        'UI ghép cặp theo thứ tự đoạn nên bản dịch sẽ hiển thị sai đoạn.',
      );
    }

    // Dấu phân cách sót lại từ lúc soạn nội dung (---, ***, ===)
    for (final block in [...en, ...vi]) {
      if (RegExp(r'^\s*(-{3,}|\*{3,}|={3,})\s*$', multiLine: true)
          .hasMatch(block)) {
        errors.add(
          '$phaseLabel: còn dấu phân cách thô (--- / *** / ===) trong nội dung.',
        );
        break;
      }
    }

    // Đoạn dài bất thường thường là dấu hiệu gộp nhầm 2 đoạn vào 1.
    for (var i = 0; i < en.length && i < vi.length; i++) {
      final ratio = vi[i].length / en[i].length;
      if (ratio > 3.0 || ratio < 0.34) {
        warnings.add(
          '$phaseLabel: đoạn ${i + 1} lệch độ dài bất thường '
          '(EN=${en[i].length} ký tự, VI=${vi[i].length} ký tự) — '
          'kiểm tra lại xem có gộp/thiếu câu không.',
        );
      }
    }
  }
}
