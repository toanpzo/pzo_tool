import 'package:flutter/material.dart';
import 'package:vietjet_tool/ui/air_craft/air_craft.dart';
import 'package:vietjet_tool/ui/fuelCalc/fuel_calc.dart';
import 'package:vietjet_tool/ui/home/my_home.dart';
import 'package:vietjet_tool/ui/mel_cat/mel_cat_screen.dart';
import 'package:vietjet_tool/ui/question/question.dart';
import 'package:vietjet_tool/ui/question/select_edit_review_quest.dart';
import 'package:vietjet_tool/ui/scan_document/scan_document.dart';

class ScreenArguments {
  final String url;
  final Map jsonbody;

  ScreenArguments(this.url, this.jsonbody);
}

class RouteController {
  Route<dynamic>? getGenerateRoute(RouteSettings st, BuildContext context) {

    switch (st.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const MyHome());
      case '/quest':
        return MaterialPageRoute(builder: (context) =>
        const SelectEditOrReviewQuest());
      case '/quest/edit':
        return MaterialPageRoute(builder: (context) => const QuestionScreen(typePage: TypePage.isTypeQuestions,edit: true,));
      case '/quest/review':
        return MaterialPageRoute(builder: (context) => const QuestionScreen(typePage: TypePage.isTypeQuestions));

      case '/scan':
        return MaterialPageRoute(builder: (context) => const ScanDocument());
      case '/aircraft':
        return MaterialPageRoute(builder: (context) => const AirCraftToolScreen());
      case '/aircraft/fuel':
        return MaterialPageRoute(builder: (context) => const FuelCalcScreen());
      case '/aircraft/mel':
        return MaterialPageRoute(builder: (context) => const MelCatScreen());
        default:
        {
          return MaterialPageRoute(builder: (context) => const MyHome());
        }
    }
  }
}