// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_theme.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyThemeAdapter extends TypeAdapter<_$MyThemeImpl> {
  @override
  final int typeId = 1;

  @override
  _$MyThemeImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$MyThemeImpl(
      brightness: fields[0] as int?,
      primaryColor: fields[1] as int?,
      backgroundColor: fields[2] as int?,
      myColorScheme: fields[3] as MyColorScheme?,
    );
  }

  @override
  void write(BinaryWriter writer, _$MyThemeImpl obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.brightness)
      ..writeByte(1)
      ..write(obj.primaryColor)
      ..writeByte(2)
      ..write(obj.backgroundColor)
      ..writeByte(3)
      ..write(obj.myColorScheme);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyThemeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyThemeImpl _$$MyThemeImplFromJson(Map<String, dynamic> json) =>
    _$MyThemeImpl(
      brightness: json['brightness'] as int?,
      primaryColor: json['primaryColor'] as int?,
      backgroundColor: json['backgroundColor'] as int?,
      myColorScheme: json['myColorScheme'] == null
          ? null
          : MyColorScheme.fromJson(
              json['myColorScheme'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MyThemeImplToJson(_$MyThemeImpl instance) =>
    <String, dynamic>{
      'brightness': instance.brightness,
      'primaryColor': instance.primaryColor,
      'backgroundColor': instance.backgroundColor,
      'myColorScheme': instance.myColorScheme,
    };
