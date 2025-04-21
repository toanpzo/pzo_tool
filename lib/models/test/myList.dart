import 'package:freezed_annotation/freezed_annotation.dart';
part 'myList.freezed.dart';
part 'myList.g.dart';

@Freezed()
class MyList with _$MyList {

  const factory MyList({

   int? id,
  String? display_name,
  int? code,
  String? name
  }) = _MyList;

  factory MyList.fromJson(Map<String, Object?> json)
  => _$MyListFromJson(json);
}