import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vietjet_tool/common/local_storage/my_storage.dart';
import 'package:vietjet_tool/common/localizations/appLocalizations.dart';
import 'package:vietjet_tool/common/template/my_state.dart';
import 'package:vietjet_tool/controllers/excel_controller/excel_controller.dart';
import 'package:vietjet_tool/controllers/my_controller.dart';
import 'package:vietjet_tool/ui/find_roster/find_roster_controller.dart';
import 'package:vietjet_tool/ui/mel_cat/mel_cat_controller.dart';
import 'package:vietjet_tool/widgets/button/button_widget.dart';

class FindRosterScreen extends StatefulWidget {
  const FindRosterScreen({super.key});

  @override
  MyState createState() => _FindRosterScreenState();
}

class _FindRosterScreenState extends MyState<FindRosterScreen> {
  @override
  MyController createController() {
    return FindRosterController(this);
  }






  @override
  Widget setBody() {



   return
     SingleChildScrollView(
       child: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             const SizedBox(height: 100,),
             MyButton(content: AppLocalizations.of(context).translate("Export Excel"),
                 width: MediaQuery.of(context).size.width*0.9,
               height: 60,
               style:
               ElevatedButton.styleFrom(
                 textStyle: Theme.of(context).textTheme.titleLarge
               ),



               onPressed: ()async{
               //FilePickerResult? fileResult= await MyStorage().readFilePicker();
                 FilePickerResult? fileResult= (controller as FindRosterController).filePickerResult;

               List<Map<String,String>> rosterData= await  ExcelController().getRosterForDate(filePicker: fileResult, date: DateTime.now(), shifts: ["M"]);
               List<int> fileByte= await ExcelController().generateRosterExcel(date: DateTime.now(), shifts: ["N,FLN"], rosterData: rosterData);
               await MyStorage().writeFile(fileByte, "roster.xlsx");
               },

             ),
           ],
         ),
       ),
     );
  }

  @override
  String setTitle() {
    return
      "FindRoster";

  }

}