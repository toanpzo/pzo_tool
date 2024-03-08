import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vietjet_tool/models/fuel/fuel.dart';
import 'package:vietjet_tool/models/theme_models/my_theme.dart';

class MyStorage {


  Future<void> setBrightness(int value) async {
    final box= await Hive.openBox("myTheme");
    box.put("brightness", value);
  }

  Future<int?> getBrightness() async {
    final box= await Hive.openBox("myTheme");
    return box.get("brightness");
  }


  Future<void> setTheme(MyTheme myTheme) async {

    final box= await Hive.openBox("myTheme");


    if (myTheme.brightness == 1) {
      box.put("brightness", 1);
      box.put("dark", myTheme);
    } else {
      box.put("brightness", 0);
      box.put("light", myTheme);
    }



    // SharedPreferences preferences = await sharedPreferences;
    // String colorString = jsonEncode(myTheme.toJson());
    // if (myTheme.brightness == 1) {
    //   preferences.setInt("MyBrightness", myTheme.brightness!);
    //   preferences.setString("MyDarkTheme", colorString);
    // } else {
    //   preferences.setInt("MyBrightness", myTheme.brightness ?? 0);
    //   preferences.setString("MyTheme", colorString);
    // }
  }

  Future<MyTheme> getTheme() async {
    final box= await Hive.openBox("myTheme");

    int? brightness= box.get("brightness");
    if(brightness==1){
      return box.get("dark")??MyTheme();
    }else{

      return box.get("light")??MyTheme();
    }




    // SharedPreferences preferences = await sharedPreferences;
    // String? colorString;
    // int? myBrightness = preferences.getInt("MyBrightness");
    //
    // if (myBrightness == 1) {
    //   colorString = preferences.getString("MyDarkTheme");
    // } else {
    //   colorString = preferences.getString("MyTheme");
    // }
    //
    //
    // MyTheme myTheme = MyTheme();
    //
    // if (colorString != null) {
    //   myTheme = MyTheme.fromJson(jsonDecode(colorString));
    // }
    // return myTheme;
  }


  Future<void> setFuel(Fuel value) async {
    final box= await Hive.openBox("fuel");
    box.put("value", value);
  }

  Future<Fuel?> getFuel() async {
    final box= await Hive.openBox("fuel");
    return box.get("value");
  }

  Future<void> setListFuel(List<Fuel> value) async {
    final box= await Hive.openBox("fuelList");
    box.put("value", value);
  }

  Future<List<Fuel>?> getListFuel() async {
    final box= await Hive.openBox("fuelList");
    return box.get("value");
  }

}
