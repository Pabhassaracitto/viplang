import 'package:hive/hive.dart';

import 'mixed_segment_model.dart';

part 'lesson_model.g.dart';

enum PhaseType { readListen, translate, mindGame, vocabulary, listeningQuiz }

@HiveType(typeId: 3)
class QuizQuestion {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String questionText;

  @HiveField(2)
  final List<String> options;

  @HiveField(3)
  final int correctIndex;

  @HiveField(4)
  final String? audioTrackKey;

  @HiveField(5)
  final String practiceNumber; // 'practice1', 'practice2', 'practice3'

  @HiveField(6)
  final String? transcriptEn;

  @HiveField(7)
  final String? transcriptVi;

  const QuizQuestion({
    required this.id,
    required this.questionText,
    required this.options,
    required this.correctIndex,
    this.audioTrackKey,
    required this.practiceNumber,
    this.transcriptEn,
    this.transcriptVi,
  });
}

@HiveType(typeId: 4)
class LessonPhase {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String phaseTypeStr;

  @HiveField(2)
  final String? titleEn;

  @HiveField(3)
  final String? titleVi;

  @HiveField(4)
  final String? contentEn;

  @HiveField(5)
  final String? contentVi;

  @HiveField(6)
  final String? audioTrackKey;

  @HiveField(7)
  final List<MixedSegment>? mixedSegments;

  @HiveField(8)
  final List<QuizQuestion>? questions;

  @HiveField(9)
  bool isCompleted;

  @HiveField(10)
  final List<dynamic>? fabVocab; // List<FabVocabItem>

  @HiveField(11)
  final List<dynamic>? fabPhrases; // List<FabPhraseItem>

  @HiveField(12)
  final List<dynamic>? fabAnswers; // List<FabAnswerItem>

  PhaseType get phaseType {
    switch (phaseTypeStr) {
      case 'read_listen':
        return PhaseType.readListen;
      case 'translate':
        return PhaseType.translate;
      case 'mind_game':
        return PhaseType.mindGame;
      case 'vocabulary':
        return PhaseType.vocabulary;
      case 'listening_quiz':
        return PhaseType.listeningQuiz;
      default:
        return PhaseType.readListen;
    }
  }

  LessonPhase({
    required this.id,
    required this.phaseTypeStr,
    this.titleEn,
    this.titleVi,
    this.contentEn,
    this.contentVi,
    this.audioTrackKey,
    this.mixedSegments,
    this.questions,
    this.isCompleted = false,
    this.fabVocab,
    this.fabPhrases,
    this.fabAnswers,
  });
}

@HiveType(typeId: 5)
class LessonDay {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final int dayNumber;

  @HiveField(2)
  final String themeId;

  @HiveField(3)
  final String titleVi;

  @HiveField(4)
  final List<LessonPhase> phases;

  @HiveField(5)
  bool isCompleted;

  @HiveField(6)
  DateTime? completedAt;

  @HiveField(7)
  int currentPhaseIndex;

  LessonDay({
    required this.id,
    required this.dayNumber,
    required this.themeId,
    required this.titleVi,
    required this.phases,
    this.isCompleted = false,
    this.completedAt,
    this.currentPhaseIndex = 0,
  });

  double get progressPercent => phases.isEmpty
      ? 0
      : phases.where((p) => p.isCompleted).length / phases.length;
}

@HiveType(typeId: 8)
class FabVocabItem {
  @HiveField(0)
  final String wordEn;
  @HiveField(1)
  final String wordVi;
  @HiveField(2)
  final String pronunciation;
  @HiveField(3)
  final String partOfSpeech;

  const FabVocabItem({
    required this.wordEn,
    required this.wordVi,
    required this.pronunciation,
    required this.partOfSpeech,
  });
}

@HiveType(typeId: 9)
class FabPhraseItem {
  @HiveField(0)
  final String phrase;
  @HiveField(1)
  final String meaning;

  const FabPhraseItem({required this.phrase, required this.meaning});
}

@HiveType(typeId: 10)
class FabAnswerItem {
  @HiveField(0)
  final String en;
  @HiveField(1)
  final String vi;

  const FabAnswerItem({required this.en, required this.vi});
}
