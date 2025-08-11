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
  @JsonKey(name: 'name')
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'age')
  @HiveField(1)
  int? get age => throw _privateConstructorUsedError;
  @JsonKey(name: 'vip')
  @HiveField(2)
  bool get vip => throw _privateConstructorUsedError;
  @JsonKey(name: 'vipExd')
  @HiveField(3)
  DateTime get vipExd => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'name') @HiveField(0) String name,
      @JsonKey(name: 'age') @HiveField(1) int? age,
      @JsonKey(name: 'vip') @HiveField(2) bool vip,
      @JsonKey(name: 'vipExd') @HiveField(3) DateTime vipExd});
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
    Object? name = null,
    Object? age = freezed,
    Object? vip = null,
    Object? vipExd = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      vip: null == vip
          ? _value.vip
          : vip // ignore: cast_nullable_to_non_nullable
              as bool,
      vipExd: null == vipExd
          ? _value.vipExd
          : vipExd // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      {@JsonKey(name: 'name') @HiveField(0) String name,
      @JsonKey(name: 'age') @HiveField(1) int? age,
      @JsonKey(name: 'vip') @HiveField(2) bool vip,
      @JsonKey(name: 'vipExd') @HiveField(3) DateTime vipExd});
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
    Object? name = null,
    Object? age = freezed,
    Object? vip = null,
    Object? vipExd = null,
  }) {
    return _then(_$MyUserImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      vip: null == vip
          ? _value.vip
          : vip // ignore: cast_nullable_to_non_nullable
              as bool,
      vipExd: null == vipExd
          ? _value.vipExd
          : vipExd // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 9, adapterName: 'MyUserAdapter')
class _$MyUserImpl implements _MyUser {
  const _$MyUserImpl(
      {@JsonKey(name: 'name') @HiveField(0) required this.name,
      @JsonKey(name: 'age') @HiveField(1) this.age,
      @JsonKey(name: 'vip') @HiveField(2) required this.vip,
      @JsonKey(name: 'vipExd') @HiveField(3) required this.vipExd});

  factory _$MyUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyUserImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  @HiveField(0)
  final String name;
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
  final DateTime vipExd;

  @override
  String toString() {
    return 'MyUser(name: $name, age: $age, vip: $vip, vipExd: $vipExd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyUserImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.vip, vip) || other.vip == vip) &&
            (identical(other.vipExd, vipExd) || other.vipExd == vipExd));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, age, vip, vipExd);

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
      {@JsonKey(name: 'name') @HiveField(0) required final String name,
      @JsonKey(name: 'age') @HiveField(1) final int? age,
      @JsonKey(name: 'vip') @HiveField(2) required final bool vip,
      @JsonKey(name: 'vipExd')
      @HiveField(3)
      required final DateTime vipExd}) = _$MyUserImpl;

  factory _MyUser.fromJson(Map<String, dynamic> json) = _$MyUserImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  @HiveField(0)
  String get name;
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
  DateTime get vipExd;
  @override
  @JsonKey(ignore: true)
  _$$MyUserImplCopyWith<_$MyUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
