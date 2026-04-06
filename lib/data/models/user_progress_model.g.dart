// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_progress_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserGoalAdapter extends TypeAdapter<UserGoal> {
  @override
  final int typeId = 6;

  @override
  UserGoal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserGoal(
      description: fields[0] as String,
      targetScore: fields[1] as int,
      targetDate: fields[2] as DateTime,
      dailyMinutes: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, UserGoal obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.targetScore)
      ..writeByte(2)
      ..write(obj.targetDate)
      ..writeByte(3)
      ..write(obj.dailyMinutes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserGoalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserProgressModelAdapter extends TypeAdapter<UserProgressModel> {
  @override
  final int typeId = 7;

  @override
  UserProgressModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserProgressModel(
      userId: fields[0] as String,
      currentStreak: fields[1] as int,
      longestStreak: fields[2] as int,
      lastStudyDate: fields[3] as DateTime?,
      themeProgress: (fields[4] as Map?)?.cast<String, double>(),
      completedLessons: (fields[5] as List?)?.cast<String>(),
      totalWordsLearned: fields[6] as int,
      totalStudyMinutes: fields[7] as int,
      streakFreezesUsedThisWeek: fields[8] as int,
      earnedBadges: (fields[9] as List?)?.cast<String>(),
      totalXP: fields[10] as int,
      goal: fields[11] as UserGoal?,
    );
  }

  @override
  void write(BinaryWriter writer, UserProgressModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.currentStreak)
      ..writeByte(2)
      ..write(obj.longestStreak)
      ..writeByte(3)
      ..write(obj.lastStudyDate)
      ..writeByte(4)
      ..write(obj.themeProgress)
      ..writeByte(5)
      ..write(obj.completedLessons)
      ..writeByte(6)
      ..write(obj.totalWordsLearned)
      ..writeByte(7)
      ..write(obj.totalStudyMinutes)
      ..writeByte(8)
      ..write(obj.streakFreezesUsedThisWeek)
      ..writeByte(9)
      ..write(obj.earnedBadges)
      ..writeByte(10)
      ..write(obj.totalXP)
      ..writeByte(11)
      ..write(obj.goal);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserProgressModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
