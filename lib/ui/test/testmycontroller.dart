//
//
//
// import 'dart:convert';
// import 'dart:io';
// import 'dart:ui' as ui;
//
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../../common/local_storage/my_storage.dart';
// import '../../common/localizations/appLocalizations.dart';
// import '../../common/template/my_state.dart';
// import '../../main.dart';
// import '../../models/my_menu/my_menu.dart';
// import '../../models/user/myUser.dart';
// import '../../widgets/dialog/dialogs.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class MyController {
//   MyState? myState;
//   final int? numberLoadDataFuture;
//   final List<Future<void> Function()>? loadingFunctions;
//   late final List<Future<void>> loadingFutures;
//
//   MyController(
//       this.myState,
//       {
//     this.numberLoadDataFuture,
//     this.loadingFunctions,
//   }) {
//     if (numberLoadDataFuture != null &&
//         loadingFunctions != null &&
//         numberLoadDataFuture! <= loadingFunctions!.length) {
//       loadingFutures = List.generate(
//         numberLoadDataFuture!,
//             (i) => loadingFunctions![i](),
//       );
//     } else {
//       loadingFutures = [loadDataFuture()];
//     }
//   }
//
//
//   Future<void> loadDataFuture()async{// mac dinh load loadDataFuture0
//   }
//
//   // Future<void> loadDataFuture0()async{
//   //
//   // }
//   // Future<void> loadDataFuture1()async{
//   //
//   // }
//   // Future<void> loadDataFuture2()async{
//   //
//   // }
//   // Future<void> loadDataFuture3()async{
//   //
//   // }
//   // Future<void> loadDataFuture4()async{
//   //
//   // }
//   // Future<void> loadDataFuture5()async{
//   //
//   // }
//   // Future<void> loadDataFuture6()async{
//   //
//   // }
//   // Future<void> loadDataFuture7()async{
//   //
//   // }
//   // Future<void> loadDataFuture8()async{
//   //
//   // }
//   // Future<void> loadDataFuture9()async{
//   //
//   // }
//
//
//
//
//   Future<void> loadData()async{
//
//   }
//
//
//
//   void update(){
//     myState?.setState(() {
//
//     });
//   }
//
//   void setViewState(MyViewState myViewState ){
//     myState?.myViewState=myViewState;
//     myState?.setState(() {
//
//     });
//   }
//
//   void  showErrorDialog(String error){
//     BuildContext? context =navigatorKey.currentContext;
//     if(context!=null) {
//       showDialog(context: navigatorKey.currentContext!,
//         builder: (context) =>
//             MyAlertDialog(title: "Error", message: error, action: "Ok"),);
//     }
//   }
//   void showSuccessDialog(String message){
//     BuildContext? context =navigatorKey.currentContext;
//     if(context!=null) {
//       showDialog(context: navigatorKey.currentContext!,
//           builder: (context) =>
//               MyAlertDialog(title: "ok", message: message));
//     }
//   }
//   void showConfirmDialog({String? message,  required VoidCallback onContinue}){
//     BuildContext? context =navigatorKey.currentContext;
//     if(context!=null) {
//       showDialog(context: navigatorKey.currentContext!,
//           builder: (context) =>
//               MyConfirmDialog(
//                 message: message,
//                 actionTitle:  AppLocalizations.of(context).translate("Ok") ,
//                 cancelTitle: AppLocalizations.of(context).translate("Cancel"),
//                 onContinue: (){
//                   onContinue.call();
//                   Navigator.pop(context);
//                 },
//               ));
//     }
//   }
//   void showCusTomDialog({required String title,required Widget content
//     ,List<Widget>? actions,String? firstButton,VoidCallback? onFirstButton,String? secondButton,VoidCallback? onSecondButton,
//   }){
//     BuildContext? context =navigatorKey.currentContext;
//     if(context!=null) {
//       showDialog(context: navigatorKey.currentContext!,
//           builder: (context) =>
//               MyCustomDialog(title: title, content: content,
//                 actions: actions,
//                 firstButton: firstButton,
//                 onFirstButton: onFirstButton,
//                 onSecondButton: onSecondButton,
//                 secondButton: secondButton,
//               )
//
//       );
//     }
//   }
//
//
//   static void showErrorDialogEvery(String error) {
//     BuildContext? context =navigatorKey.currentContext;
//     if(context!=null) {
//       showDialog(context: navigatorKey.currentContext!,
//         builder: (context) =>
//             MyAlertDialog(title: "Error", message: error, action: "Ok"),);
//     }
//   }
//
//   static void showSuccessDialogEvery(String message){
//     BuildContext? context =navigatorKey.currentContext;
//     if(context!=null) {
//       showDialog(context: navigatorKey.currentContext!,
//           builder: (context) =>
//               MyAlertDialog(title: "Success", message: message));
//     }
//   }
//
//   Future<bool> getExStoragePermission() async{
//     try {
//       Permission permission = Permission.storage;
//
//       DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
//       if (Platform.isAndroid) {
//         AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin
//             .androidInfo;
//         if (androidDeviceInfo.version.sdkInt >= 33) {
//           permission = Permission.manageExternalStorage;
//         }
//       }
//       return getPermission(permission);
//     }
//     catch(e){
//       showErrorDialog(e.toString());
//       return false;
//     }
//   }
//   Future<bool> getPermission(Permission permission) async{
//     try {
//       PermissionStatus status=await permission.request();
//       if (status.isGranted) {
//         return true;
//
//       } else if (status.isPermanentlyDenied) {
//         // Notification permissions permanently denied, open app settings
//         return await openAppSettings();
//       }
//       return false;
//
//     }
//     catch(e){
//       showErrorDialog(e.toString());
//       return false;
//     }
//   }
//
//   Future<void> actionWithPermission(Permission permission,Function function ) async{
//     try {
//       PermissionStatus status = await permission.request();
//       if (status.isGranted) {
//         function;
//       } else if (status.isDenied) {
//         showErrorDialog("Not Permission ${permission.toString()}");
//
//       } else if (status.isPermanentlyDenied) {
//         // Notification permissions permanently denied, open app settings
//         await openAppSettings();
//       }
//
//
//     }
//     catch(e){
//       showErrorDialog(e.toString());
//     }
//   }
//   Future<void> actionWithPermissionStorage(  Function function ) async {
//     try {
//       //PermissionStatus status = await Permission.storage.request();
//
//       Permission permission= Permission.storage;
//
//       DeviceInfoPlugin  deviceInfoPlugin =DeviceInfoPlugin();
//       if(Platform.isAndroid){
//         AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
//         if(androidDeviceInfo.version.sdkInt>=33){
//           permission= Permission.manageExternalStorage;
//         }
//         await actionWithPermission(permission, function);
//       }else{
//         await actionWithPermission(permission, function);
//       }
//
//
//
//
//
//
//
//
//
//       // if (status.isGranted) {
//       //   function;
//       // } else if (status.isDenied) {
//       //   showErrorDialog("Not Permission ${Permission.storage.toString()}");
//       //
//       // } else if (status.isPermanentlyDenied) {
//       //   // Notification permissions permanently denied, open app settings
//       //   await openAppSettings();
//       // }
//
//
//     }
//     catch(e){
//       showErrorDialog(e.toString());
//     }
//   }
//
//
//
//   Future<void> setVipFirstTime()async{
//     // MyUser? user= await MyStorage().getUser();
//     // user ??= MyUser(name: "user${DateTime.now().toString()}", age: 18);
//     // /// if vip process
//     // /// else
//     // if(user.vipExd!=null&&user.vipExd!.isAfter(DateTime.now())){
//     //
//     // }else{
//     //   user= user.copyWith(vipExd: DateTime.now().add(const Duration(days: 3)));
//     // }
//     //
//     // await MyStorage().setUser(user);
//   }
//
//   Future<void> setVip(String code)async{
//     MyUser? user= await MyStorage().getUser();
//     if(user!=null){
//       //check code
//
//       int vipDay=0;
//       switch (code){
//         case "ToanPzo":vipDay=30;break;
//         case "CancelVip":vipDay=-35;break;
//         default: vipDay=0;break;
//       }
//
//
//       DateTime vipExd=user.vipExd??DateTime.now();
//       vipExd=vipExd.add(Duration(days: vipDay));
//       user=user.copyWith(vipExd: vipExd);
//       await MyStorage().setUser(user);
//     }
//   }
//
//   Future<bool> getVip()async{
//     MyUser? user =await MyStorage().getUser();
//     if(user!=null){
//       DateTime vipExd=user.vipExd??DateTime.now();
//       if(vipExd.isAfter(DateTime.now())){
//         return true;
//       }
//       else{
//         return false;
//       }
//     }
//     return false;
//   }
//
// //myViewState myViewState=myViewState.loadingAll;
//   // MyState myState=MyState();
//   //
//   //
//   // void loading(){
//   //   try {
//   //     myViewState = myViewState.loaded;
//   //   }catch(e){
//   //     myViewState=myViewState.error;
//   //   }
//
//   // }
//   //
//   // void updateState(myViewState myViewState){
//   //   myState.setState(() {
//   //     myState.myViewState=myViewState;
//   //   });
//   //
//   //
//   // }
//
//
//
//   /// menu
//   MyMenu createMyMenu(
//       {
//         Object? arguments ,
//         String? assetImage ,
//         int? colorBox ,
//         int? colorImage ,
//         int? colorText ,
//         String? image ,
//         String?  id, required String name, required int level, required String routerName
//       }
//       ){
//
//     MyMenu menu=MyMenu(
//         arguments: arguments,
//         assetImage: assetImage,
//         colorBox: colorBox,
//         colorImage: colorImage,
//         colorText: colorText,
//         image: image,
//         id: id??DateTime.now().toString(), name: name, level: level, routerName: routerName);
//     return menu;
//   }
//
//   ///convert
//   double ConvertCmToPt(double cm ){
//
//     return (cm/2.54)*72;
//   }
//
//   String ConvertMutiLaguage(String text,BuildContext context){
//
//
//     return AppLocalizations.of(context).translate(text);
//   }
//
//
//   Future<String> imageToBase64(File imageFile) async {
//     final bytes = await imageFile.readAsBytes();
//     String base64String = base64Encode(bytes);
//     return base64String;
//   }
//
//   Uint8List base64ToImageBytes(String base64String) {
//     return base64Decode(base64String);
//   }
//
//
//
//
//   Future<XFile?> pickImage() async {
//     final picker = ImagePicker();
//     final pickedFile =
//     await picker.pickImage(source: ImageSource.gallery);
//
//     return pickedFile;
//   }
//
//   Future<ui.Image> getImageInfo(File imageFile) async {
//     final data = await imageFile.readAsBytes();
//     final codec = await ui.instantiateImageCodec(data);
//     final frame = await codec.getNextFrame();
//     return frame.image;
//   }
//
// }