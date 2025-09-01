
import 'package:googleapis/connectors/v1.dart';
import 'package:vietjet_tool/controllers/apiServiceController.dart';
import 'package:vietjet_tool/controllers/gg_drive_controller/ggDriveController.dart';
import 'package:vietjet_tool/controllers/my_controller.dart';

import '../splash/splash_controller.dart';



class MyHomeController extends MyController{
  MyHomeController(super.myState);

  @override
  Future<void> loadData() async{
    await setVipFirstTime();

    print(ApiService().baseUrl);

    //final res = await ApiService().get("google-drive/listFile");
    //print(res);

    /// test



    //await GgDriveController().uploadOrReplaceTextFileInPzoToolFolder(fileName: "a.pzo", content: "thu cai  moi nao");

    //String? a= await GgDriveController().readTextFileFromDrive(fileName: "a.pzo");
    //print(a);
    //await Dropboxcontroller().uploadFileToDropbox(content: "{content:'dd'}", dropboxPath: "/a",overwrite: true);

    //String? aa=await Dropboxcontroller().readFileContent(dropboxPath: "/a");
    //print("object");
    ///

  }


}