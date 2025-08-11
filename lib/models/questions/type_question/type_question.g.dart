// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_question.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TypeQuestionAdapter extends TypeAdapter<_$TypeQuestionImpl> {
  @override
  final int typeId = 5;

  @override
  _$TypeQuestionImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$TypeQuestionImpl(
      id: fields[0] as String,
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$TypeQuestionImpl obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypeQuestionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TypeQuestionImpl _$$TypeQuestionImplFromJson(Map<String, dynamic> json) =>
    _$TypeQuestionImpl(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$TypeQuestionImplToJson(_$TypeQuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
