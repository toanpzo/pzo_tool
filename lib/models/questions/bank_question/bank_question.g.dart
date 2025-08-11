// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_question.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BankQuestionAdapter extends TypeAdapter<_$BankQuestionImpl> {
  @override
  final int typeId = 4;

  @override
  _$BankQuestionImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$BankQuestionImpl(
      id: fields[0] as String,
      idTypeQuestion: fields[1] as String,
      name: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$BankQuestionImpl obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.idTypeQuestion)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BankQuestionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankQuestionImpl _$$BankQuestionImplFromJson(Map<String, dynamic> json) =>
    _$BankQuestionImpl(
      id: json['id'] as String,
      idTypeQuestion: json['idTypeQuestion'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$BankQuestionImplToJson(_$BankQuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idTypeQuestion': instance.idTypeQuestion,
      'name': instance.name,
    };
