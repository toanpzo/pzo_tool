import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vietjet_tool/models/test/detail.dart';
import 'package:vietjet_tool/models/test/line.dart';

import 'myList.dart';
part 'master.freezed.dart';
part 'master.g.dart';

@Freezed()
class Master with _$Master {

  const factory Master({

    String? displayName,
    int? id,
    MyList? list_id,
    double? mobileNumber,
    DateTime? mobile_date,
    DateTime? mobile_datetime,
    bool? is_check,
    List<Detail>? detail_ids,
    double? location,
    //List<StateData>? state,
    String? name,
    String? image,
    List<Line>? line_ids,
    String? barcodeMachine,
    String? note,
  }) = _Master;

  factory Master.fromJson(Map<String, Object?> json)
  => _$MasterFromJson(json);
}