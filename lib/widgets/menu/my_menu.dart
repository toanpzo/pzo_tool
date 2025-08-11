import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vietjet_tool/common/localizations/appLocalizations.dart';
import 'package:vietjet_tool/ui/setting/setting_screen.dart';

import '../../models/my_menu/my_menu.dart';

enum MyMenuType{gridView,listTitle}

class MyMenuWidgets extends StatelessWidget {
  final MyMenuType menuType;
  final List<MyMenu> menus;
  final bool? addSetTing;


   const MyMenuWidgets({super.key, required this.menuType, required this.menus, this.addSetTing});


  Widget menuItem({required BuildContext context,required String routerName,required int imageColorPrimary,
    required int numberColor,required double heightImage,
    required String assetImage,required String name, Color? colorText}){
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, routerName);
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
          color: Color(imageColorPrimary + numberColor *  200),),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(assetImage, height: heightImage,),
            Text(AppLocalizations.of(context).translate(name), style: Theme
                .of(context)
                .textTheme
                .titleLarge?.copyWith(
                color: colorText?? Colors.white
            )
              ,)
          ],),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    List<Widget> menuWidgets=List<Widget>.empty(growable: true);
    double heightImage=50;
    Color colorImage= Colors.white;
    int imageColorPrimary=Theme.of(context).primaryColor.value;
    if(menus.isNotEmpty) {
      for (var menu in menus) {
        if (menu.colorImage != null) {
          colorImage = Color(menu.colorImage!);
        }

        Image image = menu.image != null ? Image.memory(
            base64Decode(menu.image!), height: heightImage) :
        Image.asset(
          menu.assetImage ?? "assets/icons/logo.png", height: heightImage,);


        Widget menuWidget = InkWell(
          onTap: () {
             Navigator.pushNamed(context, menu.routerName);
          },
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
              color: menu.colorBox != null ? Color(menu.colorBox!) :
              Color(imageColorPrimary + menuWidgets.length * 200),),
            //menuWidgets.length%2==0?Theme.of(context).primaryColor:Theme.of(context).secondaryHeaderColor,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //imageContainer,
                image,
                Text(menu.name, style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(
                    color: Color(menu.colorImage ?? Colors.white.value)),)
              ],),
          ),
        );


        menuWidgets.add(menuWidget);
      }
    }
    else{



      // Widget questionWidget = InkWell(
      //   onTap: () {
      //      Navigator.pushNamed(context, "/quest");
      //   },
      //   child: Container(
      //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
      //       color: Color(imageColorPrimary + 0 *  200),),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //       Image.asset("assets/images/quest.png", height: heightImage,),
      //         Text(AppLocalizations.of(context).translate("Question"), style: Theme
      //             .of(context)
      //             .textTheme
      //             .titleLarge?.copyWith(
      //           color: Colors.white
      //         )
      //             ,)
      //       ],),
      //   ),
      // );
      Widget questionWidget=menuItem(context: context, routerName: "/quest", imageColorPrimary: imageColorPrimary,
          numberColor: 1, heightImage: heightImage, assetImage: "assets/images/quest.png", name: "Question tools");
      Widget scanWidget=menuItem(context: context, routerName: "/scan", imageColorPrimary: imageColorPrimary, numberColor: 2, heightImage: heightImage, assetImage: "assets/images/scan.png", name:  "Scan tools");
      Widget aircraftWidget=menuItem(context: context, routerName: "/aircraft", imageColorPrimary: imageColorPrimary, numberColor: 3,
          heightImage: heightImage, assetImage: "assets/images/aircraft.png", name: "Aircraft tools");
      // Widget questionWidget=menuItem(
      //
      //
      //     context, "/quest", imageColorPrimary, 1, heightImage, "assets/images/quest.png", "Question tools");
      //Widget scanWidget=menuItem(context, "/scan", imageColorPrimary, 2, heightImage, "assets/images/scan.png", "Scan tools");
      //Widget aircraftWidget=menuItem(context, "/aircraft", imageColorPrimary, 3, heightImage, "assets/images/aircraft.png", "Aircraft tools");

      menuWidgets.add(questionWidget);
      menuWidgets.add(scanWidget);
      menuWidgets.add(aircraftWidget);

    }

    

    if(addSetTing==true) {
      Widget menuSetTing = InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SettingScreen()));
          },
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
              color: Color(imageColorPrimary + menuWidgets.length * 200),
            ),
            //color: menu.colorBox!=null?Color(menu.colorBox!):menuWidgets.length%2==0?Theme.of(context).primaryColor:Theme.of(context).secondaryHeaderColor,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/setting.png",
                  height: 50,

                ),
                Text(AppLocalizations.of(context).translate("Setting"),
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.white),)
              ],

            ),

          ));

      menuWidgets.add(menuSetTing);
    }









    switch (menuType){
      case MyMenuType.gridView: return

        Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: (MediaQuery.of(context).size.width/200).round(),mainAxisSpacing: 10,crossAxisSpacing: 10),
              children: menuWidgets,
          )
        );
      case MyMenuType.listTitle: return Container();
      default: return Container();
    }
  }
}

