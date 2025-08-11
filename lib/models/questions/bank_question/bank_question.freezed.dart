// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BankQuestion _$BankQuestionFromJson(Map<String, dynamic> json) {
  return _BankQuestion.fromJson(json);
}

/// @nodoc
mixin _$BankQuestion {
// @JsonKey(name: 'id')
  @HiveField(0)
  String get id =>
      throw _privateConstructorUsedError; //@JsonKey(name: 'idTypeQuestion')
  @HiveField(1)
  String get idTypeQuestion =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'name')
  @HiveField(2)
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankQuestionCopyWith<BankQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankQuestionCopyWith<$Res> {
  factory $BankQuestionCopyWith(
          BankQuestion value, $Res Function(BankQuestion) then) =
      _$BankQuestionCopyWithImpl<$Res, BankQuestion>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String idTypeQuestion,
      @HiveField(2) String name});
}

/// @nodoc
class _$BankQuestionCopyWithImpl<$Res, $Val extends BankQuestion>
    implements $BankQuestionCopyWith<$Res> {
  _$BankQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idTypeQuestion = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      idTypeQuestion: null == idTypeQuestion
          ? _value.idTypeQuestion
          : idTypeQuestion // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankQuestionImplCopyWith<$Res>
    implements $BankQuestionCopyWith<$Res> {
  factory _$$BankQuestionImplCopyWith(
          _$BankQuestionImpl value, $Res Function(_$BankQuestionImpl) then) =
      __$$BankQuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String idTypeQuestion,
      @HiveField(2) String name});
}

/// @nodoc
class __$$BankQuestionImplCopyWithImpl<$Res>
    extends _$BankQuestionCopyWithImpl<$Res, _$BankQuestionImpl>
    implements _$$BankQuestionImplCopyWith<$Res> {
  __$$BankQuestionImplCopyWithImpl(
      _$BankQuestionImpl _value, $Res Function(_$BankQuestionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idTypeQuestion = null,
    Object? name = null,
  }) {
    return _then(_$BankQuestionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      idTypeQuestion: null == idTypeQuestion
          ? _value.idTypeQuestion
          : idTypeQuestion // ignore: cast_nullable_to_non_nullable
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
@HiveType(typeId: 4, adapterName: 'BankQuestionAdapter')
class _$BankQuestionImpl implements _BankQuestion {
  _$BankQuestionImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.idTypeQuestion,
      @HiveField(2) required this.name});

  factory _$BankQuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankQuestionImplFromJson(json);

// @JsonKey(name: 'id')
  @override
  @HiveField(0)
  final String id;
//@JsonKey(name: 'idTypeQuestion')
  @override
  @HiveField(1)
  final String idTypeQuestion;
// @JsonKey(name: 'name')
  @override
  @HiveField(2)
  final String name;

  @override
  String toString() {
    return 'BankQuestion(id: $id, idTypeQuestion: $idTypeQuestion, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankQuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idTypeQuestion, idTypeQuestion) ||
                other.idTypeQuestion == idTypeQuestion) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, idTypeQuestion, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BankQuestionImplCopyWith<_$BankQuestionImpl> get copyWith =>
      __$$BankQuestionImplCopyWithImpl<_$BankQuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BankQuestionImplToJson(
      this,
    );
  }
}

abstract class _BankQuestion implements BankQuestion {
  factory _BankQuestion(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String idTypeQuestion,
      @HiveField(2) required final String name}) = _$BankQuestionImpl;

  factory _BankQuestion.fromJson(Map<String, dynamic> json) =
      _$BankQuestionImpl.fromJson;

  @override // @JsonKey(name: 'id')
  @HiveField(0)
  String get id;
  @override //@JsonKey(name: 'idTypeQuestion')
  @HiveField(1)
  String get idTypeQuestion;
  @override // @JsonKey(name: 'name')
  @HiveField(2)
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$BankQuestionImplCopyWith<_$BankQuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
