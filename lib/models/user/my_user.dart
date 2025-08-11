import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'my_user.freezed.dart';
part 'my_user.g.dart';

@Freezed()
class MyUser with _$MyUser {
  @JsonSerializable(explicitToJson: true)

  @HiveType(typeId: 9, adapterName: 'MyUserAdapter')
  const factory MyUser({
    @JsonKey(name: 'name')
    @HiveField(0)
     required String name,
    @JsonKey(name: 'age')
    @HiveField(1)
     int? age,
    @JsonKey(name: 'vip')
    @HiveField(2)
    required bool vip,
    @JsonKey(name: 'vipExd')
    @HiveField(3)
    required DateTime vipExd,
  }) = _MyUser;

  factory MyUser.fromJson(Map<String, Object?> json)
  => _$MyUserFromJson(json);
}