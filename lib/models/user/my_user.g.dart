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
      id: fields[4] as String?,
      name: fields[0] as String?,
      age: fields[1] as int?,
      vip: fields[2] as bool,
      vipExd: fields[3] as DateTime?,
      userName: fields[5] as String?,
      pass: fields[6] as String?,
      email: fields[7] as String?,
      address: fields[8] as String?,
      crud: fields[9] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$MyUserImpl obj) {
    writer
      ..writeByte(10)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.vip)
      ..writeByte(3)
      ..write(obj.vipExd)
      ..writeByte(5)
      ..write(obj.userName)
      ..writeByte(6)
      ..write(obj.pass)
      ..writeByte(7)
      ..write(obj.email)
      ..writeByte(8)
      ..write(obj.address)
      ..writeByte(9)
      ..write(obj.crud);
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
      id: json['id'] as String?,
      name: json['name'] as String?,
      age: json['age'] as int?,
      vip: json['vip'] as bool? ?? false,
      vipExd: json['vipExd'] == null
          ? null
          : DateTime.parse(json['vipExd'] as String),
      userName: json['userName'] as String?,
      pass: json['pass'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      crud: json['crud'] as int? ?? 0,
    );

Map<String, dynamic> _$$MyUserImplToJson(_$MyUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'vip': instance.vip,
      'vipExd': instance.vipExd?.toIso8601String(),
      'userName': instance.userName,
      'pass': instance.pass,
      'email': instance.email,
      'address': instance.address,
      'crud': instance.crud,
    };
