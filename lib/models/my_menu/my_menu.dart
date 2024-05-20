

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'my_menu.freezed.dart';
part 'my_menu.g.dart';


@freezed
class MyMenu with _$MyMenu {

  @HiveType(typeId: 1000,adapterName: "MyMenuAdapter")
  factory MyMenu({
    @HiveField(0)
    required String id,
    @HiveField(1)
    required String name,
    @HiveField(2)
    required int level,
    @HiveField(3)
    String? assetImage,
    @HiveField(4)
    String? image,
    @HiveField(5)
    required String routerName,
    @HiveField(6)
    Object? arguments,
  @HiveField(7)
  int? colorBox,
    @HiveField(8)
    int? colorImage,
    @HiveField(9)
    int? colorText,

    }) = _MyMenu;

  factory MyMenu.fromJson(Map<String, dynamic> json) => _$MyMenuFromJson(json);

}