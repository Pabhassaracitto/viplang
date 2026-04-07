class MixedSegment {
  final String text;
  final bool isVietnamese;
  final String? answer; // Only for Vietnamese segments

  const MixedSegment({
    required this.text,
    this.isVietnamese = false,
    this.answer,
  });

  // Factory constructors for convenience and const correctness
  const MixedSegment.english(String text)
    : this(text: text, isVietnamese: false);
  const MixedSegment.vietnamese(String text, String answer)
    : this(text: text, isVietnamese: true, answer: answer);
}

class MixedParagraph {
  final List<MixedSegment> segments;

  const MixedParagraph({required this.segments});
}
