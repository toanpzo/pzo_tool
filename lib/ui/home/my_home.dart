import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:vietjet_tool/common/color/colors.dart';
import 'package:vietjet_tool/common/localizations/appLocalizations.dart';
import 'package:vietjet_tool/common/template/my_page.dart';
import 'package:vietjet_tool/common/template/my_state.dart';
import 'package:vietjet_tool/controllers/my_controller.dart';
import 'package:vietjet_tool/models/theme_models/my_theme.dart';
import 'package:vietjet_tool/theme/theme.dart';
import 'package:vietjet_tool/ui/fuelCalc/fuel_calc.dart';
import 'package:vietjet_tool/ui/home/my_home_controller.dart';
import 'package:vietjet_tool/ui/mel_cat/mel_cat_screen.dart';
import 'package:vietjet_tool/ui/test/test.dart';
import 'package:vietjet_tool/ui/test/testuploadphoto.dart';
import 'package:vietjet_tool/ui/testScreen/testScreen.dart';
import 'package:vietjet_tool/widgets/button/button_widget.dart';
import 'package:vietjet_tool/widgets/dialog/dialogs.dart';

import '../../models/theme_models/my_color_scheme.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  MyState createState() => _MyHomeState();
}

class _MyHomeState extends MyState<MyHome> {
  @override
  // TODO: implement drawer
  bool get drawer => true;



  @override
  MyController createController() {
    return MyHomeController(this);
  }


  @override
  Widget setBody() {
    return Center(
      child: Column(
        children: [
          Expanded(child: SizedBox()),
          MyButton( width: MediaQuery.of(context).size.width*0.8,content: AppLocalizations.of(context).translate("fuelCalc"),onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const FuelCalcScreen(),));
          }),
          MyButton( width: MediaQuery.of(context).size.width*0.8,content: AppLocalizations.of(context).translate("melCalc"),onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MelCatScreen(),));
          }),

          MyButton(content: "set",onPressed: (){
            context.read<ChangeTheme>().setAppColor(MyTheme(myColorScheme: MyColorScheme(

            )));
          }),
          MyButton(content: "set1",onPressed: (){
            context.read<ChangeTheme>().setAppColor(MyTheme(myColorScheme: MyColorScheme(
              primary: Colors.red.value

            )));
          }),
          MyButton( width: MediaQuery.of(context).size.width*0.8,content: AppLocalizations.of(context).translate("test"),onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInDemo(),));
          }),
          MyButton( width: MediaQuery.of(context).size.width*0.8,content: AppLocalizations.of(context).translate("upload phôt"),onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const UploadPhotoScreen(),));
          }),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  @override
  String setTitle() {
    return "Home";

      //AppLocalizations.of(context).translate("Home");
  }
}
