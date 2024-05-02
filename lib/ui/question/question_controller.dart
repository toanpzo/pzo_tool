
import 'package:vietjet_tool/common/local_storage/my_storage.dart';
import 'package:vietjet_tool/controllers/my_controller.dart';
import 'package:vietjet_tool/ui/question/question.dart';

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







}