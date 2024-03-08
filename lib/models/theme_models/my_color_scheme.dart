


import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'my_color_scheme.freezed.dart';
part 'my_color_scheme.g.dart';

@freezed
class MyColorScheme with _$MyColorScheme {

  @HiveType(typeId: 2,adapterName: "MyColorSchemeAdapter")
  factory MyColorScheme({
    @HiveField(0)
    int? primary,
    @HiveField(1)
    int? onPrimary,
    @HiveField(2)
    int? secondary,
    @HiveField(3)
    int? onSecondary,

    @HiveField(4)
    int? error,
    @HiveField(5)
    int? onError,
    @HiveField(6)
    int? background,
    @HiveField(7)
    int? onBackground,
    @HiveField(8)
    int? surface,
    @HiveField(9)
    int? onSurface,
  }) = _MyColorScheme;

  factory MyColorScheme.fromJson(Map<String, dynamic> json) => _$MyColorSchemeFromJson(json);
}