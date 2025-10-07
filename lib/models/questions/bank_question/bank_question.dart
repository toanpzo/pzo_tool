import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:vietjet_tool/models/base_model/base_model.dart';
part 'bank_question.freezed.dart';
part 'bank_question.g.dart';

@Freezed()
class BankQuestion with _$BankQuestion {
  //@JsonSerializable(explicitToJson: true)

  @HiveType(typeId: 4, adapterName: 'BankQuestionAdapter')
  factory BankQuestion({
    // @JsonKey(name: 'id')
    @HiveField(0) required String id,
    //@JsonKey(name: 'idTypeQuestion')
    @HiveField(1) required String idTypeQuestion,
    // @JsonKey(name: 'name')
    @HiveField(2) required String name,
  }) = _BankQuestion;

  factory BankQuestion.fromJson(Map<String, Object?> json) =>
      _$BankQuestionFromJson(json);
}
