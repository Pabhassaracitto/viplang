// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocab_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VocabModelAdapter extends TypeAdapter<VocabModel> {
  @override
  final int typeId = 4;

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
      repetitionCount: fields[7] as int,
      easeFactor: fields[8] as double,
      intervalDays: fields[9] as int,
      nextReview: fields[10] as DateTime?,
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
      ..writeByte(11)
      ..write(obj.exampleVi)
      ..writeByte(7)
      ..write(obj.repetitionCount)
      ..writeByte(8)
      ..write(obj.easeFactor)
      ..writeByte(9)
      ..write(obj.intervalDays)
      ..writeByte(10)
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
