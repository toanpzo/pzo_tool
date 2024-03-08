import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class ChangeTimeUtc with ChangeNotifier {
  DateFormat dateFormat = DateFormat("dd/MM/yyyy hh:mm");
  String time="";

  String get timeUtc=>time;

  void setTime(){
    time="UTC: ${dateFormat.format(DateTime.now().toUtc())}";
    notifyListeners();
  }





}