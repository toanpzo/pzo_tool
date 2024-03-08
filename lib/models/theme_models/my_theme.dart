

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'my_color_scheme.dart';

part 'my_theme.freezed.dart';
part 'my_theme.g.dart';

@freezed
class MyTheme with _$MyTheme {

  @HiveType(typeId: 1,adapterName: "MyThemeAdapter")


  factory MyTheme({
    @HiveField(0)
    int? brightness,
    @HiveField(1)
    int? primaryColor,

    @HiveField(2)
    int? backgroundColor,
    @HiveField(3)
    MyColorScheme? myColorScheme,

  }) = _MyTheme;

  factory MyTheme.fromJson(Map<String, dynamic> json) => _$MyThemeFromJson(json);
}