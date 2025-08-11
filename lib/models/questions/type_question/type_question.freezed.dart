// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'type_question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TypeQuestion _$TypeQuestionFromJson(Map<String, dynamic> json) {
  return _TypeQuestion.fromJson(json);
}

/// @nodoc
mixin _$TypeQuestion {
//@JsonKey(name: 'id')
  @HiveField(0)
  String get id => throw _privateConstructorUsedError; //@JsonKey(name: 'name')
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TypeQuestionCopyWith<TypeQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeQuestionCopyWith<$Res> {
  factory $TypeQuestionCopyWith(
          TypeQuestion value, $Res Function(TypeQuestion) then) =
      _$TypeQuestionCopyWithImpl<$Res, TypeQuestion>;
  @useResult
  $Res call({@HiveField(0) String id, @HiveField(1) String name});
}

/// @nodoc
class _$TypeQuestionCopyWithImpl<$Res, $Val extends TypeQuestion>
    implements $TypeQuestionCopyWith<$Res> {
  _$TypeQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TypeQuestionImplCopyWith<$Res>
    implements $TypeQuestionCopyWith<$Res> {
  factory _$$TypeQuestionImplCopyWith(
          _$TypeQuestionImpl value, $Res Function(_$TypeQuestionImpl) then) =
      __$$TypeQuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) String id, @HiveField(1) String name});
}

/// @nodoc
class __$$TypeQuestionImplCopyWithImpl<$Res>
    extends _$TypeQuestionCopyWithImpl<$Res, _$TypeQuestionImpl>
    implements _$$TypeQuestionImplCopyWith<$Res> {
  __$$TypeQuestionImplCopyWithImpl(
      _$TypeQuestionImpl _value, $Res Function(_$TypeQuestionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$TypeQuestionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 5, adapterName: 'TypeQuestionAdapter')
class _$TypeQuestionImpl implements _TypeQuestion {
  _$TypeQuestionImpl(
      {@HiveField(0) required this.id, @HiveField(1) required this.name});

  factory _$TypeQuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypeQuestionImplFromJson(json);

//@JsonKey(name: 'id')
  @override
  @HiveField(0)
  final String id;
//@JsonKey(name: 'name')
  @override
  @HiveField(1)
  final String name;

  @override
  String toString() {
    return 'TypeQuestion(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeQuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeQuestionImplCopyWith<_$TypeQuestionImpl> get copyWith =>
      __$$TypeQuestionImplCopyWithImpl<_$TypeQuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TypeQuestionImplToJson(
      this,
    );
  }
}

abstract class _TypeQuestion implements TypeQuestion {
  factory _TypeQuestion(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String name}) = _$TypeQuestionImpl;

  factory _TypeQuestion.fromJson(Map<String, dynamic> json) =
      _$TypeQuestionImpl.fromJson;

  @override //@JsonKey(name: 'id')
  @HiveField(0)
  String get id;
  @override //@JsonKey(name: 'name')
  @HiveField(1)
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$TypeQuestionImplCopyWith<_$TypeQuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
