// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThemeModelAdapter extends TypeAdapter<ThemeModel> {
  @override
  final int typeId = 0;

  @override
  ThemeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ThemeModel(
      id: fields[0] as String,
      themeNumber: fields[1] as int,
      titleEn: fields[2] as String,
      titleVi: fields[3] as String,
      description: fields[4] as String,
      iconEmoji: fields[5] as String,
      isUnlocked: fields[6] as bool,
      progressPercent: fields[7] as double,
      completedDays: fields[8] as int,
      totalDays: fields[9] as int,
      lastStudiedAt: fields[10] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, ThemeModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.themeNumber)
      ..writeByte(2)
      ..write(obj.titleEn)
      ..writeByte(3)
      ..write(obj.titleVi)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.iconEmoji)
      ..writeByte(6)
      ..write(obj.isUnlocked)
      ..writeByte(7)
      ..write(obj.progressPercent)
      ..writeByte(8)
      ..write(obj.completedDays)
      ..writeByte(9)
      ..write(obj.totalDays)
      ..writeByte(10)
      ..write(obj.lastStudiedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
