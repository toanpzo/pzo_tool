import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vietjet_tool/common/localizations/appLocalizations.dart';
import 'package:vietjet_tool/common/template/my_state.dart';
import 'package:vietjet_tool/controllers/my_controller.dart';
import 'package:vietjet_tool/ui/mel_cat/mel_cat_controller.dart';
import 'package:vietjet_tool/widgets/button/button_widget.dart';
import 'package:vietjet_tool/widgets/text_field/text_filed.dart';

class MelCatScreen extends StatefulWidget {
  const MelCatScreen({super.key});

  @override
  MyState createState() => _MelCatScreenState();
}

class _MelCatScreenState extends MyState<MelCatScreen> {
  @override
  MyController createController() {
    // TODO: implement createController
    return MelCatController(this);
  }
   TextEditingController? _controller;
  String melDueDate="";


  void onChangeInput(){
    DateFormat dateFormat =DateFormat("dd/MM/yyyy");
    melDueDate= "DUE DAY: ${dateFormat.format(DateTime.now().add(Duration(days: int.tryParse(_controller!.value.text)??0)).toUtc())}";
  }


  @override
  Widget setBody() {
    _controller ??= TextEditingController();
    onChangeInput();


   return
     SingleChildScrollView(
       child: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             // Text(AppLocalizations.of(context).translate("MEL due date:"),
             //   textAlign: TextAlign.center,
             //   style: Theme.of(context).textTheme.headlineMedium,
             //
             // ),
             // MyTextFiled(hintText: AppLocalizations.of(context).translate("input day number"),
             //   keyboardType: TextInputType.number,
             //   controller: _controller,
             //   margin: const EdgeInsets.symmetric(horizontal: 20),
             //   textAlign: TextAlign.center,
             //   style: Theme.of(context).textTheme.headlineMedium,
             //   //maxLength: 5,
             //   onChanged: (value){
             //     //DateFormat dateFormat =DateFormat("dd/MM/yyyy");
             //     //melDueDate= "DUE DAY: ${dateFormat.format(DateTime.now().add(Duration(days: int.tryParse(value)??0)).toUtc())}";
             //      setState(() {
             //
             //      });
             //   },
             // ),
             // const SizedBox(
             //   height: 20,
             // ),
             //
             // Text(AppLocalizations.of(context).translate(melDueDate),
             //   textAlign: TextAlign.center,
             //   style: Theme.of(context).textTheme.displaySmall,
             //
             // ),
             SizedBox(height: 100,),
             MyButton(content: AppLocalizations.of(context).translate((controller as MelCatController).catB),
                 width: MediaQuery.of(context).size.width*0.9,
               height: 60,
               style:
               ElevatedButton.styleFrom(
                 textStyle: Theme.of(context).textTheme.titleLarge
               ),

               onPressed: (){},

             ),
             MyButton(content: AppLocalizations.of(context).translate((controller as MelCatController).catC),
               width: MediaQuery.of(context).size.width*0.9,
               height: 60,
               style:
               ElevatedButton.styleFrom(
                   textStyle: Theme.of(context).textTheme.titleLarge
               ),

               onPressed: (){},

             ),
             MyButton(content: AppLocalizations.of(context).translate((controller as MelCatController).catD),
               width: MediaQuery.of(context).size.width*0.9,
               height: 60,
               style:
               ElevatedButton.styleFrom(
                   textStyle: Theme.of(context).textTheme.titleLarge
               ),

               onPressed: (){},

             ),
             MyButton(content: AppLocalizations.of(context).translate((controller as MelCatController).cat180),
               width: MediaQuery.of(context).size.width*0.9,
               height: 60,
               style:
               ElevatedButton.styleFrom(
                   textStyle: Theme.of(context).textTheme.titleLarge
               ),

               onPressed: (){},

             ),



           ],
         ),
       ),
     );
  }

  @override
  String setTitle() {
    return
      "melCalc";

  }

}