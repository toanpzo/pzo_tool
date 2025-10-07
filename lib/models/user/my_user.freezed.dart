// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyUser _$MyUserFromJson(Map<String, dynamic> json) {
  return _MyUser.fromJson(json);
}

/// @nodoc
mixin _$MyUser {
  @JsonKey(name: 'id')
  @HiveField(4)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  @HiveField(0)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'age')
  @HiveField(1)
  int? get age => throw _privateConstructorUsedError;
  @JsonKey(name: 'vip')
  @HiveField(2)
  bool get vip => throw _privateConstructorUsedError;
  @JsonKey(name: 'vipExd')
  @HiveField(3)
  DateTime? get vipExd => throw _privateConstructorUsedError;
  @JsonKey(name: 'userName')
  @HiveField(5)
  String? get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'pass')
  @HiveField(6)
  String? get pass => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  @HiveField(7)
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  @HiveField(8)
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'crud')
  @HiveField(9)
  int get crud => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyUserCopyWith<MyUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyUserCopyWith<$Res> {
  factory $MyUserCopyWith(MyUser value, $Res Function(MyUser) then) =
      _$MyUserCopyWithImpl<$Res, MyUser>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(4) String? id,
      @JsonKey(name: 'name') @HiveField(0) String? name,
      @JsonKey(name: 'age') @HiveField(1) int? age,
      @JsonKey(name: 'vip') @HiveField(2) bool vip,
      @JsonKey(name: 'vipExd') @HiveField(3) DateTime? vipExd,
      @JsonKey(name: 'userName') @HiveField(5) String? userName,
      @JsonKey(name: 'pass') @HiveField(6) String? pass,
      @JsonKey(name: 'email') @HiveField(7) String? email,
      @JsonKey(name: 'address') @HiveField(8) String? address,
      @JsonKey(name: 'crud') @HiveField(9) int crud});
}

/// @nodoc
class _$MyUserCopyWithImpl<$Res, $Val extends MyUser>
    implements $MyUserCopyWith<$Res> {
  _$MyUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? age = freezed,
    Object? vip = null,
    Object? vipExd = freezed,
    Object? userName = freezed,
    Object? pass = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? crud = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      vip: null == vip
          ? _value.vip
          : vip // ignore: cast_nullable_to_non_nullable
              as bool,
      vipExd: freezed == vipExd
          ? _value.vipExd
          : vipExd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      pass: freezed == pass
          ? _value.pass
          : pass // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      crud: null == crud
          ? _value.crud
          : crud // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyUserImplCopyWith<$Res> implements $MyUserCopyWith<$Res> {
  factory _$$MyUserImplCopyWith(
          _$MyUserImpl value, $Res Function(_$MyUserImpl) then) =
      __$$MyUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(4) String? id,
      @JsonKey(name: 'name') @HiveField(0) String? name,
      @JsonKey(name: 'age') @HiveField(1) int? age,
      @JsonKey(name: 'vip') @HiveField(2) bool vip,
      @JsonKey(name: 'vipExd') @HiveField(3) DateTime? vipExd,
      @JsonKey(name: 'userName') @HiveField(5) String? userName,
      @JsonKey(name: 'pass') @HiveField(6) String? pass,
      @JsonKey(name: 'email') @HiveField(7) String? email,
      @JsonKey(name: 'address') @HiveField(8) String? address,
      @JsonKey(name: 'crud') @HiveField(9) int crud});
}

