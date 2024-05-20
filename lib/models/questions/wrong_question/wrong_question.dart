

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:vietjet_tool/models/questions/question/question.dart';

part 'wrong_question.freezed.dart';
part 'wrong_question.g.dart';


@freezed
class WrongQuestion with _$WrongQuestion {

  @HiveType(typeId: 7,adapterName: "WrongQuestionAdapter")
  factory WrongQuestion({
    @HiveField(0)
    required Question questWrong,
    @HiveField(1)
    required int numberMistakes,
    }) = _WrongQuestion;

  factory WrongQuestion.fromJson(Map<String, dynamic> json) => _$WrongQuestionFromJson(json);

}