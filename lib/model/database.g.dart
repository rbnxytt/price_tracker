// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DatabaseAdapter extends TypeAdapter<Database> {
  @override
  final int typeId = 1;

  @override
  Database read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Database(
      date: fields[0] as DateTime?,
      szPrice: fields[2] as double?,
      hzPrice: fields[3] as double?,
      mmPrice: fields[4] as double?,
      fsPrice: fields[5] as double?,
    )..gzPrice = fields[1] as double?;
  }

  @override
  void write(BinaryWriter writer, Database obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.gzPrice)
      ..writeByte(2)
      ..write(obj.szPrice)
      ..writeByte(3)
      ..write(obj.hzPrice)
      ..writeByte(4)
      ..write(obj.mmPrice)
      ..writeByte(5)
      ..write(obj.fsPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatabaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
