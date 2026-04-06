// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuizQuestionAdapter extends TypeAdapter<QuizQuestion> {
  @override
  final int typeId = 3;

  @override
  QuizQuestion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuizQuestion(
      id: fields[0] as String,
      questionText: fields[1] as String,
      options: (fields[2] as List).cast<String>(),
      correctIndex: fields[3] as int,
      audioTrackKey: fields[4] as String?,
      practiceNumber: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, QuizQuestion obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.questionText)
      ..writeByte(2)
      ..write(obj.options)
      ..writeByte(3)
      ..write(obj.correctIndex)
      ..writeByte(4)
      ..write(obj.audioTrackKey)
      ..writeByte(5)
      ..write(obj.practiceNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuizQuestionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LessonPhaseAdapter extends TypeAdapter<LessonPhase> {
  @override
  final int typeId = 4;

  @override
  LessonPhase read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LessonPhase(
      id: fields[0] as String,
      phaseTypeStr: fields[1] as String,
      titleEn: fields[2] as String?,
      titleVi: fields[3] as String?,
      contentEn: fields[4] as String?,
      contentVi: fields[5] as String?,
      audioTrackKey: fields[6] as String?,
      mixedSegments: (fields[7] as List?)?.cast<MixedSegment>(),
      questions: (fields[8] as List?)?.cast<QuizQuestion>(),
      isCompleted: fields[9] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, LessonPhase obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.phaseTypeStr)
      ..writeByte(2)
      ..write(obj.titleEn)
      ..writeByte(3)
      ..write(obj.titleVi)
      ..writeByte(4)
      ..write(obj.contentEn)
      ..writeByte(5)
      ..write(obj.contentVi)
      ..writeByte(6)
      ..write(obj.audioTrackKey)
      ..writeByte(7)
      ..write(obj.mixedSegments)
      ..writeByte(8)
      ..write(obj.questions)
      ..writeByte(9)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LessonPhaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LessonDayAdapter extends TypeAdapter<LessonDay> {
  @override
  final int typeId = 5;

  @override
  LessonDay read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LessonDay(
      id: fields[0] as String,
      dayNumber: fields[1] as int,
      themeId: fields[2] as String,
      titleVi: fields[3] as String,
      phases: (fields[4] as List).cast<LessonPhase>(),
      isCompleted: fields[5] as bool,
      completedAt: fields[6] as DateTime?,
      currentPhaseIndex: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, LessonDay obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.dayNumber)
      ..writeByte(2)
      ..write(obj.themeId)
      ..writeByte(3)
      ..write(obj.titleVi)
      ..writeByte(4)
      ..write(obj.phases)
      ..writeByte(5)
      ..write(obj.isCompleted)
      ..writeByte(6)
      ..write(obj.completedAt)
      ..writeByte(7)
      ..write(obj.currentPhaseIndex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LessonDayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
