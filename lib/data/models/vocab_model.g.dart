// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocab_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VocabModelAdapter extends TypeAdapter<VocabModel> {
  @override
  final int typeId = 2;

  @override
  VocabModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VocabModel(
      id: fields[0] as String,
      wordEn: fields[1] as String,
      wordVi: fields[2] as String,
      pronunciation: fields[3] as String,
      partOfSpeech: fields[4] as String,
      themeId: fields[5] as String,
      exampleEn: fields[6] as String?,
      exampleVi: fields[7] as String?,
      repetitionCount: fields[8] as int,
      easeFactor: fields[9] as double,
      intervalDays: fields[10] as int,
      nextReview: fields[11] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, VocabModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.wordEn)
      ..writeByte(2)
      ..write(obj.wordVi)
      ..writeByte(3)
      ..write(obj.pronunciation)
      ..writeByte(4)
      ..write(obj.partOfSpeech)
      ..writeByte(5)
      ..write(obj.themeId)
      ..writeByte(6)
      ..write(obj.exampleEn)
      ..writeByte(7)
      ..write(obj.exampleVi)
      ..writeByte(8)
      ..write(obj.repetitionCount)
      ..writeByte(9)
      ..write(obj.easeFactor)
      ..writeByte(10)
      ..write(obj.intervalDays)
      ..writeByte(11)
      ..write(obj.nextReview);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VocabModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
