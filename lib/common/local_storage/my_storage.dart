
import 'dart:convert';
//import 'dart:html' show AnchorElement;
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_html/html.dart' show AnchorElement;
import 'package:vietjet_tool/common/template/my_state.dart';
import 'package:vietjet_tool/controllers/my_controller.dart';
import 'package:vietjet_tool/models/fuel/fuel.dart';
import 'package:vietjet_tool/models/questions/question/question.dart';
import 'package:vietjet_tool/models/questions/save_score/save_score.dart';
import 'package:vietjet_tool/models/questions/type_question/type_question.dart';
import 'package:vietjet_tool/models/questions/wrong_question/wrong_question.dart';
import 'package:vietjet_tool/models/theme_models/my_theme.dart';

import '../../models/questions/bank_question/bank_question.dart';
import '../Constant/constant.dart';

class MyStorage {


  Future<void> setBrightness(int value) async {
    final box= await Hive.openBox("myTheme");
    box.put("brightness", value);
  }

  Future<int?> getBrightness() async {
    final box= await Hive.openBox("myTheme");
    return box.get("brightness");
  }


  Future<void> setTheme(MyTheme myTheme) async {

    final box= await Hive.openBox("myTheme");


    if (myTheme.brightness == 1) {
      box.put("brightness", 1);
      box.put("dark", myTheme);
    } else {
      box.put("brightness", 0);
      box.put("light", myTheme);
    }



    // SharedPreferences preferences = await sharedPreferences;
    // String colorString = jsonEncode(myTheme.toJson());
    // if (myTheme.brightness == 1) {
    //   preferences.setInt("MyBrightness", myTheme.brightness!);
    //   preferences.setString("MyDarkTheme", colorString);
    // } else {
    //   preferences.setInt("MyBrightness", myTheme.brightness ?? 0);
    //   preferences.setString("MyTheme", colorString);
    // }
  }

  Future<MyTheme> getTheme() async {
    final box= await Hive.openBox("myTheme");

    int? brightness= box.get("brightness");
    if(brightness==1){
      return box.get("dark")??MyTheme();
    }else{

      return box.get("light")??MyTheme();
    }




    // SharedPreferences preferences = await sharedPreferences;
    // String? colorString;
    // int? myBrightness = preferences.getInt("MyBrightness");
    //
    // if (myBrightness == 1) {
    //   colorString = preferences.getString("MyDarkTheme");
    // } else {
    //   colorString = preferences.getString("MyTheme");
    // }
    //
    //
    // MyTheme myTheme = MyTheme();
    //
    // if (colorString != null) {
    //   myTheme = MyTheme.fromJson(jsonDecode(colorString));
    // }
    // return myTheme;
  }


  Future<void> setFuel(Fuel value) async {
    final box= await Hive.openBox("fuel");
    box.put("value", value);
  }

  Future<Fuel?> getFuel() async {
    final box= await Hive.openBox("fuel");
    return box.get("value");
  }

  Future<void> setListFuel(List<Fuel> value) async {
    final box= await Hive.openBox("fuelList");
    box.put("value", value);
  }

  Future<List<TypeQuestion>?> getListFuel() async {
    final box= await Hive.openBox("fuelList");
    return box.get("value");
  }
//type question
  Future<void> setListTypeQuestion(List<TypeQuestion> value) async {
    final box= await Hive.openBox("typeQuestionList");
    box.put("value", value);
  }

  Future<List<dynamic>?> getListTypeQuestion() async {
    final box= await Hive.openBox("typeQuestionList");
    return box.get("value");
  }
  //question

  Future<void> deleteListQuestion(String idBankQuestion) async {
    final box= await Hive.openBox("QuestionList");
    box.delete(idBankQuestion);
  }

  Future<void> setListQuestion(List<Question> value, String idBankQuestion) async {
    final box= await Hive.openBox("QuestionList");
    box.put(idBankQuestion, value);
  }

  Future<List<dynamic>?> getListQuestion(idBankQuestion) async {
    final box= await Hive.openBox("QuestionList");
    return box.get(idBankQuestion);
  }

  Future<void> setListQuestionShow(List<Question> value, String idBankQuestion) async {
    final box= await Hive.openBox("QuestionListShow");
    box.put(idBankQuestion, value);
  }

  Future<List<dynamic>?> getListQuestionShow(idBankQuestion) async {
    final box= await Hive.openBox("QuestionListShow");
    return box.get(idBankQuestion);
  }

