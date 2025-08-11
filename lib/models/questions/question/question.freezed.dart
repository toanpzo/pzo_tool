// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
mixin _$Question {
// @JsonKey(name: 'idBankQuestion')
  @HiveField(0)
  String get idBankQuestion =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'numberQuestion')
  @HiveField(1)
  int get numberQuestion =>
      throw _privateConstructorUsedError; //@JsonKey(name: 'id')
  @HiveField(2)
  String get id =>
      throw _privateConstructorUsedError; //@JsonKey(name: 'question')
  @HiveField(3)
  String get question =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'questionImage')
  @HiveField(4)
  String? get questionImage =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'answers')
  @HiveField(5)
  List<Answer> get answers =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'answerCorrect')
  @HiveField(6)
  Answer? get answerCorrect => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call(
      {@HiveField(0) String idBankQuestion,
      @HiveField(1) int numberQuestion,
      @HiveField(2) String id,
      @HiveField(3) String question,
      @HiveField(4) String? questionImage,
      @HiveField(5) List<Answer> answers,
      @HiveField(6) Answer? answerCorrect});

  $AnswerCopyWith<$Res>? get answerCorrect;
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idBankQuestion = null,
    Object? numberQuestion = null,
    Object? id = null,
    Object? question = null,
    Object? questionImage = freezed,
    Object? answers = null,
    Object? answerCorrect = freezed,
  }) {
    return _then(_value.copyWith(
      idBankQuestion: null == idBankQuestion
          ? _value.idBankQuestion
          : idBankQuestion // ignore: cast_nullable_to_non_nullable
              as String,
      numberQuestion: null == numberQuestion
          ? _value.numberQuestion
          : numberQuestion // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      questionImage: freezed == questionImage
          ? _value.questionImage
          : questionImage // ignore: cast_nullable_to_non_nullable
              as String?,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      answerCorrect: freezed == answerCorrect
          ? _value.answerCorrect
          : answerCorrect // ignore: cast_nullable_to_non_nullable
              as Answer?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AnswerCopyWith<$Res>? get answerCorrect {
    if (_value.answerCorrect == null) {
      return null;
    }

    return $AnswerCopyWith<$Res>(_value.answerCorrect!, (value) {
      return _then(_value.copyWith(answerCorrect: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuestionImplCopyWith<$Res>
    implements $QuestionCopyWith<$Res> {
  factory _$$QuestionImplCopyWith(
          _$QuestionImpl value, $Res Function(_$QuestionImpl) then) =
      __$$QuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String idBankQuestion,
      @HiveField(1) int numberQuestion,
      @HiveField(2) String id,
      @HiveField(3) String question,
      @HiveField(4) String? questionImage,
      @HiveField(5) List<Answer> answers,
      @HiveField(6) Answer? answerCorrect});

  @override
  $AnswerCopyWith<$Res>? get answerCorrect;
}

/// @nodoc
class __$$QuestionImplCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$QuestionImpl>
    implements _$$QuestionImplCopyWith<$Res> {
  __$$QuestionImplCopyWithImpl(
      _$QuestionImpl _value, $Res Function(_$QuestionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idBankQuestion = null,
    Object? numberQuestion = null,
    Object? id = null,
    Object? question = null,
    Object? questionImage = freezed,
    Object? answers = null,
    Object? answerCorrect = freezed,
  }) {
    return _then(_$QuestionImpl(
      idBankQuestion: null == idBankQuestion
          ? _value.idBankQuestion
          : idBankQuestion // ignore: cast_nullable_to_non_nullable
              as String,
      numberQuestion: null == numberQuestion
          ? _value.numberQuestion
          : numberQuestion // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      questionImage: freezed == questionImage
          ? _value.questionImage
          : questionImage // ignore: cast_nullable_to_non_nullable
              as String?,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      answerCorrect: freezed == answerCorrect
          ? _value.answerCorrect
          : answerCorrect // ignore: cast_nullable_to_non_nullable
              as Answer?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 6, adapterName: 'QuestionAdapter')
class _$QuestionImpl implements _Question {
  _$QuestionImpl(
      {@HiveField(0) required this.idBankQuestion,
      @HiveField(1) required this.numberQuestion,
      @HiveField(2) required this.id,
      @HiveField(3) required this.question,
      @HiveField(4) this.questionImage,
      @HiveField(5) required final List<Answer> answers,
      @HiveField(6) this.answerCorrect})
      : _answers = answers;

  factory _$QuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionImplFromJson(json);

// @JsonKey(name: 'idBankQuestion')
  @override
  @HiveField(0)
  final String idBankQuestion;
// @JsonKey(name: 'numberQuestion')
  @override
  @HiveField(1)
  final int numberQuestion;
//@JsonKey(name: 'id')
  @override
  @HiveField(2)
  final String id;
//@JsonKey(name: 'question')
  @override
  @HiveField(3)
  final String question;
// @JsonKey(name: 'questionImage')
  @override
  @HiveField(4)
  final String? questionImage;
// @JsonKey(name: 'answers')
  final List<Answer> _answers;
// @JsonKey(name: 'answers')
  @override
  @HiveField(5)
  List<Answer> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

// @JsonKey(name: 'answerCorrect')
  @override
  @HiveField(6)
  final Answer? answerCorrect;

  @override
  String toString() {
    return 'Question(idBankQuestion: $idBankQuestion, numberQuestion: $numberQuestion, id: $id, question: $question, questionImage: $questionImage, answers: $answers, answerCorrect: $answerCorrect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionImpl &&
            (identical(other.idBankQuestion, idBankQuestion) ||
                other.idBankQuestion == idBankQuestion) &&
            (identical(other.numberQuestion, numberQuestion) ||
                other.numberQuestion == numberQuestion) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.questionImage, questionImage) ||
                other.questionImage == questionImage) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.answerCorrect, answerCorrect) ||
                other.answerCorrect == answerCorrect));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      idBankQuestion,
      numberQuestion,
      id,
      question,
      questionImage,
      const DeepCollectionEquality().hash(_answers),
      answerCorrect);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      __$$QuestionImplCopyWithImpl<_$QuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionImplToJson(
      this,
    );
  }
}

abstract class _Question implements Question {
  factory _Question(
      {@HiveField(0) required final String idBankQuestion,
      @HiveField(1) required final int numberQuestion,
      @HiveField(2) required final String id,
      @HiveField(3) required final String question,
      @HiveField(4) final String? questionImage,
      @HiveField(5) required final List<Answer> answers,
      @HiveField(6) final Answer? answerCorrect}) = _$QuestionImpl;

  factory _Question.fromJson(Map<String, dynamic> json) =
      _$QuestionImpl.fromJson;

  @override // @JsonKey(name: 'idBankQuestion')
  @HiveField(0)
  String get idBankQuestion;
  @override // @JsonKey(name: 'numberQuestion')
  @HiveField(1)
  int get numberQuestion;
  @override //@JsonKey(name: 'id')
  @HiveField(2)
  String get id;
  @override //@JsonKey(name: 'question')
  @HiveField(3)
  String get question;
  @override // @JsonKey(name: 'questionImage')
  @HiveField(4)
  String? get questionImage;
  @override // @JsonKey(name: 'answers')
  @HiveField(5)
  List<Answer> get answers;
  @override // @JsonKey(name: 'answerCorrect')
  @HiveField(6)
  Answer? get answerCorrect;
  @override
  @JsonKey(ignore: true)
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