/// @nodoc
class __$$MyUserImplCopyWithImpl<$Res>
    extends _$MyUserCopyWithImpl<$Res, _$MyUserImpl>
    implements _$$MyUserImplCopyWith<$Res> {
  __$$MyUserImplCopyWithImpl(
      _$MyUserImpl _value, $Res Function(_$MyUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? age = freezed,
    Object? vip = null,
    Object? vipExd = freezed,
    Object? userName = freezed,
    Object? pass = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? crud = null,
  }) {
    return _then(_$MyUserImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      vip: null == vip
          ? _value.vip
          : vip // ignore: cast_nullable_to_non_nullable
              as bool,
      vipExd: freezed == vipExd
          ? _value.vipExd
          : vipExd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      pass: freezed == pass
          ? _value.pass
          : pass // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      crud: null == crud
          ? _value.crud
          : crud // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 9, adapterName: 'MyUserAdapter')
class _$MyUserImpl implements _MyUser {
  const _$MyUserImpl(
      {@JsonKey(name: 'id') @HiveField(4) this.id,
      @JsonKey(name: 'name') @HiveField(0) this.name,
      @JsonKey(name: 'age') @HiveField(1) this.age,
      @JsonKey(name: 'vip') @HiveField(2) this.vip = false,
      @JsonKey(name: 'vipExd') @HiveField(3) this.vipExd,
      @JsonKey(name: 'userName') @HiveField(5) this.userName,
      @JsonKey(name: 'pass') @HiveField(6) this.pass,
      @JsonKey(name: 'email') @HiveField(7) this.email,
      @JsonKey(name: 'address') @HiveField(8) this.address,
      @JsonKey(name: 'crud') @HiveField(9) this.crud = 0});

  factory _$MyUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyUserImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  @HiveField(4)
  final String? id;
  @override
  @JsonKey(name: 'name')
  @HiveField(0)
  final String? name;
  @override
  @JsonKey(name: 'age')
  @HiveField(1)
  final int? age;
  @override
  @JsonKey(name: 'vip')
  @HiveField(2)
  final bool vip;
  @override
  @JsonKey(name: 'vipExd')
  @HiveField(3)
  final DateTime? vipExd;
  @override
  @JsonKey(name: 'userName')
  @HiveField(5)
  final String? userName;
  @override
  @JsonKey(name: 'pass')
  @HiveField(6)
  final String? pass;
  @override
  @JsonKey(name: 'email')
  @HiveField(7)
  final String? email;
  @override
  @JsonKey(name: 'address')
  @HiveField(8)
  final String? address;
  @override
  @JsonKey(name: 'crud')
  @HiveField(9)
  final int crud;

  @override
  String toString() {
    return 'MyUser(id: $id, name: $name, age: $age, vip: $vip, vipExd: $vipExd, userName: $userName, pass: $pass, email: $email, address: $address, crud: $crud)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.vip, vip) || other.vip == vip) &&
            (identical(other.vipExd, vipExd) || other.vipExd == vipExd) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.pass, pass) || other.pass == pass) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.crud, crud) || other.crud == crud));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, age, vip, vipExd,
      userName, pass, email, address, crud);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyUserImplCopyWith<_$MyUserImpl> get copyWith =>
      __$$MyUserImplCopyWithImpl<_$MyUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyUserImplToJson(
      this,
    );
  }
}

abstract class _MyUser implements MyUser {
  const factory _MyUser(
      {@JsonKey(name: 'id') @HiveField(4) final String? id,
      @JsonKey(name: 'name') @HiveField(0) final String? name,
      @JsonKey(name: 'age') @HiveField(1) final int? age,
      @JsonKey(name: 'vip') @HiveField(2) final bool vip,
      @JsonKey(name: 'vipExd') @HiveField(3) final DateTime? vipExd,
      @JsonKey(name: 'userName') @HiveField(5) final String? userName,
      @JsonKey(name: 'pass') @HiveField(6) final String? pass,
      @JsonKey(name: 'email') @HiveField(7) final String? email,
      @JsonKey(name: 'address') @HiveField(8) final String? address,
      @JsonKey(name: 'crud') @HiveField(9) final int crud}) = _$MyUserImpl;

  factory _MyUser.fromJson(Map<String, dynamic> json) = _$MyUserImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  @HiveField(4)
  String? get id;
  @override
  @JsonKey(name: 'name')
  @HiveField(0)
  String? get name;
  @override
  @JsonKey(name: 'age')
  @HiveField(1)
  int? get age;
  @override
  @JsonKey(name: 'vip')
  @HiveField(2)
  bool get vip;
  @override
  @JsonKey(name: 'vipExd')
  @HiveField(3)
  DateTime? get vipExd;
  @override
  @JsonKey(name: 'userName')
  @HiveField(5)
  String? get userName;
  @override
  @JsonKey(name: 'pass')
  @HiveField(6)
  String? get pass;
  @override
  @JsonKey(name: 'email')
  @HiveField(7)
  String? get email;
  @override
  @JsonKey(name: 'address')
  @HiveField(8)
  String? get address;
  @override
  @JsonKey(name: 'crud')
  @HiveField(9)
  int get crud;
  @override
  @JsonKey(ignore: true)
  _$$MyUserImplCopyWith<_$MyUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
