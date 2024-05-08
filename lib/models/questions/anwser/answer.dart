import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'answer.freezed.dart';
part 'answer.g.dart';

@Freezed()

class Answer with _$Answer {
  @JsonSerializable(explicitToJson: true)

  @HiveType(typeId: 3, adapterName: 'AnswerAdapter')
   factory Answer({
    @JsonKey(name: 'text')
    @HiveField(0)
    required String text,

    @JsonKey(name: 'image')
    @HiveField(1)
     String? image,
  }) = _Answer;

  factory Answer.fromJson(Map<String, Object?> json)
  => _$AnswerFromJson(json);
}