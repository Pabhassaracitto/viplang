// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mixed_segment_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MixedSegmentAdapter extends TypeAdapter<MixedSegment> {
  @override
  final int typeId = 2;

  @override
  MixedSegment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MixedSegment(
      text: fields[0] as String,
      segmentTypeStr: fields[1] as String,
      answerEn: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MixedSegment obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.segmentTypeStr)
      ..writeByte(2)
      ..write(obj.answerEn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MixedSegmentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
