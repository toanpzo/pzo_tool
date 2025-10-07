// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'version.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Version _$VersionFromJson(Map<String, dynamic> json) {
  return _Version.fromJson(json);
}

/// @nodoc
mixin _$Version {
  @JsonKey(name: 'checkSum')
  @HiveField(4)
  String? get checkSum => throw _privateConstructorUsedError;
  @JsonKey(name: 'model')
  @HiveField(1)
  String get model => throw _privateConstructorUsedError;
  @JsonKey(name: 'revision')
  @HiveField(2)
  String get revision => throw _privateConstructorUsedError;
  @JsonKey(name: 'revisionDate')
  @HiveField(3)
  DateTime get revisionDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VersionCopyWith<Version> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VersionCopyWith<$Res> {
  factory $VersionCopyWith(Version value, $Res Function(Version) then) =
      _$VersionCopyWithImpl<$Res, Version>;
  @useResult
  $Res call(
      {@JsonKey(name: 'checkSum') @HiveField(4) String? checkSum,
      @JsonKey(name: 'model') @HiveField(1) String model,
      @JsonKey(name: 'revision') @HiveField(2) String revision,
      @JsonKey(name: 'revisionDate') @HiveField(3) DateTime revisionDate});
}

/// @nodoc
class _$VersionCopyWithImpl<$Res, $Val extends Version>
    implements $VersionCopyWith<$Res> {
  _$VersionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkSum = freezed,
    Object? model = null,
    Object? revision = null,
    Object? revisionDate = null,
  }) {
    return _then(_value.copyWith(
      checkSum: freezed == checkSum
          ? _value.checkSum
          : checkSum // ignore: cast_nullable_to_non_nullable
              as String?,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      revision: null == revision
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as String,
      revisionDate: null == revisionDate
          ? _value.revisionDate
          : revisionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VersionImplCopyWith<$Res> implements $VersionCopyWith<$Res> {
  factory _$$VersionImplCopyWith(
          _$VersionImpl value, $Res Function(_$VersionImpl) then) =
      __$$VersionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'checkSum') @HiveField(4) String? checkSum,
      @JsonKey(name: 'model') @HiveField(1) String model,
      @JsonKey(name: 'revision') @HiveField(2) String revision,
      @JsonKey(name: 'revisionDate') @HiveField(3) DateTime revisionDate});
}

/// @nodoc
class __$$VersionImplCopyWithImpl<$Res>
    extends _$VersionCopyWithImpl<$Res, _$VersionImpl>
    implements _$$VersionImplCopyWith<$Res> {
  __$$VersionImplCopyWithImpl(
      _$VersionImpl _value, $Res Function(_$VersionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkSum = freezed,
    Object? model = null,
    Object? revision = null,
    Object? revisionDate = null,
  }) {
    return _then(_$VersionImpl(
      checkSum: freezed == checkSum
          ? _value.checkSum
          : checkSum // ignore: cast_nullable_to_non_nullable
              as String?,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      revision: null == revision
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as String,
      revisionDate: null == revisionDate
          ? _value.revisionDate
          : revisionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 10, adapterName: 'VersionAdapter')
class _$VersionImpl implements _Version {
  const _$VersionImpl(
      {@JsonKey(name: 'checkSum') @HiveField(4) this.checkSum,
      @JsonKey(name: 'model') @HiveField(1) required this.model,
      @JsonKey(name: 'revision') @HiveField(2) required this.revision,
      @JsonKey(name: 'revisionDate') @HiveField(3) required this.revisionDate});

  factory _$VersionImpl.fromJson(Map<String, dynamic> json) =>
      _$$VersionImplFromJson(json);

  @override
  @JsonKey(name: 'checkSum')
  @HiveField(4)
  final String? checkSum;
  @override
  @JsonKey(name: 'model')
  @HiveField(1)
  final String model;
  @override
  @JsonKey(name: 'revision')
  @HiveField(2)
  final String revision;
  @override
  @JsonKey(name: 'revisionDate')
  @HiveField(3)
  final DateTime revisionDate;

  @override
  String toString() {
    return 'Version(checkSum: $checkSum, model: $model, revision: $revision, revisionDate: $revisionDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VersionImpl &&
            (identical(other.checkSum, checkSum) ||
                other.checkSum == checkSum) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.revision, revision) ||
                other.revision == revision) &&
            (identical(other.revisionDate, revisionDate) ||
                other.revisionDate == revisionDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, checkSum, model, revision, revisionDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VersionImplCopyWith<_$VersionImpl> get copyWith =>
      __$$VersionImplCopyWithImpl<_$VersionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VersionImplToJson(
      this,
    );
  }
}

abstract class _Version implements Version {
  const factory _Version(
      {@JsonKey(name: 'checkSum') @HiveField(4) final String? checkSum,
      @JsonKey(name: 'model') @HiveField(1) required final String model,
      @JsonKey(name: 'revision') @HiveField(2) required final String revision,
      @JsonKey(name: 'revisionDate')
      @HiveField(3)
      required final DateTime revisionDate}) = _$VersionImpl;

  factory _Version.fromJson(Map<String, dynamic> json) = _$VersionImpl.fromJson;

  @override
  @JsonKey(name: 'checkSum')
  @HiveField(4)
  String? get checkSum;
  @override
  @JsonKey(name: 'model')
  @HiveField(1)
  String get model;
  @override
  @JsonKey(name: 'revision')
  @HiveField(2)
  String get revision;
  @override
  @JsonKey(name: 'revisionDate')
  @HiveField(3)
  DateTime get revisionDate;
  @override
  @JsonKey(ignore: true)
  _$$VersionImplCopyWith<_$VersionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
