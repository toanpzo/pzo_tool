// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wrong_question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WrongQuestion _$WrongQuestionFromJson(Map<String, dynamic> json) {
  return _WrongQuestion.fromJson(json);
}

/// @nodoc
mixin _$WrongQuestion {
  @HiveField(0)
  Question get questWrong => throw _privateConstructorUsedError;
  @HiveField(1)
  int get numberMistakes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WrongQuestionCopyWith<WrongQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WrongQuestionCopyWith<$Res> {
  factory $WrongQuestionCopyWith(
          WrongQuestion value, $Res Function(WrongQuestion) then) =
      _$WrongQuestionCopyWithImpl<$Res, WrongQuestion>;
  @useResult
  $Res call(
      {@HiveField(0) Question questWrong, @HiveField(1) int numberMistakes});

  $QuestionCopyWith<$Res> get questWrong;
}

/// @nodoc
class _$WrongQuestionCopyWithImpl<$Res, $Val extends WrongQuestion>
    implements $WrongQuestionCopyWith<$Res> {
  _$WrongQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questWrong = null,
    Object? numberMistakes = null,
  }) {
    return _then(_value.copyWith(
      questWrong: null == questWrong
          ? _value.questWrong
          : questWrong // ignore: cast_nullable_to_non_nullable
              as Question,
      numberMistakes: null == numberMistakes
          ? _value.numberMistakes
          : numberMistakes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuestionCopyWith<$Res> get questWrong {
    return $QuestionCopyWith<$Res>(_value.questWrong, (value) {
      return _then(_value.copyWith(questWrong: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WrongQuestionImplCopyWith<$Res>
    implements $WrongQuestionCopyWith<$Res> {
  factory _$$WrongQuestionImplCopyWith(
          _$WrongQuestionImpl value, $Res Function(_$WrongQuestionImpl) then) =
      __$$WrongQuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) Question questWrong, @HiveField(1) int numberMistakes});

  @override
  $QuestionCopyWith<$Res> get questWrong;
}

/// @nodoc
class __$$WrongQuestionImplCopyWithImpl<$Res>
    extends _$WrongQuestionCopyWithImpl<$Res, _$WrongQuestionImpl>
    implements _$$WrongQuestionImplCopyWith<$Res> {
  __$$WrongQuestionImplCopyWithImpl(
      _$WrongQuestionImpl _value, $Res Function(_$WrongQuestionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questWrong = null,
    Object? numberMistakes = null,
  }) {
    return _then(_$WrongQuestionImpl(
      questWrong: null == questWrong
          ? _value.questWrong
          : questWrong // ignore: cast_nullable_to_non_nullable
              as Question,
      numberMistakes: null == numberMistakes
          ? _value.numberMistakes
          : numberMistakes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 7, adapterName: "WrongQuestionAdapter")
class _$WrongQuestionImpl implements _WrongQuestion {
  _$WrongQuestionImpl(
      {@HiveField(0) required this.questWrong,
      @HiveField(1) required this.numberMistakes});

  factory _$WrongQuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$WrongQuestionImplFromJson(json);

  @override
  @HiveField(0)
  final Question questWrong;
  @override
  @HiveField(1)
  final int numberMistakes;

  @override
  String toString() {
    return 'WrongQuestion(questWrong: $questWrong, numberMistakes: $numberMistakes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WrongQuestionImpl &&
            (identical(other.questWrong, questWrong) ||
                other.questWrong == questWrong) &&
            (identical(other.numberMistakes, numberMistakes) ||
                other.numberMistakes == numberMistakes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, questWrong, numberMistakes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WrongQuestionImplCopyWith<_$WrongQuestionImpl> get copyWith =>
      __$$WrongQuestionImplCopyWithImpl<_$WrongQuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WrongQuestionImplToJson(
      this,
    );
  }
}

abstract class _WrongQuestion implements WrongQuestion {
  factory _WrongQuestion(
      {@HiveField(0) required final Question questWrong,
      @HiveField(1) required final int numberMistakes}) = _$WrongQuestionImpl;

  factory _WrongQuestion.fromJson(Map<String, dynamic> json) =
      _$WrongQuestionImpl.fromJson;

  @override
  @HiveField(0)
  Question get questWrong;
  @override
  @HiveField(1)
  int get numberMistakes;
  @override
  @JsonKey(ignore: true)
  _$$WrongQuestionImplCopyWith<_$WrongQuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
