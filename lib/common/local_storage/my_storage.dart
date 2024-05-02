
import 'package:hive/hive.dart';
import 'package:vietjet_tool/models/fuel/fuel.dart';
import 'package:vietjet_tool/models/questions/question/question.dart';
import 'package:vietjet_tool/models/questions/type_question/type_question.dart';
import 'package:vietjet_tool/models/theme_models/my_theme.dart';

import '../../models/questions/bank_question/bank_question.dart';

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
  //questions
  Future<void> deleteListBankQuestion(String idTypeQuest) async {
    final box= await Hive.openBox("BankQuestionsList");
    box.delete(idTypeQuest);
  }

  Future<void> setListBankQuestion(List<BankQuestion> value, String idTypeQuest) async {
    final box= await Hive.openBox("BankQuestionsList");
    box.put(idTypeQuest, value);
  }

  Future<List<dynamic>?> getListBankQuestion(String idTypeQuest) async {
    final box= await Hive.openBox("BankQuestionsList");
    return box.get(idTypeQuest);
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
  // Future<void> setIdQuestion(int value) async {
  //   final box= await Hive.openBox("IdList");
  //   box.put("IdQuestion", value);
  // }
  //
  // Future<int?> getIdQuestion() async {
  //   final box= await Hive.openBox("IdList");
  //   return box.get("IdQuestion");
  // }






}
