// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_color_scheme.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyColorSchemeAdapter extends TypeAdapter<_$MyColorSchemeImpl> {
  @override
  final int typeId = 2;

  @override
  _$MyColorSchemeImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$MyColorSchemeImpl(
      primary: fields[0] as int?,
      onPrimary: fields[1] as int?,
      secondary: fields[2] as int?,
      onSecondary: fields[3] as int?,
      error: fields[4] as int?,
      onError: fields[5] as int?,
      background: fields[6] as int?,
      onBackground: fields[7] as int?,
      surface: fields[8] as int?,
      onSurface: fields[9] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, _$MyColorSchemeImpl obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.primary)
      ..writeByte(1)
      ..write(obj.onPrimary)
      ..writeByte(2)
      ..write(obj.secondary)
      ..writeByte(3)
      ..write(obj.onSecondary)
      ..writeByte(4)
      ..write(obj.error)
      ..writeByte(5)
      ..write(obj.onError)
      ..writeByte(6)
      ..write(obj.background)
      ..writeByte(7)
      ..write(obj.onBackground)
      ..writeByte(8)
      ..write(obj.surface)
      ..writeByte(9)
      ..write(obj.onSurface);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyColorSchemeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyColorSchemeImpl _$$MyColorSchemeImplFromJson(Map<String, dynamic> json) =>
    _$MyColorSchemeImpl(
      primary: json['primary'] as int?,
      onPrimary: json['onPrimary'] as int?,
      secondary: json['secondary'] as int?,
      onSecondary: json['onSecondary'] as int?,
      error: json['error'] as int?,
      onError: json['onError'] as int?,
      background: json['background'] as int?,
      onBackground: json['onBackground'] as int?,
      surface: json['surface'] as int?,
      onSurface: json['onSurface'] as int?,
    );

Map<String, dynamic> _$$MyColorSchemeImplToJson(_$MyColorSchemeImpl instance) =>
    <String, dynamic>{
      'primary': instance.primary,
      'onPrimary': instance.onPrimary,
      'secondary': instance.secondary,
      'onSecondary': instance.onSecondary,
      'error': instance.error,
      'onError': instance.onError,
      'background': instance.background,
      'onBackground': instance.onBackground,
      'surface': instance.surface,
      'onSurface': instance.onSurface,
    };
