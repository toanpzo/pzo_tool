// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'myList.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyList _$MyListFromJson(Map<String, dynamic> json) {
  return _MyList.fromJson(json);
}

/// @nodoc
mixin _$MyList {
  int? get id => throw _privateConstructorUsedError;
  String? get display_name => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyListCopyWith<MyList> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyListCopyWith<$Res> {
  factory $MyListCopyWith(MyList value, $Res Function(MyList) then) =
      _$MyListCopyWithImpl<$Res, MyList>;
  @useResult
  $Res call({int? id, String? display_name, int? code, String? name});
}

/// @nodoc
class _$MyListCopyWithImpl<$Res, $Val extends MyList>
    implements $MyListCopyWith<$Res> {
  _$MyListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? display_name = freezed,
    Object? code = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      display_name: freezed == display_name
          ? _value.display_name
          : display_name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyListImplCopyWith<$Res> implements $MyListCopyWith<$Res> {
  factory _$$MyListImplCopyWith(
          _$MyListImpl value, $Res Function(_$MyListImpl) then) =
      __$$MyListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? display_name, int? code, String? name});
}

/// @nodoc
class __$$MyListImplCopyWithImpl<$Res>
    extends _$MyListCopyWithImpl<$Res, _$MyListImpl>
    implements _$$MyListImplCopyWith<$Res> {
  __$$MyListImplCopyWithImpl(
      _$MyListImpl _value, $Res Function(_$MyListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? display_name = freezed,
    Object? code = freezed,
    Object? name = freezed,
  }) {
    return _then(_$MyListImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      display_name: freezed == display_name
          ? _value.display_name
          : display_name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyListImpl implements _MyList {
  const _$MyListImpl({this.id, this.display_name, this.code, this.name});

  factory _$MyListImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyListImplFromJson(json);

  @override
  final int? id;
  @override
  final String? display_name;
  @override
  final int? code;
  @override
  final String? name;

  @override
  String toString() {
    return 'MyList(id: $id, display_name: $display_name, code: $code, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyListImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.display_name, display_name) ||
                other.display_name == display_name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, display_name, code, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyListImplCopyWith<_$MyListImpl> get copyWith =>
      __$$MyListImplCopyWithImpl<_$MyListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyListImplToJson(
      this,
    );
  }
}

abstract class _MyList implements MyList {
  const factory _MyList(
      {final int? id,
      final String? display_name,
      final int? code,
      final String? name}) = _$MyListImpl;

  factory _MyList.fromJson(Map<String, dynamic> json) = _$MyListImpl.fromJson;

  @override
  int? get id;
  @override
  String? get display_name;
  @override
  int? get code;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$MyListImplCopyWith<_$MyListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
