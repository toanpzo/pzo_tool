import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'person.freezed.dart';
part 'person.g.dart';

@Freezed()
@JsonSerializable()
class Person with _$Person {

  @HiveType(typeId: 30, adapterName: 'PersonAdapter')
  const factory Person({
    @JsonKey(name: 'name')
    @HiveField(0)
    required String name,
    @JsonKey(name: 'age')
    @HiveField(1)
    required int age,
  }) = _Person;
}