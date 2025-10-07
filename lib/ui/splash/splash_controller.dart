import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:vietjet_tool/common/Constant/constant.dart';
import 'package:vietjet_tool/common/local_storage/my_storage.dart';
import 'package:vietjet_tool/controllers/apiServiceController.dart';
import 'package:vietjet_tool/controllers/my_controller.dart';
import 'package:vietjet_tool/models/user/my_user.dart';

import '../../common/template/my_state.dart';
import '../../controllers/gg_drive_controller/ggDriveController.dart';

class SplashController extends MyController {
  static List<String> keyloads = ['user', 'modelRev', 'apiService'];

  SplashController(MyState? state)
      : super(
          state,
          keysToLoad: keyloads, //?? ['user', 'modelRev'],
          loadingFunctions: {
            'user': () => loadUser(),
            'modelRev': () => loadModelRev(),
            'apiService': () => loadApiService(),
          },
        );

  static Future<void> loadUser() async {
    print("loadUser");
    ApiResult apiResult =
        await GoogleDriveController().listFiles(name: MyConstant.userTable);

    print("vao toi day ne");

    print(apiResult);
    if (apiResult.error == null &&
        apiResult.data != null &&
        apiResult.getData is List) {
      final List<dynamic> fileIds = apiResult.getData as List<dynamic>;
      if (fileIds.isEmpty) {
        MyUser myUser = MyUser.withDefaults();

        List<MyUser> users = List<MyUser>.empty(growable: true);
        users.add(myUser);
        String jsonUsers = jsonEncode(users.map((u) => u.toJson()).toList());

        String? parentFolderId = await MyStorage().getIdFolderPzoTool();
        // await GoogleDriveController().createFileContent(
        //     parentFolderId ?? MyConstant.idAppFolder,
        //     MyConstant.userTable, jsonUsers);
        await GoogleDriveController().createOrReplaceFileModel(users);
      } else {
        String idTableUser =
            (fileIds[0] as Map<String, dynamic>)["id"].toString();
        ApiResult apiResult =
            await GoogleDriveController().downloadFile(idTableUser);
        String data = apiResult.getData;
        String version = apiResult.getVersionModel ?? "0";
        print("version: $version");
        DateTime? revisionDate = apiResult.getRevisionDateModel;
        var aaa = apiResult.getDataModel;

        //final decoded = jsonDecode(data);

        final List<MyUser> users = (aaa as List<dynamic>)
            .map((item) => MyUser.fromJson(item as Map<String, dynamic>))
            .toList();
        MyStorage().setUser(users[0]);
      }

      print(" da lay dc");
      print(apiResult.data);
    } else {
      print("tra ve ket qua loi" + apiResult.error.toString());
    }
  }

  static Future<void> loadModelRev() async {
    // await GgDriveController().uploadOrReplaceTextFileInPzoToolFolder(fileName: "a.pzo", content: "thu cai  moi nao");

    //String? a= await GgDriveController().readTextFileFromDrive(fileName: "a.pzo");
  }
  static Future<void> loadApiService() async {
    //await ApiService().wakeup(60);
  }

  @override
  Future<void> loadDataFuture() async {
    print("loadDataFuture");
    // await GgDriveController().uploadOrReplaceTextFileInPzoToolFolder(fileName: "a.pzo", content: "thu cai  moi nao");

    //String? a= await GgDriveController().readTextFileFromDrive(fileName: "a.pzo");
  }

  @override
  Future<void> loadData() async {
    String baseUrl = await MyStorage().getApiBaseUrl() ?? MyConstant.baseUrl;
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
