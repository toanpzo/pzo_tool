

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'fuel.freezed.dart';
part 'fuel.g.dart';


@freezed
class Fuel with _$Fuel {

  @HiveType(typeId: 0,adapterName: "FuelAdapter")
  factory Fuel({
    @HiveField(0)
    int? beforeL,
    @HiveField(1)
    int? beforeC,
    @HiveField(2)
    int? beforeR,
    @HiveField(17)
    int? beforeOr,
    @HiveField(3)
    int? beforeTotal,


    @HiveField(4)
    int? upliftL,
    @HiveField(5)
    int? upliftC,
    @HiveField(6)
    int? upliftR,
    @HiveField(18)
    int? upliftOr,
    @HiveField(7)
    int? upliftTotal,


    @HiveField(8)
    int? afterL,
    @HiveField(9)
    int? afterC,
    @HiveField(10)
    int? afterR,
    @HiveField(19)
    int? afterOr,
    @HiveField(11)
    int? afterTotal,
    @HiveField(12)
    int? gaLon,
    @HiveField(13)
    double? liter,
    @HiveField(14)
    double? kg,
    @HiveField(15)
    double? density,
    @HiveField(16)
    double? discrepancy


  }) = _Fuel;

  factory Fuel.fromJson(Map<String, dynamic> json) => _$FuelFromJson(json);

}