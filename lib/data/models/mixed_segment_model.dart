import 'package:hive/hive.dart';

part 'mixed_segment_model.g.dart';

enum SegmentType { english, vietnamese }

@HiveType(typeId: 2)
class MixedSegment {
  @HiveField(0)
  final String text;

  @HiveField(1)
  final String segmentTypeStr; // 'english' | 'vietnamese'

  @HiveField(2)
  final String? answerEn; // Đáp án tiếng Anh

  SegmentType get segmentType =>
      segmentTypeStr == 'vietnamese' ? SegmentType.vietnamese : SegmentType.english;

  const MixedSegment({
    required this.text,
    required this.segmentTypeStr,
    this.answerEn,
  });

  factory MixedSegment.english(String text) => MixedSegment(
        text: text,
        segmentTypeStr: 'english',
      );

  factory MixedSegment.vietnamese(String text, String answer) => MixedSegment(
        text: text,
        segmentTypeStr: 'vietnamese',
        answerEn: answer,
      );
}
