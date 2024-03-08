// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyTheme _$MyThemeFromJson(Map<String, dynamic> json) {
  return _MyTheme.fromJson(json);
}

/// @nodoc
mixin _$MyTheme {
  @HiveField(0)
  int? get brightness => throw _privateConstructorUsedError;
  @HiveField(1)
  int? get primaryColor => throw _privateConstructorUsedError;
  @HiveField(2)
  int? get backgroundColor => throw _privateConstructorUsedError;
  @HiveField(3)
  MyColorScheme? get myColorScheme => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyThemeCopyWith<MyTheme> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyThemeCopyWith<$Res> {
  factory $MyThemeCopyWith(MyTheme value, $Res Function(MyTheme) then) =
      _$MyThemeCopyWithImpl<$Res, MyTheme>;
  @useResult
  $Res call(
      {@HiveField(0) int? brightness,
      @HiveField(1) int? primaryColor,
      @HiveField(2) int? backgroundColor,
      @HiveField(3) MyColorScheme? myColorScheme});

  $MyColorSchemeCopyWith<$Res>? get myColorScheme;
}

/// @nodoc
class _$MyThemeCopyWithImpl<$Res, $Val extends MyTheme>
    implements $MyThemeCopyWith<$Res> {
  _$MyThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brightness = freezed,
    Object? primaryColor = freezed,
    Object? backgroundColor = freezed,
    Object? myColorScheme = freezed,
  }) {
    return _then(_value.copyWith(
      brightness: freezed == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as int?,
      primaryColor: freezed == primaryColor
          ? _value.primaryColor
          : primaryColor // ignore: cast_nullable_to_non_nullable
              as int?,
      backgroundColor: freezed == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as int?,
      myColorScheme: freezed == myColorScheme
          ? _value.myColorScheme
          : myColorScheme // ignore: cast_nullable_to_non_nullable
              as MyColorScheme?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MyColorSchemeCopyWith<$Res>? get myColorScheme {
    if (_value.myColorScheme == null) {
      return null;
    }

    return $MyColorSchemeCopyWith<$Res>(_value.myColorScheme!, (value) {
      return _then(_value.copyWith(myColorScheme: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MyThemeImplCopyWith<$Res> implements $MyThemeCopyWith<$Res> {
  factory _$$MyThemeImplCopyWith(
          _$MyThemeImpl value, $Res Function(_$MyThemeImpl) then) =
      __$$MyThemeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int? brightness,
      @HiveField(1) int? primaryColor,
      @HiveField(2) int? backgroundColor,
      @HiveField(3) MyColorScheme? myColorScheme});

  @override
  $MyColorSchemeCopyWith<$Res>? get myColorScheme;
}

/// @nodoc
class __$$MyThemeImplCopyWithImpl<$Res>
    extends _$MyThemeCopyWithImpl<$Res, _$MyThemeImpl>
    implements _$$MyThemeImplCopyWith<$Res> {
  __$$MyThemeImplCopyWithImpl(
      _$MyThemeImpl _value, $Res Function(_$MyThemeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brightness = freezed,
    Object? primaryColor = freezed,
    Object? backgroundColor = freezed,
    Object? myColorScheme = freezed,
  }) {
    return _then(_$MyThemeImpl(
      brightness: freezed == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as int?,
      primaryColor: freezed == primaryColor
          ? _value.primaryColor
          : primaryColor // ignore: cast_nullable_to_non_nullable
              as int?,
      backgroundColor: freezed == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as int?,
      myColorScheme: freezed == myColorScheme
          ? _value.myColorScheme
          : myColorScheme // ignore: cast_nullable_to_non_nullable
              as MyColorScheme?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: "MyThemeAdapter")
class _$MyThemeImpl implements _MyTheme {
  _$MyThemeImpl(
      {@HiveField(0) this.brightness,
      @HiveField(1) this.primaryColor,
      @HiveField(2) this.backgroundColor,
      @HiveField(3) this.myColorScheme});

  factory _$MyThemeImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyThemeImplFromJson(json);

  @override
  @HiveField(0)
  final int? brightness;
  @override
  @HiveField(1)
  final int? primaryColor;
  @override
  @HiveField(2)
  final int? backgroundColor;
  @override
  @HiveField(3)
  final MyColorScheme? myColorScheme;

  @override
  String toString() {
    return 'MyTheme(brightness: $brightness, primaryColor: $primaryColor, backgroundColor: $backgroundColor, myColorScheme: $myColorScheme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyThemeImpl &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness) &&
            (identical(other.primaryColor, primaryColor) ||
                other.primaryColor == primaryColor) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.myColorScheme, myColorScheme) ||
                other.myColorScheme == myColorScheme));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, brightness, primaryColor, backgroundColor, myColorScheme);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyThemeImplCopyWith<_$MyThemeImpl> get copyWith =>
      __$$MyThemeImplCopyWithImpl<_$MyThemeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyThemeImplToJson(
      this,
    );
  }
}

abstract class _MyTheme implements MyTheme {
  factory _MyTheme(
      {@HiveField(0) final int? brightness,
      @HiveField(1) final int? primaryColor,
      @HiveField(2) final int? backgroundColor,
      @HiveField(3) final MyColorScheme? myColorScheme}) = _$MyThemeImpl;

  factory _MyTheme.fromJson(Map<String, dynamic> json) = _$MyThemeImpl.fromJson;

  @override
  @HiveField(0)
  int? get brightness;
  @override
  @HiveField(1)
  int? get primaryColor;
  @override
  @HiveField(2)
  int? get backgroundColor;
  @override
  @HiveField(3)
  MyColorScheme? get myColorScheme;
  @override
  @JsonKey(ignore: true)
  _$$MyThemeImplCopyWith<_$MyThemeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
