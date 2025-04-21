import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vietjet_tool/common/template/my_state.dart';
import 'package:vietjet_tool/main.dart';
import 'package:vietjet_tool/widgets/dialog/dialogs.dart';

class MyController{
  
  MyState? myState;




  MyController(this.myState);




  Future<void> loadData()async{

  }


  
  void update(){
    myState?.setState(() {
      
    });
  }
  
  void setViewState(MyViewState myViewState ){
    myState?.myViewState=myViewState;
    myState?.setState(() {

    });
  }

  void  showErrorDialog(String error){
    BuildContext? context =navigatorKey.currentContext;
    if(context!=null) {
      showDialog(context: navigatorKey.currentContext!,
        builder: (context) =>
            MyAlertDialog(title: "Error", message: error, action: "Ok"),);
    }
  }
   void showSuccessDialog(String message){
    BuildContext? context =navigatorKey.currentContext;
    if(context!=null) {
      showDialog(context: navigatorKey.currentContext!,
          builder: (context) =>
              MyAlertDialog(title: "ok", message: message));
    }
  }


  static void showErrorDialogEvery(String error) {
    BuildContext? context =navigatorKey.currentContext;
    if(context!=null) {
      showDialog(context: navigatorKey.currentContext!,
        builder: (context) =>
            MyAlertDialog(title: "Error", message: error, action: "Ok"),);
    }
  }

  static void showSuccessDialogEvery(String message){
    BuildContext? context =navigatorKey.currentContext;
    if(context!=null) {
      showDialog(context: navigatorKey.currentContext!,
        builder: (context) =>
        MyAlertDialog(title: "Success", message: message));
    }
  }

   Future<bool> getExStoragePermission() async{
    try {
      Permission permission = Permission.storage;

      DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin
            .androidInfo;
        if (androidDeviceInfo.version.sdkInt >= 33) {
          permission = Permission.manageExternalStorage;
        }
      }
      return getPermission(permission);
    }
    catch(e){
      showErrorDialog(e.toString());
      return false;
    }
  }
   Future<bool> getPermission(Permission permission) async{
    try {
      PermissionStatus status=await permission.request();
      if (status.isGranted) {
        return true;

      } else if (status.isPermanentlyDenied) {
        // Notification permissions permanently denied, open app settings
        return await openAppSettings();
      }
      return false;

    }
    catch(e){
      showErrorDialog(e.toString());
      return false;
    }
  }

  Future<void> actionWithPermission(Permission permission,Function function ) async{
    try {
      PermissionStatus status = await permission.request();
      if (status.isGranted) {
        function;
      } else if (status.isDenied) {
        showErrorDialog("Not Permission ${permission.toString()}");

      } else if (status.isPermanentlyDenied) {
        // Notification permissions permanently denied, open app settings
        await openAppSettings();
      }


    }
    catch(e){
      showErrorDialog(e.toString());
    }
  }
  Future<void> actionWithPermissionStorage(  Function function ) async {
    try {
      //PermissionStatus status = await Permission.storage.request();

      Permission permission= Permission.storage;

      DeviceInfoPlugin  deviceInfoPlugin =DeviceInfoPlugin();
      if(Platform.isAndroid){
        AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
        if(androidDeviceInfo.version.sdkInt>=33){
          permission= Permission.manageExternalStorage;
        }
        await actionWithPermission(permission, function);
      }else{
        await actionWithPermission(permission, function);
      }









      // if (status.isGranted) {
      //   function;
      // } else if (status.isDenied) {
      //   showErrorDialog("Not Permission ${Permission.storage.toString()}");
      //
      // } else if (status.isPermanentlyDenied) {
      //   // Notification permissions permanently denied, open app settings
      //   await openAppSettings();
      // }


    }
    catch(e){
      showErrorDialog(e.toString());
    }
  }

//myViewState myViewState=myViewState.loadingAll;
  // MyState myState=MyState();
  //
  //
  // void loading(){
  //   try {
  //     myViewState = myViewState.loaded;
  //   }catch(e){
  //     myViewState=myViewState.error;
  //   }

  // }
  //
  // void updateState(myViewState myViewState){
  //   myState.setState(() {
  //     myState.myViewState=myViewState;
  //   });
  //
  //
  // }

}


