// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_hive_database.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserHiveLocalDatabaseAdapter extends TypeAdapter<UserHiveLocalDatabase> {
  @override
  final int typeId = 0;

  @override
  UserHiveLocalDatabase read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserHiveLocalDatabase(
      name: fields[0] as String,
      token: fields[3] as String,
      authenticationStatus: fields[4] as bool,
      phoneNumber: fields[1] as String,
      residentialAddress: fields[5] as String,
      email: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserHiveLocalDatabase obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.phoneNumber)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.token)
      ..writeByte(4)
      ..write(obj.authenticationStatus)
      ..writeByte(5)
      ..write(obj.residentialAddress);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserHiveLocalDatabaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
