import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'bank_question.freezed.dart';
part 'bank_question.g.dart';

@Freezed()
@JsonSerializable()
class BankQuestion with _$BankQuestion {

  @HiveType(typeId: 4, adapterName: 'BankQuestionAdapter')
  const factory BankQuestion({
    @JsonKey(name: 'id')
    @HiveField(0)
    required String id,
    @JsonKey(name: 'idTypeQuestion')
    @HiveField(1)
    required String idTypeQuestion,
    @JsonKey(name: 'name')
    @HiveField(2)
    required String name,
  }) = _BankQuestion;
}