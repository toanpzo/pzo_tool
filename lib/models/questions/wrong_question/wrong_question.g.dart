// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wrong_question.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WrongQuestionAdapter extends TypeAdapter<_$WrongQuestionImpl> {
  @override
  final int typeId = 7;

  @override
  _$WrongQuestionImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$WrongQuestionImpl(
      questWrong: fields[0] as Question,
      numberMistakes: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$WrongQuestionImpl obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.questWrong)
      ..writeByte(1)
      ..write(obj.numberMistakes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WrongQuestionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WrongQuestionImpl _$$WrongQuestionImplFromJson(Map<String, dynamic> json) =>
    _$WrongQuestionImpl(
      questWrong: Question.fromJson(json['questWrong'] as Map<String, dynamic>),
      numberMistakes: json['numberMistakes'] as int,
    );

Map<String, dynamic> _$$WrongQuestionImplToJson(_$WrongQuestionImpl instance) =>
    <String, dynamic>{
      'questWrong': instance.questWrong,
      'numberMistakes': instance.numberMistakes,
    };
