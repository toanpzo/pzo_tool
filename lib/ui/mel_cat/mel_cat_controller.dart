
import 'package:intl/intl.dart';
import 'package:vietjet_tool/common/local_storage/my_storage.dart';
import 'package:vietjet_tool/controllers/my_controller.dart';
import 'package:vietjet_tool/models/fuel/fuel.dart';

class MelCatController extends MyController{

  MelCatController(super.myState);

  String today="";

  String catB="";
  String catC="";
  String catD="";
  String cat180="";

  @override
  Future<void> loadData() async{
    DateFormat dateFormat =DateFormat("dd/MM/yyyy");
    today= "Today: ${dateFormat.format(DateTime.now().toUtc())}";
    catB= "CAT B: ${dateFormat.format(DateTime.now().add(const Duration(days: 3)).toUtc())}";
    catC= "CAT C: ${dateFormat.format(DateTime.now().add(const Duration(days: 10)).toUtc())}";
    catD= "CAT D: ${dateFormat.format(DateTime.now().add(const Duration(days: 60)).toUtc())}";
    cat180= "180 DAYS: ${dateFormat.format(DateTime.now().add(const Duration(days: 180)).toUtc())}";
  }






}