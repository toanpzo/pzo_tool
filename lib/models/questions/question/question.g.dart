// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestionAdapter extends TypeAdapter<_$QuestionImpl> {
  @override
  final int typeId = 6;

  @override
  _$QuestionImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$QuestionImpl(
      idBankQuestion: fields[0] as String,
      numberQuestion: fields[1] as int,
      id: fields[2] as String,
      question: fields[3] as String,
      questionImage: fields[4] as String?,
      answers: (fields[5] as List).cast<Answer>(),
      answerCorrect: fields[6] as Answer?,
    );
  }

  @override
  void write(BinaryWriter writer, _$QuestionImpl obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.idBankQuestion)
      ..writeByte(1)
      ..write(obj.numberQuestion)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.question)
      ..writeByte(4)
      ..write(obj.questionImage)
      ..writeByte(6)
      ..write(obj.answerCorrect)
      ..writeByte(5)
      ..write(obj.answers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionImpl _$$QuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuestionImpl(
      idBankQuestion: json['idBankQuestion'] as String,
      numberQuestion: json['numberQuestion'] as int,
      id: json['id'] as String,
      question: json['question'] as String,
      questionImage: json['questionImage'] as String?,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
      answerCorrect: json['answerCorrect'] == null
          ? null
          : Answer.fromJson(json['answerCorrect'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$QuestionImplToJson(_$QuestionImpl instance) =>
    <String, dynamic>{
      'idBankQuestion': instance.idBankQuestion,
      'numberQuestion': instance.numberQuestion,
      'id': instance.id,
      'question': instance.question,
      'questionImage': instance.questionImage,
      'answers': instance.answers,
      'answerCorrect': instance.answerCorrect,
    };
