import 'package:flutter/material.dart';
import 'package:vietjet_tool/ui/air_craft/air_craft.dart';
import 'package:vietjet_tool/ui/find_roster/find_roster_screen.dart';
import 'package:vietjet_tool/ui/fuelCalc/fuel_calc.dart';
import 'package:vietjet_tool/ui/home/my_home.dart';
import 'package:vietjet_tool/ui/mel_cat/mel_cat_screen.dart';
import 'package:vietjet_tool/ui/question/question.dart';
import 'package:vietjet_tool/ui/question/select_edit_review_quest.dart';
import 'package:vietjet_tool/ui/scan_document/scan_document.dart';
import 'package:vietjet_tool/ui/scan_document/scan_documet_controller.dart';

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
        return MaterialPageRoute(builder: (context) =>  ScanDocument(typeScan: TypeScan.selectScan,));
      case '/scan/scanDocument':
        return MaterialPageRoute(builder: (context) =>  ScanDocument(typeScan: TypeScan.scanDocument,));
      case '/scan/scanId':
        return MaterialPageRoute(builder: (context) =>  ScanDocument(typeScan: TypeScan.scanID,));
      case '/scan/scanPassPort':
        return MaterialPageRoute(builder: (context) =>  ScanDocument(typeScan: TypeScan.scanPassPort,));
      case '/aircraft':
        return MaterialPageRoute(builder: (context) => const AirCraftToolScreen());
      case '/aircraft/fuel':
        return MaterialPageRoute(builder: (context) => const FuelCalcScreen());
      case '/aircraft/mel':
        return MaterialPageRoute(builder: (context) => const MelCatScreen());
      case '/aircraft/findRoster':
        return MaterialPageRoute(builder: (context) => const FindRosterScreen());
        default:
        {
          return MaterialPageRoute(builder: (context) => const MyHome());
        }
    }
  }
}