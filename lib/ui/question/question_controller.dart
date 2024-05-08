
import 'dart:convert';
import 'dart:io';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vietjet_tool/common/local_storage/my_storage.dart';
import 'package:vietjet_tool/controllers/my_controller.dart';
import 'package:vietjet_tool/models/questions/anwser/answer.dart';
import 'package:vietjet_tool/ui/question/question.dart';

import '../../common/Constant/constant.dart';
import '../../models/questions/bank_question/bank_question.dart';
import '../../models/questions/question/question.dart';
import '../../models/questions/type_question/type_question.dart';

class QuestionController extends MyController{
  QuestionController(super.myState);

  List<TypeQuestion>? typeQuestions;
  List<BankQuestion>? bankQuestions;
  List<Question>? questions;

  String idParentPage="";
  // String idBankEdit="";
  // String idQuestEdit="";

  TypePage type= TypePage.isTypeQuestions;


  @override
  Future<void> loadData() async{
    // TODO: implement loadData
    switch(type){
      case TypePage.isTypeQuestions:await getTypeQuestions();break;
      case TypePage.isBankQuestion: await getBankQuestions(idParentPage); break;
      case TypePage.isQuestion: await getQuestions(idParentPage); break;
    }



  }

  Future<List<TypeQuestion>> getTypeQuestions() async{

    typeQuestions=List<TypeQuestion>.empty(growable: true);

    var a= await MyStorage().getListTypeQuestion();
    a?.forEach((element) {
      typeQuestions?.add(element as TypeQuestion);
    });
    return typeQuestions!;

  }

  Future<List<BankQuestion>> getBankQuestions(String idTypeQuest) async{

    bankQuestions= List<BankQuestion>.empty(growable: true);
    var result= await MyStorage().getListBankQuestion(idTypeQuest);
    result?.forEach((element) {
      bankQuestions?.add(element as BankQuestion);
    });

    return bankQuestions!;

  }
  Future<List<Question>> getQuestions(String idBank) async{

    questions= List<Question>.empty(growable: true);
    var result= await MyStorage().getListQuestion(idBank);
    result?.forEach((element) {
      questions?.add(element as Question);
    });

    return questions!;

  }

  Future<void> saveTypeQuestion(List<TypeQuestion> values) async{
    typeQuestions=values;
    await MyStorage().setListTypeQuestion(values);
    update();
  }

  Future<void> saveBankQuestion(List<BankQuestion> values,String idTypeQuestion) async{
    bankQuestions=values;
    await MyStorage().setListBankQuestion(values, idTypeQuestion);
    update();
  }

  Future<void> saveQuestion(List<Question> values,String idBankQuestion) async{
    questions=values;
    await MyStorage().setListQuestion(values,idBankQuestion);

    //update();
  }


  Future<void> deleteBankQuestion(String idBankQuestion)async{
    try{
    await MyStorage().deleteListQuestion(idBankQuestion);
    bankQuestions?.removeWhere((element) => element.id==idBankQuestion);
    if (bankQuestions!=null){
      saveBankQuestion(bankQuestions!,idParentPage);
    }
    update();
    }
    catch(e){
      showErrorDialog(e.toString());
    }
  }

  Future<void> deleteTypeQuestion(String idTypeQuestion ) async{

try {
  var result = await MyStorage().getListBankQuestion(idTypeQuestion);

  result?.forEach((element) async {
    await MyStorage().deleteListQuestion((element as BankQuestion).id);
  });
  await MyStorage().deleteListBankQuestion(idTypeQuestion);

  typeQuestions?.removeWhere((element) => element.id==idTypeQuestion);
  if (typeQuestions!=null){
    saveTypeQuestion(typeQuestions!);
  }
  update();

}
   catch(e){
  showErrorDialog(e.toString());
   }




  }


