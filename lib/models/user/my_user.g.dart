// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyUserAdapter extends TypeAdapter<_$MyUserImpl> {
  @override
  final int typeId = 9;

  @override
  _$MyUserImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$MyUserImpl(
      name: fields[0] as String,
      age: fields[1] as int?,
      vip: fields[2] as bool,
      vipExd: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, _$MyUserImpl obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.vip)
      ..writeByte(3)
      ..write(obj.vipExd);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyUserImpl _$$MyUserImplFromJson(Map<String, dynamic> json) => _$MyUserImpl(
      name: json['name'] as String,
      age: json['age'] as int?,
      vip: json['vip'] as bool,
      vipExd: DateTime.parse(json['vipExd'] as String),
    );

Map<String, dynamic> _$$MyUserImplToJson(_$MyUserImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'vip': instance.vip,
      'vipExd': instance.vipExd.toIso8601String(),
    };