  Future<void> deleteListQuestionShow(idBankQuestion) async {
    final box= await Hive.openBox("QuestionListShow");
    box.delete(idBankQuestion);
  }
  //questions
  Future<void> deleteListBankQuestion(String idTypeQuest) async {
    final box= await Hive.openBox("BankQuestionsList");
    box.delete(idTypeQuest);
  }

  Future<void> setListBankQuestion(List<BankQuestion> value, String idTypeQuest) async {
    final box= await Hive.openBox("BankQuestionsList");
    box.put(idTypeQuest, value);
  }

  Future<Map<dynamic,dynamic>?> getAllListBankQuestion() async {
    final box= await Hive.openBox("BankQuestionsList");
    Map<dynamic,dynamic> allData=box.toMap();
    return allData;
  }
  Future<List<dynamic>?> getListBankQuestion(String idTypeQuest) async {
    final box= await Hive.openBox("BankQuestionsList");
    return box.get(idTypeQuest);
  }


  Future<void> setSaveScore(SaveScore value,String idBankQuest) async {
    final box= await Hive.openBox("SaveScore");
    box.put(idBankQuest, value);
  }

  Future<SaveScore?> getSaveScore(String idBankQuest) async {
    final box= await Hive.openBox("SaveScore");
    return box.get(idBankQuest);
  }

  Future<void> setWrongQuestion(List<WrongQuestion> value,String idBankQuest) async {
    final box= await Hive.openBox("WrongQuestion");
    box.put(idBankQuest, value);
  }

  Future<List<WrongQuestion>?> getWrongQuestion(String idBankQuest) async {
    final box= await Hive.openBox("WrongQuestion");
    return box.get(idBankQuest);
  }

  //
  // Future<void> setIdTypeQuestion(int value) async {
  //   final box= await Hive.openBox("IdList");
  //   box.put("IdTypeQuestion", value);
  // }
  //
  // Future<int?> getIdTypeQuestion() async {
  //   final box= await Hive.openBox("IdList");
  //   return box.get("IdTypeQuestion");
  // }
  //
  // Future<void> setIdQuestions(int value) async {
  //   final box= await Hive.openBox("IdList");
  //   box.put("IdQuestions", value);
  // }
  //
  // Future<int?> getIdQuestions() async {
  //   final box= await Hive.openBox("IdList");
  //   return box.get("IdQuestions");
  // }
  //
  Future<void> setPathSave(String value,{String? typeFile}) async {
    final box= await Hive.openBox("pathSave");
    box.put(typeFile??"pathSave", value);
  }

  Future<String?> getPathSave({String? typeFile}) async {
    final box= await Hive.openBox("pathSave");
    return box.get(typeFile??"pathSave");
  }

  // Future<void> setPathSaveQuest(String value,) async {
  //   final box= await Hive.openBox("pathSave");
  //   box.put("pathSaveQuest", value);
  // }
  //
  // Future<String?> getPathSaveQuest() async {
  //   final box= await Hive.openBox("pathSave");
  //   return box.get("pathSaveQuest");
  // }
  //
  // Future<void> setPathSaveScan(String value) async {
  //   final box= await Hive.openBox("pathSave");
  //   box.put("pathSaveScan", value);
  // }
  //
  // Future<String?> getPathSaveScan() async {
  //   final box= await Hive.openBox("pathSave");
  //   return box.get("pathSaveScan");
  // }








  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> getLocalFile(String fileName) async {
    final path = await _localPath;
    return File('$path/$fileName');
  }

  writeFileLocal(String fileName,List<int> bytes)async{
    File file= await getLocalFile(fileName);
    file.writeAsBytes(bytes);
  }

  Future<String> getPathFromFilePicker({bool? changePath, String? typeFile}) async {

    String? pathSave= await getPathSave(typeFile: typeFile);

    if(pathSave==null|| changePath==true){

      String? path = await FilePicker.platform.getDirectoryPath();

      if (path != null) {
        await setPathSave(path,typeFile: typeFile);
        return path;
      } else {
        return _localPath;
      }

    }
    else {
      return pathSave;
    }
  }



  // Future<File> getFileFromFilePicker(String fileName) async {
  //   final path = await getPathFromFilePicker(changePath: true);
  //   return File('$path/$fileName');
  // }