  Future<void> saveListQuestionToDisk( List<Question> questions,String fileName,String typeFile)async {
    try {
      String json= jsonEncode(questions);
       PermissionStatus status = await Permission.storage.request();
      if (status.isGranted) {

        await MyStorage().writeFileJson(json,fileName,typeFile: typeFile).then((value) {

        }
        );

      } else if (status.isDenied) {
        var a= await Permission.manageExternalStorage.request();
        if(a.isGranted){
          await MyStorage().writeFileJson(json, fileName,typeFile: typeFile).then((value) {

          }
          );

        }else{

        }
      } else if (status.isPermanentlyDenied) {
        // Notification permissions permanently denied, open app settings
        await openAppSettings();
      }


    }
    catch(e){
      showErrorDialog(e.toString());
    }
  }

  Future<List<Question>> openListQuestionToDisk({List<String>? typeFile})async {

    List<Question> questions=List<Question>.empty(growable: true);

    try {
      File file;
      FilePickerResult? filePickerResult=await MyStorage().readFilePicker(typeFile: typeFile);

      if(filePickerResult!=null){
        file = File(filePickerResult.files.single.path!);

        String? typeFilePicker=filePickerResult.files.single.extension;

        switch(typeFilePicker){
          case "bin"||MyConstant.fileNameQuest:
            String jsonQuestions="";
              if (!kIsWeb && Platform.isAndroid) {
                jsonQuestions = utf8.decode(file.readAsBytesSync());
              }
              else if (!kIsWeb && Platform.isIOS) {
                jsonQuestions = utf8.decode(file.readAsBytesSync());
              } else {
                //jsonQuestions = utf8.decode(file.bytes!.toList());
              }

            for (var element in (jsonDecode(jsonQuestions)as List<dynamic>)) {
              questions.add(Question.fromJson(element));
            }

            break;

          case "xlsx"||"xls":

            Excel excelN =Excel.createExcel();

            if (!kIsWeb && Platform.isAndroid) {
              excelN = Excel.decodeBytes(file.readAsBytesSync());
            }
            else if (!kIsWeb && Platform.isIOS) {
              excelN = Excel.decodeBytes(file.readAsBytesSync());
            } else {
              //excelN = Excel.decodeBytes(file.bytes!.toList());
            }


        String sheetName=excelN.tables.keys.first;
        Sheet sheet=excelN[sheetName];
              String numberAnswerStr = sheet
                  .cell(CellIndex.indexByString("B1"))
                  .value
                  .toString()
                  .trim();
              int numberAnswer = int.parse(numberAnswerStr);
              int dem = 1;
              bool end = false;
              //bool begin=false;
              for (int i = 1; i < 20; i++) {
                String valueCell = sheet
                    .cell(CellIndex.indexByString("A$i"))
                    .value
                    .toString()
                    .trim();
                if (valueCell == MyConstant.beginQuest) {
                  dem = i + 1;
                  break;
                }
              }
              while (dem < 100000 && !end) {
                String questionStr = sheet
                    .cell(CellIndex.indexByString("A$dem"))
                    .value
                    .toString()
                    .trim();
                if (questionStr == MyConstant.endQuest) {
                  end = true;
                  break;
                }
                List<Answer> answers = List<Answer>.empty(growable: true);
                Answer answerCorrect = Answer(text: "das");
                dem++;
                for (int i = 0; i < numberAnswer; i++) {
                  Data cell = sheet.cell(CellIndex.indexByString("A$dem"));
                  if (cell.value.toString().trim() == MyConstant.endQuest) {
                    end = true;
                    break;
                  }
                  Answer answer = Answer(text: cell.value.toString().trim());
                  answers.add(answer);


                  if (cell.cellStyle?.isBold == true) {
                    answerCorrect = answer;
                  }


                  dem++;
                }
                Question question = Question(answerCorrect: answerCorrect,
                    idBankQuestion: idParentPage,
                    numberQuestion: numberAnswer,
                    id: DateTime.now().toString(),
                    question: questionStr,
                    answers: answers);
                questions.add(question);
              }













            break;
          default: break;
        }

      }

      return questions;




     // String typeFileRead=file.













    }
    catch(e){
      showErrorDialog(e.toString());
    }
    return questions;
  }








}