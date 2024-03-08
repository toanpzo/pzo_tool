
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:vietjet_tool/controllers/my_controller.dart';

import '../../models/fuel/fuel.dart';

class MyHomeController extends MyController{
  MyHomeController(super.myState);

  // @override
  // Future<void> loadData() async{
  //   // TODO: implement loadData
  //   await Future.delayed(Duration(seconds: 3));
  //
  // //  var path = Directory.current.path;
  // //  Hive.init(path);
  //
  //   var box = await Hive.openBox("name");
  //
  //   var boxf = await Hive.openBox<List<Fuel>>("fuel");
  //
  //   var boxFuel = await Hive.openBox<Fuel>("Fuel1");
  //
  //   //boxFuel.put("1", Fuel(beforeL: 100));
  //
  //   var valufuel=boxFuel.get("1");
  //   print(valufuel);
  //
  //   var boxMap = await Hive.openBox<Map>("map");
  //
  //  // boxMap.put("1", {"a":1});
  //
  //   var valumap=boxMap.get("1");
  //   print(valumap);
  //
  //   // List<Fuel> list=List<Fuel>.empty(growable: true);
  //   // list.add(Fuel(afterR: 100));
  //   // list.add(Fuel(afterR: 200));
  //   // list.add(Fuel(afterR: 300));
  //   //
  //   // boxf.put("1", list);
  //
  //   var ne=boxf.get("1");
  //   print(ne);
  //
  //
  //  // box.put('name', 'David');
  //
  //   var name = box.get('name');
  //
  //   print('Name: $name');
  //
  //
  //  //
  //  //  var box = await Hive.openBox('testBox');
  //  //
  //  //  box.put("a", "b");
  //  //  box.put("b", "c");
  //  //
  //  //
  //  // var c= box.get("a");
  //  // print(c);
  //  //
  //
  //
  //   // Box<Fuel> name= await Hive.openBox<Fuel>("name");
  //   //
  //   // name.add(Fuel(afterC: 100,afterL: 100,afterR: 100));
  //   // name.add(Fuel(afterC: 200,afterL: 200,afterR: 200));
  //   // name.add(Fuel(afterC: 300,afterL: 300,afterR: 300));
  //   //
  //   // name.putAll(name.toMap());
  //   //
  //   // print(name);
  //   //
  //   // var a= name.get("name");
  //   //
  //   // print(a);
  //
  //
  //
  //
  //
  //
  //
  //
  // }



}