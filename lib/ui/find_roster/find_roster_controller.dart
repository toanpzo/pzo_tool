
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:vietjet_tool/controllers/my_controller.dart';

import '../../common/local_storage/my_storage.dart';

class FindRosterController extends MyController{

  FindRosterController(super.myState);

 FilePickerResult? filePickerResult;



  @override
  Future<void> loadData() async{

    filePickerResult= await  MyStorage().readFilePicker();


  }






}