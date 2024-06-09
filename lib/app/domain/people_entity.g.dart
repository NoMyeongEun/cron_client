// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PeopleEntityAdapter extends TypeAdapter<PeopleEntity> {
  @override
  final int typeId = 2;

  @override
  PeopleEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PeopleEntity(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      (fields[4] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, PeopleEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.password)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.gender)
      ..writeByte(4)
      ..write(obj.goal);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PeopleEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
