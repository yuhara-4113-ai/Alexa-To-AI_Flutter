// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AIModelAdapter extends TypeAdapter<AIModel> {
  @override
  final int typeId = 1;

  @override
  AIModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AIModel()
      ..type = fields[0] as String
      ..apiKey = fields[1] as String
      ..model = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, AIModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.apiKey)
      ..writeByte(2)
      ..write(obj.model);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AIModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
