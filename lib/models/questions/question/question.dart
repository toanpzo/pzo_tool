

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:vietjet_tool/models/questions/anwser/answer.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@Freezed()
class Question with _$Question {
  //@JsonSerializable(explicitToJson: true)

  @HiveType(typeId: 6, adapterName: 'QuestionAdapter')
  factory Question({
   // @JsonKey(name: 'idBankQuestion')
    @HiveField(0)
    required String idBankQuestion,

   // @JsonKey(name: 'numberQuestion')
    @HiveField(1)
    required int numberQuestion,

    //@JsonKey(name: 'id')
    @HiveField(2)
    required String id,

    //@JsonKey(name: 'question')
    @HiveField(3)
    required String question,

   // @JsonKey(name: 'questionImage')
    @HiveField(4)
     String? questionImage,

   // @JsonKey(name: 'answers')
    @HiveField(5)
    required List<Answer> answers,

   // @JsonKey(name: 'answerCorrect')
    @HiveField(6)
    Answer? answerCorrect,


    // @JsonKey(name: 'answer1Text')
    // @HiveField(4)
    //  String? answer1Text,
    //
    // @JsonKey(name: 'answer1Image')
    // @HiveField(5)
    //  String? answer1Image,
    //
    //
    // @JsonKey(name: 'answer2Text')
    // @HiveField(6)
    //  String? answer2Text,
    //
    // @JsonKey(name: 'answer2Image')
    // @HiveField(7)
    //  String? answer2Image,
    //
    // @JsonKey(name: 'answer3Text')
    // @HiveField(8)
    //  String? answer3Text,
    //
    // @JsonKey(name: 'answer3Image')
    // @HiveField(9)
    //  String? answer3Image,
    //
    // @JsonKey(name: 'answer4Text')
    // @HiveField(10)
    //  String? answer4Text,
    //
    // @JsonKey(name: 'answer4Image')
    // @HiveField(11)
    //  String? answer4Image,
    //
    // @JsonKey(name: 'answer5Text')
    // @HiveField(12)
    //  String? answer5Text,
    //
    // @JsonKey(name: 'answer5Image')
    // @HiveField(13)
    //  String? answer5Image,
    //
    // @JsonKey(name: 'answerCorrect')
    // @HiveField(14)
    //  String? answerCorrect,
  }) = _Question;

  factory Question.fromJson(Map<String, Object?> json)
  => _$QuestionFromJson(json);
}