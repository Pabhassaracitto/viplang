import 'package:hive/hive.dart';

part 'vocab_model.g.dart';

@HiveType(typeId: 2)
class VocabModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String wordEn;

  @HiveField(2)
  final String wordVi;

  @HiveField(3)
  final String pronunciation;

  @HiveField(4)
  final String partOfSpeech;

  @HiveField(5)
  final String themeId;

  @HiveField(6)
  final String? exampleEn;

  @HiveField(7)
  final String? exampleVi;

  // SRS Fields
  @HiveField(8)
  int repetitionCount;

  @HiveField(9)
  double easeFactor;

  @HiveField(10)
  int intervalDays;

  @HiveField(11)
  DateTime? nextReview;

  VocabModel({
    required this.id,
    required this.wordEn,
    required this.wordVi,
    required this.pronunciation,
    required this.partOfSpeech,
    required this.themeId,
    this.exampleEn,
    this.exampleVi,
    this.repetitionCount = 0,
    this.easeFactor = 2.5,
    this.intervalDays = 1,
    this.nextReview,
  });

  bool get isDueForReview {
    if (nextReview == null) return true;
    return DateTime.now().isAfter(nextReview!);
  }

  VocabModel copyWith({
    int? repetitionCount,
    double? easeFactor,
    int? intervalDays,
    DateTime? nextReview,
  }) {
    return VocabModel(
      id: id,
      wordEn: wordEn,
      wordVi: wordVi,
      pronunciation: pronunciation,
      partOfSpeech: partOfSpeech,
      themeId: themeId,
      exampleEn: exampleEn,
      exampleVi: exampleVi,
      repetitionCount: repetitionCount ?? this.repetitionCount,
      easeFactor: easeFactor ?? this.easeFactor,
      intervalDays: intervalDays ?? this.intervalDays,
      nextReview: nextReview ?? this.nextReview,
    );
  }
}
