import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'my_user.freezed.dart';
part 'my_user.g.dart';

@Freezed()
class MyUser with _$MyUser {
  @JsonSerializable(explicitToJson: true)

  @HiveType(typeId: 9, adapterName: 'MyUserAdapter')
  const factory MyUser({
    @JsonKey(name: 'id')
    @HiveField(4)
      String? id,
    @JsonKey(name: 'name')
    @HiveField(0)
      String? name,
    @JsonKey(name: 'age')
    @HiveField(1)
     int? age,
    @JsonKey(name: 'vip')
    @HiveField(2)
    @Default(false)
     bool vip,
    @JsonKey(name: 'vipExd')
    @HiveField(3)
     DateTime? vipExd,
    @JsonKey(name: 'userName')
    @HiveField(5)
     String? userName,
    @JsonKey(name: 'pass')
    @HiveField(6)
     String? pass,
    @JsonKey(name: 'email')
    @HiveField(7)
     String? email,
    @JsonKey(name: 'address')
    @HiveField(8)
     String? address,
    @JsonKey(name: 'crud')
    @HiveField(9)
    @Default(0)
    int crud,
    

  }) = _MyUser;

  factory MyUser.withDefaults({
    String? id,
    String? name,
    String? userName,
    String? pass
  }) {
    final now = DateTime.now();
    final generatedId = id ?? now.millisecondsSinceEpoch.toString();

    return MyUser(
      id: generatedId,
      name: name ?? generatedId,
      userName: userName ?? generatedId,
      pass: pass ??generatedId

    );
  }

}