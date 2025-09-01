// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VersionAdapter extends TypeAdapter<_$VersionImpl> {
  @override
  final int typeId = 10;

  @override
  _$VersionImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$VersionImpl(
      id: fields[4] as String?,
      model: fields[1] as String,
      revision: fields[2] as String,
      revisionDate: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, _$VersionImpl obj) {
    writer
      ..writeByte(4)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.model)
      ..writeByte(2)
      ..write(obj.revision)
      ..writeByte(3)
      ..write(obj.revisionDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VersionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VersionImpl _$$VersionImplFromJson(Map<String, dynamic> json) =>
    _$VersionImpl(
      id: json['id'] as String?,
      model: json['model'] as String,
      revision: json['revision'] as String,
      revisionDate: DateTime.parse(json['revisionDate'] as String),
    );

Map<String, dynamic> _$$VersionImplToJson(_$VersionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'model': instance.model,
      'revision': instance.revision,
      'revisionDate': instance.revisionDate.toIso8601String(),
    };
