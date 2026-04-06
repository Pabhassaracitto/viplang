import 'package:hive/hive.dart';
import 'mixed_segment_model.dart';

part 'lesson_model.g.dart';

enum PhaseType {
  readListen,
  translate,
  mindGame,
  vocabulary,
  listeningQuiz,
}

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

  const QuizQuestion({
    required this.id,
    required this.questionText,
    required this.options,
    required this.correctIndex,
    this.audioTrackKey,
    required this.practiceNumber,
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

  double get progressPercent =>
      phases.isEmpty ? 0 : phases.where((p) => p.isCompleted).length / phases.length;
}
