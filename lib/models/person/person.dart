import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:vietjet_tool/models/base_model/base_model.dart';
part 'person.freezed.dart';
part 'person.g.dart';

@Freezed()
class Person with _$Person {
  @JsonSerializable(explicitToJson: true)
  @HiveType(typeId: 30, adapterName: 'PersonAdapter')
  const factory Person({
    @JsonKey(name: 'name') @HiveField(0) required String name,
    @JsonKey(name: 'age') @HiveField(1) required int age,
  }) = _Person;

  factory Person.fromJson(Map<String, Object?> json) => _$PersonFromJson(json);
}
