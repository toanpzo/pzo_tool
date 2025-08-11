import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vietjet_tool/common/local_storage/my_storage.dart';
import 'package:vietjet_tool/common/template/my_state.dart';
import 'package:vietjet_tool/controllers/my_controller.dart';
import 'package:vietjet_tool/models/theme_models/my_theme.dart';
import 'package:vietjet_tool/theme/theme.dart';
import 'package:vietjet_tool/ui/setting/setting_controller.dart';
import 'package:vietjet_tool/widgets/dialog/dialogs.dart';
import 'package:vietjet_tool/widgets/text_field/text_filed.dart';

import '../../widgets/MyListtitle/list_tile.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  MyState createState() => _SettingScreenState();
}

class _SettingScreenState extends MyState<SettingScreen> {
  @override
  MyController createController() {
    return SettingController(this);
  }

  bool lightMode=true;

   MyTheme? myTheme;


  @override
  Widget setBody() {
    myTheme??=(controller as SettingController).myTheme;
    TextEditingController codeVipController=TextEditingController();

   return ListView(
     children: [
       MyListTile(title: "Theme", context: context,type: TypeListTile.setting,
       trailing: Switch(
         value: myTheme!.brightness==1?false:true,
         onChanged: (value)async{
           if(value){
             await MyStorage().setBrightness(0);

           }else{
             await MyStorage().setBrightness(1);
           }
           myTheme=await MyStorage().getTheme();

           context.read<ChangeTheme>().setAppColor(myTheme??MyTheme());
         },
       ),
       ),
       MyListTile(title: title, context: context,type: TypeListTile.setting,
       onTap: ()async{
         Color cl=Colors.red;
         await showDialog(context: context, builder: (context) => MyColorPicker(pickerColor: Colors.white70, onColorChanged: (value){cl=value;}),);
          print(cl.toString());
       },
       ),
       MyListTile(title: "CodeVip", context: context,type: TypeListTile.setting,
         onTap: ()async{
           controller.showCusTomDialog(title: "Input CodeVip", content: MyTextFiled(
             controller: codeVipController,

           ),onFirstButton: (){
             controller.setVip(codeVipController.text);
           }

           );

         },
       )
     ],
   );
  }

  @override
  String setTitle() {
    return "Setting";
  }

}