  Future<File?> readFile({
    List<String>? typeFile
  }) async {
    File? filePicker;
    try {
      FilePickerResult? filePickerResult= await FilePicker.platform.pickFiles(
        type: typeFile!=null?FileType.custom:FileType.any,
          allowedExtensions:typeFile ?? []
      );

      if(filePickerResult!=null){
        filePicker = File(filePickerResult.files.single.path!);
        //String contents = await filePicker.readAsString();
         // return contents;
        }
      return filePicker;

    } catch (e) {
      // If encountering an error, return 0
      return filePicker;
    }
  }

  Future<FilePickerResult?> readFilePicker({
    List<String>? typeFile
  }) async {

    try {
      FilePickerResult? filePickerResult= await FilePicker.platform.pickFiles(
          type: typeFile!=null?FileType.custom:FileType.any,
          allowedExtensions:typeFile ?? []
      );


      return filePickerResult;

    } catch (e) {
      // If encountering an error, return 0
      return null;
    }
  }

  Future<File> checkFileExist(String path,String fileName, typeFile,int dem) async{

    String pathFile="$path/$fileName$dem.${typeFile??MyConstant.fileNameDefault}";
    File file= File(pathFile);

      bool result= await file.exists();
      if(result){
        int moi =dem+1;
        return await checkFileExist(path, fileName, typeFile, moi);
      }else{
        return File(pathFile);
      }



  }

  Future<void> writeFile(List<int> bytes ,String fileName,{String? typeFile}) async {
    try {

      bool permision= await MyController(null).getExStoragePermission();
      if(!permision){
        return;
      }

      if(kIsWeb){
        String name="$fileName.${typeFile??MyConstant.fileNameDefault}";
        AnchorElement()
          ..href = '${Uri.dataFromBytes(bytes //, mimeType: 'text/plain'
          )}'
          ..download = name
          ..style.display = 'none'
          ..click();

      }else{
        int dem=1;

        final path = await getPathFromFilePicker(typeFile: typeFile);

        String pathFile="$path/$fileName.${typeFile??MyConstant.fileNameDefault}";




        File file = File(pathFile);


        bool exist= await  file.exists();
        if(exist){
          dem=1;
          //pathFile=   "$path/$fileName$dem.${typeFile??fileNameDefault}";
          file=  await checkFileExist(path, fileName, typeFile, dem);
        }

        //file.writeAsBytesSync(utf8.encode(jsonEncode));


        file.writeAsBytes(bytes).whenComplete((){
          MyController.showSuccessDialogEvery("save in ${file.path}");

        });

      }













    }catch(e){
      MyController.showErrorDialogEvery(e.toString());


    }
  }


  Future<void> writeFileJson(String jsonEncode ,String fileName,{String? typeFile}) async {
    try {
      bool permision= await MyController(null).getExStoragePermission();
      if(!permision){
        return;
      }

      if(kIsWeb){
        String name="$fileName.${typeFile??MyConstant.fileNameDefault}";
        AnchorElement()
          ..href = '${Uri.dataFromString(jsonEncode, mimeType: 'text/plain', encoding: utf8)}'
          ..download = name
          ..style.display = 'none'
          ..click();

      }else{
        int dem=1;

        final path = await getPathFromFilePicker(typeFile: typeFile);

        String pathFile="$path/$fileName.${typeFile??MyConstant.fileNameDefault}";




        File file = File(pathFile);


        bool exist= await  file.exists();
        if(exist){
          dem=1;
          //pathFile=   "$path/$fileName$dem.${typeFile??fileNameDefault}";
          file=  await checkFileExist(path, fileName, typeFile, dem);
        }

        //file.writeAsBytesSync(utf8.encode(jsonEncode));


        file.writeAsBytes(utf8.encode(jsonEncode)).whenComplete((){
          MyController.showSuccessDialogEvery("save in ${file.path}");

        });

      }













    }catch(e){
      MyController.showErrorDialogEvery(e.toString());


    }
  }






}


class MyStorageAction extends StatefulWidget {
  const MyStorageAction({super.key});

  @override
  State<MyStorageAction> createState() => _MyStorageActionState();
}

class _MyStorageActionState extends MyState<MyStorageAction> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  MyController createController() {
    // TODO: implement createController
    throw UnimplementedError();
  }

  @override
  Widget setBody() {
    // TODO: implement setBody
    throw UnimplementedError();
  }

  @override
  String setTitle() {
    // TODO: implement setTitle
    throw UnimplementedError();
  }
}

