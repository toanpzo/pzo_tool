
import 'package:vietjet_tool/common/local_storage/my_storage.dart';
import 'package:vietjet_tool/controllers/my_controller.dart';
import 'package:vietjet_tool/models/fuel/fuel.dart';
import 'package:vietjet_tool/models/theme_models/my_theme.dart';

class SettingController extends MyController{
  MyTheme myTheme = MyTheme();

  SettingController(super.myState);

  @override
  Future<void> loadData() async {
    myTheme=await MyStorage().getTheme();
  }





}