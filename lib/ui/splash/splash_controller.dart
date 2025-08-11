import 'dart:convert';

import 'package:vietjet_tool/common/Constant/constant.dart';
import 'package:vietjet_tool/common/local_storage/my_storage.dart';
import 'package:vietjet_tool/controllers/apiServiceController.dart';
import 'package:vietjet_tool/controllers/my_controller.dart';

import '../../common/template/my_state.dart';
import '../../controllers/gg_drive_controller/ggDriveController.dart';

class SplashController extends MyController{

  static List<String> keyloads=['user', 'modelRev','apiService'];

  SplashController(MyState? state)
      : super(
    state,
    keysToLoad: keyloads, //?? ['user', 'modelRev'],
    loadingFunctions: {
      'user': () => loadUser(),
      'modelRev': () => loadModelRev(),
      'apiService': () => loadApiService(),
    },
  ) ;


  static Future<void> loadUser() async {
    print("loadUser");

    //await GgDriveController().getGoogleRefreshToken();

    // String abc= await GgDriveController().downloadPublicDriveTextFile();
    // print(abc);
    //await GgDriveController().uploadOrReplaceTextFileInPzoToolFolder(pathFileName: 'a.pzo', content: '123456789');

    //String? a= await GgDriveController().readTextFileFromDrive(fileName: "a.pzo");
    //print(a);

  }

  static Future<void> loadModelRev() async {
   // await GgDriveController().uploadOrReplaceTextFileInPzoToolFolder(fileName: "a.pzo", content: "thu cai  moi nao");

    //String? a= await GgDriveController().readTextFileFromDrive(fileName: "a.pzo");
  }
  static Future<void> loadApiService() async {


  }

  @override
  Future<void> loadDataFuture() async{
    print("loadDataFuture");
   // await GgDriveController().uploadOrReplaceTextFileInPzoToolFolder(fileName: "a.pzo", content: "thu cai  moi nao");

    //String? a= await GgDriveController().readTextFileFromDrive(fileName: "a.pzo");
  }


  @override
  Future<void> loadData() async{
    String baseUrl= await MyStorage().getApiBaseUrl()??MyConstant.baseUrl;
    ApiService(baseUrl: baseUrl);


  }






// SplashController(MyState state)
  //     : super(
  //   state,
  //   keysToLoad: ['user', 'config', 'data'],
  //   loadingFunctions: {
  //     'user': () async {
  //       await Future.delayed(Duration(seconds: 1));
  //       print("👤 User loaded");
  //     },
  //     'config': () async {
  //       await Future.delayed(Duration(seconds: 1));
  //       print("⚙️ Config loaded");
  //     },
  //     'data': () async {
  //       await Future.delayed(Duration(seconds: 1));
  //       print("📦 Data loaded");
  //     },
  //   },
  // );






}