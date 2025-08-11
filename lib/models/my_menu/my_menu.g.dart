// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_menu.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyMenuAdapter extends TypeAdapter<_$MyMenuImpl> {
  @override
  final int typeId = 1000;

  @override
  _$MyMenuImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$MyMenuImpl(
      id: fields[0] as String,
      name: fields[1] as String,
      level: fields[2] as int,
      assetImage: fields[3] as String?,
      image: fields[4] as String?,
      routerName: fields[5] as String,
      arguments: fields[6] as Object?,
      colorBox: fields[7] as int?,
      colorImage: fields[8] as int?,
      colorText: fields[9] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, _$MyMenuImpl obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.level)
      ..writeByte(3)
      ..write(obj.assetImage)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.routerName)
      ..writeByte(6)
      ..write(obj.arguments)
      ..writeByte(7)
      ..write(obj.colorBox)
      ..writeByte(8)
      ..write(obj.colorImage)
      ..writeByte(9)
      ..write(obj.colorText);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyMenuAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyMenuImpl _$$MyMenuImplFromJson(Map<String, dynamic> json) => _$MyMenuImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      level: json['level'] as int,
      assetImage: json['assetImage'] as String?,
      image: json['image'] as String?,
      routerName: json['routerName'] as String,
      arguments: json['arguments'],
      colorBox: json['colorBox'] as int?,
      colorImage: json['colorImage'] as int?,
      colorText: json['colorText'] as int?,
    );

Map<String, dynamic> _$$MyMenuImplToJson(_$MyMenuImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'level': instance.level,
      'assetImage': instance.assetImage,
      'image': instance.image,
      'routerName': instance.routerName,
      'arguments': instance.arguments,
      'colorBox': instance.colorBox,
      'colorImage': instance.colorImage,
      'colorText': instance.colorText,
    };
