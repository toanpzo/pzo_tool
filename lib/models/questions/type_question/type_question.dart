import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'type_question.freezed.dart';
part 'type_question.g.dart';

@Freezed()
// @JsonSerializable()//explicitToJson: true)

class TypeQuestion with _$TypeQuestion {
  //@JsonSerializable(explicitToJson: true)

  @HiveType(typeId: 5, adapterName: 'TypeQuestionAdapter')
   factory TypeQuestion({
    //@JsonKey(name: 'id')
    @HiveField(0)
    required String id,
    //@JsonKey(name: 'name')
    @HiveField(1)
    required String name,
  }) = _TypeQuestion;

  factory TypeQuestion.fromJson(Map<String, Object?> json)
  => _$TypeQuestionFromJson(json);
}