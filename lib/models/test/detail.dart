import 'package:freezed_annotation/freezed_annotation.dart';
part 'detail.freezed.dart';
part 'detail.g.dart';

@Freezed()
class Detail with _$Detail {

  const factory Detail({

   int? id,
  String? display_name,
  int? code,
  String? name,
  int? master_id
  }) = _Detail;

  factory Detail.fromJson(Map<String, Object?> json)
  => _$DetailFromJson(json);
}