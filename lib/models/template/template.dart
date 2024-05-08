

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'template.freezed.dart';
part 'template.g.dart';


@freezed
class Template with _$Template {

  @HiveType(typeId: 1000,adapterName: "TemplateAdapter")
  factory Template({
    @HiveField(0)
    required String id,
    @HiveField(1)
    String? name,
    }) = _Template;

  factory Template.fromJson(Map<String, dynamic> json) => _$TemplateFromJson(json);

}