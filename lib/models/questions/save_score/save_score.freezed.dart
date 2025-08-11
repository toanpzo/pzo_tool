// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'save_score.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SaveScore _$SaveScoreFromJson(Map<String, dynamic> json) {
  return _SaveScore.fromJson(json);
}

/// @nodoc
mixin _$SaveScore {
  @HiveField(0)
  int get totalCorrect => throw _privateConstructorUsedError;
  @HiveField(1)
  int get totalWrong => throw _privateConstructorUsedError;
  @HiveField(2)
  int get dem => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SaveScoreCopyWith<SaveScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveScoreCopyWith<$Res> {
  factory $SaveScoreCopyWith(SaveScore value, $Res Function(SaveScore) then) =
      _$SaveScoreCopyWithImpl<$Res, SaveScore>;
  @useResult
  $Res call(
      {@HiveField(0) int totalCorrect,
      @HiveField(1) int totalWrong,
      @HiveField(2) int dem});
}

/// @nodoc
class _$SaveScoreCopyWithImpl<$Res, $Val extends SaveScore>
    implements $SaveScoreCopyWith<$Res> {
  _$SaveScoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCorrect = null,
    Object? totalWrong = null,
    Object? dem = null,
  }) {
    return _then(_value.copyWith(
      totalCorrect: null == totalCorrect
          ? _value.totalCorrect
          : totalCorrect // ignore: cast_nullable_to_non_nullable
              as int,
      totalWrong: null == totalWrong
          ? _value.totalWrong
          : totalWrong // ignore: cast_nullable_to_non_nullable
              as int,
      dem: null == dem
          ? _value.dem
          : dem // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaveScoreImplCopyWith<$Res>
    implements $SaveScoreCopyWith<$Res> {
  factory _$$SaveScoreImplCopyWith(
          _$SaveScoreImpl value, $Res Function(_$SaveScoreImpl) then) =
      __$$SaveScoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int totalCorrect,
      @HiveField(1) int totalWrong,
      @HiveField(2) int dem});
}

/// @nodoc
class __$$SaveScoreImplCopyWithImpl<$Res>
    extends _$SaveScoreCopyWithImpl<$Res, _$SaveScoreImpl>
    implements _$$SaveScoreImplCopyWith<$Res> {
  __$$SaveScoreImplCopyWithImpl(
      _$SaveScoreImpl _value, $Res Function(_$SaveScoreImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCorrect = null,
    Object? totalWrong = null,
    Object? dem = null,
  }) {
    return _then(_$SaveScoreImpl(
      totalCorrect: null == totalCorrect
          ? _value.totalCorrect
          : totalCorrect // ignore: cast_nullable_to_non_nullable
              as int,
      totalWrong: null == totalWrong
          ? _value.totalWrong
          : totalWrong // ignore: cast_nullable_to_non_nullable
              as int,
      dem: null == dem
          ? _value.dem
          : dem // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 8, adapterName: "SaveScoreAdapter")
class _$SaveScoreImpl implements _SaveScore {
  _$SaveScoreImpl(
      {@HiveField(0) required this.totalCorrect,
      @HiveField(1) required this.totalWrong,
      @HiveField(2) required this.dem});

  factory _$SaveScoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaveScoreImplFromJson(json);

  @override
  @HiveField(0)
  final int totalCorrect;
  @override
  @HiveField(1)
  final int totalWrong;
  @override
  @HiveField(2)
  final int dem;

  @override
  String toString() {
    return 'SaveScore(totalCorrect: $totalCorrect, totalWrong: $totalWrong, dem: $dem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveScoreImpl &&
            (identical(other.totalCorrect, totalCorrect) ||
                other.totalCorrect == totalCorrect) &&
            (identical(other.totalWrong, totalWrong) ||
                other.totalWrong == totalWrong) &&
            (identical(other.dem, dem) || other.dem == dem));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalCorrect, totalWrong, dem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveScoreImplCopyWith<_$SaveScoreImpl> get copyWith =>
      __$$SaveScoreImplCopyWithImpl<_$SaveScoreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaveScoreImplToJson(
      this,
    );
  }
}

abstract class _SaveScore implements SaveScore {
  factory _SaveScore(
      {@HiveField(0) required final int totalCorrect,
      @HiveField(1) required final int totalWrong,
      @HiveField(2) required final int dem}) = _$SaveScoreImpl;

  factory _SaveScore.fromJson(Map<String, dynamic> json) =
      _$SaveScoreImpl.fromJson;

  @override
  @HiveField(0)
  int get totalCorrect;
  @override
  @HiveField(1)
  int get totalWrong;
  @override
  @HiveField(2)
  int get dem;
  @override
  @JsonKey(ignore: true)
  _$$SaveScoreImplCopyWith<_$SaveScoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
