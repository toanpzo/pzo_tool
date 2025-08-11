import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vietjet_tool/common/template/my_state.dart';
import 'package:vietjet_tool/controllers/my_controller.dart';
import 'package:vietjet_tool/models/my_menu/my_menu.dart';
import 'package:vietjet_tool/ui/home/my_home_controller.dart';
import 'package:vietjet_tool/widgets/menu/my_menu.dart';

import '../../controllers/gg_drive_controller/ggDriveController.dart';
import '../../models/questions/anwser/answer.dart';
import '../splash/splash_controller.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  MyState createState() => _MyHomeState();
}

class _MyHomeState extends MyState<MyHome> {
  @override
  bool get drawer => true;



  @override
  MyController createController() {
    return MyHomeController(this);
  }


  // ///test
  // @override
  // Future<void> afterLoadData() async{
  //   final controllerSplash = Provider.of<SplashController>(context, listen: false);
  //   controller.setViewState(MyViewState.loadingAll);
  //   await controllerSplash.loadingFutures["user"];
  //   controller.setViewState(MyViewState.loaded);
  //   // TODO: implement afterLoadData
  //   return super.afterLoadData();
  // }
  //
  // ///



  List<Answer> menu=List<Answer>.empty(growable: true);



  @override
  Widget setBody() {

    MyMenuType menuType=MyMenuType.gridView;
    List<MyMenu> menus=List<MyMenu>.empty(growable: true);
    // for(int i=0;i<5;i++){
    //   menus.add(MyMenu(id: DateTime.now().toString(), name: " name$i", level: 1, routerName: "/$i"));
    // }

    final orientation = MediaQuery.of(context).orientation;
    double widthDevice=MediaQuery.of(context).size.width;

    Container a= Container(
      width: 100,
    );
    return
    MyMenuWidgets(menuType: menuType, menus: menus,addSetTing: true);



  }

  @override
  String setTitle() {
    return "Home";

      //AppLocalizations.of(context).translate("Home");
  }
}
