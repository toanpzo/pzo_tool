import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'type_question.freezed.dart';
part 'type_question.g.dart';

@Freezed()
@JsonSerializable()
class TypeQuestion with _$TypeQuestion {

  @HiveType(typeId: 5, adapterName: 'TypeQuestionAdapter')
  const factory TypeQuestion({
    @JsonKey(name: 'id')
    @HiveField(0)
    required String id,
    @JsonKey(name: 'name')
    @HiveField(1)
    required String name,
  }) = _TypeQuestion;
}