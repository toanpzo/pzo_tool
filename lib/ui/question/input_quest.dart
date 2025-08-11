

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vietjet_tool/common/localizations/appLocalizations.dart';
import 'package:vietjet_tool/common/template/my_state.dart';
import 'package:vietjet_tool/controllers/my_controller.dart';
import 'package:vietjet_tool/models/questions/anwser/answer.dart';
import 'package:vietjet_tool/ui/question/question.dart';
import 'package:vietjet_tool/ui/question/question_controller.dart';
import 'package:vietjet_tool/widgets/button/button_widget.dart';
import 'package:vietjet_tool/widgets/dialog/dialogs.dart';
import 'package:vietjet_tool/widgets/text_field/text_filed.dart';

import '../../models/questions/question/question.dart';
enum MyCheckbox {numberQuestion1,numberQuestion2,numberQuestion3,numberQuestion4,numberQuestion5}

enum ActionQuest{view,add,edit,delete}

enum SelectTypeTextOrImage{text,image}



class InputQuestionScreen extends StatefulWidget {
  final ActionQuest? actionQuest;
  final Question? question;
  final int? index;
  final String idBankQuest;
  final List<Question>? quests;
  const InputQuestionScreen({super.key, required this.idBankQuest, this.quests, this.actionQuest, this.question, this.index});

  @override
  MyState createState() => _InputQuestionScreenState();
}

class _InputQuestionScreenState extends MyState<InputQuestionScreen> {
  @override
  MyController createController() {
    return QuestionController(this);
  }

  List<Question>? questions;
  int numberAnswer=4;
  List<Answer> answers=List<Answer>.empty(growable: true);
  int isCorrect=0;
  Question question = Question(idBankQuestion: "idBankQuestion",
      numberQuestion: 1,
      id: "id",
      question: "question",
      answers: []
  );
  int? index;
  ActionQuest? actionQuest;
//select text or image
  String typeQuestImage="image";
  SelectTypeTextOrImage selectTypeTextOrImage=SelectTypeTextOrImage.text;
  Uint8List? _imageFile;
  bool  vip=false;




  @override
  Future<void> beforeLoadData() async {

    if(widget.quests!=null &&widget.quests!.isEmpty){
      questions=widget.quests;
    }else {
      QuestionController questionController = controller as QuestionController;
      questionController.type = TypePage.isQuestion;
      questionController.idParentPage = widget.idBankQuest;

    }

  }
  @override
  Future<void> afterLoadData() async{
    vip=await controller.getVip();
    QuestionController questionController = controller as QuestionController;
    questions=questionController.questions??List<Question>.empty(growable: true);
    index=widget.index;
    actionQuest=widget.actionQuest;


    question=widget.question??  Question(idBankQuestion: widget.idBankQuest,
        numberQuestion: numberAnswer,
        id: DateTime.now().toString(),
        question: "",
    answers: []
    );
    if(actionQuest==ActionQuest.edit){
      for ( int i=0;i<question.numberQuestion;i++) {
        if(question.answerCorrect==question.answers[i]){
          //selectChk=MyCheckbox.values[i];
          isCorrect=i;
        }
        answers.add(question.answers[i]);
      }




      numberAnswer= question.numberQuestion;
      selectChk=MyCheckbox.values[numberAnswer-1];
    }

  }
  @override
  bool get actionBack => true;
  @override
  Future<bool> backFunction() async{
    Navigator.pop(context,questions);

    return true;
  }

  //
  // String getValueAnswer(int i){
  //   String value="";
  //   switch(i){
  //     case 1:value=question.answer1Text??"";
  //     break;
  //     case 2:value=question.answer2Text??"";
  //     break;
  //     case 3:value=question.answer3Text??"";
  //     break;
  //     case 4:value=question.answer4Text??"";
  //     break;
  //     case 5:value=question.answer5Text??"";
  //     break;
  //
  //     default: value=question.answer5Text??"";
  //     break;
  //   }
  //   return value;
  // }
  //
  // Question onChangeQuestion(int answer,String value){
  //
  //   switch(answer){
  //     case 1:question=question.copyWith(answer1Text: value);
  //
  //       break;
  //     case 2:question=question.copyWith(answer2Text: value);
  //     break;
  //     case 3:question=question.copyWith(answer3Text: value);
  //     break;
  //     case 4:question=question.copyWith(answer4Text: value);
  //     break;
  //     case 5:question=question.copyWith(answer5Text: value);
  //     break;
  //
  //     default: question=question.copyWith(answer5Text: value);
  //       break;
  //   }
  //
  //   return question;
  //
  // }
  //
  Future<void> saveQuestion() async{





    QuestionController questionController = controller as QuestionController;
    if(actionQuest==ActionQuest.edit){
      Question questionSave=question.copyWith(answers: answers,answerCorrect: answers[isCorrect],
          numberQuestion: numberAnswer
      );
      questions![index??0]=questionSave;
      await questionController.deleteQuestionFromWrongQuest(idBank: widget.idBankQuest,idQuestion: questionSave.id);
      await questionController.saveQuestion(questions!, widget.idBankQuest);
      return;
    }
    List<Answer> answersSave= answers.toList();
    Question questionSave=question.copyWith(answers: answersSave,answerCorrect: answers[isCorrect],
    numberQuestion: numberAnswer
    );

    questions!.add(questionSave);
    await questionController.saveQuestion(questions!, widget.idBankQuest);


    answers.clear();
    question=Question(idBankQuestion: widget.idBankQuest,
        numberQuestion: numberAnswer,
        id: DateTime.now().toString(),
        question: "", answers: []);
    setState(() {

    });
  }


  MyCheckbox selectChk=MyCheckbox.numberQuestion4;
  List<Widget> buildWidget(){
    

    List<Widget> widgets=List<Widget>.empty(growable: true);
    // add select text image

    if(vip) {
      widgets.add(RadioListTile(title:
      Text(AppLocalizations.of(context).translate("Only Text")),
          value: SelectTypeTextOrImage.text,
          groupValue: selectTypeTextOrImage,
          onChanged: (value) =>
              setState(() {
                selectTypeTextOrImage = value ?? SelectTypeTextOrImage.text;
              })),);
      widgets.add(RadioListTile(title:
      Text(AppLocalizations.of(context).translate("Text and Image")),
          value: SelectTypeTextOrImage.image,
          groupValue: selectTypeTextOrImage,
          onChanged: (value) =>
              setState(() {
                selectTypeTextOrImage = value ?? SelectTypeTextOrImage.text;
              })),);
    }
    // add check box

    MyCheckbox.values[0];
    
    List<Widget> checkBoxQuestion = List<Widget>.empty(growable: true);
    
    for(int i=0;i< MyCheckbox.values.length;i++){

      Checkbox chk=Checkbox(value: selectChk== MyCheckbox.values[i]?true:false,
        onChanged: (value) {

              selectChk = value==true?MyCheckbox.values[i]:MyCheckbox.numberQuestion4;
              setState(() {
                numberAnswer=value==true?numberAnswer=i+1:4;

              });

          },);



      checkBoxQuestion.add(chk);
      checkBoxQuestion.add(Text("${i+1}"));
    }
    widgets.add(
      Text(AppLocalizations.of(context).translate("Total answer?"),
          style: Theme.of(context).textTheme.titleLarge
      ),);

    
    widgets.add(
      ListTile(
        title: Row(
          children:  checkBoxQuestion
        ),
      )


    );


    //add question
    String questStr="Questions${(index??questions!.length)+1}?";
    widgets.add(
      Text(AppLocalizations.of(context).translate(questStr),
        style: Theme.of(context).textTheme.titleLarge
    ),);
    widgets.add(MyTextFiled( width: MediaQuery.of(context).size.width*0.9,
      text: question.question,
      minLines: 1,
      maxLines: 5,
      onChanged: (value) => question=question.copyWith(question: value),
    ));

    var orientation=  MediaQuery.of(context).orientation;



    Uint8List? imageQuestion=question.questionImage!=null? controller.base64ToImageBytes(question.questionImage!):null;

    Widget imagePicker= Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageQuestion != null
                ? Image.memory(
              imageQuestion,
              width: orientation== Orientation.landscape?MediaQuery.of(context).size.width*0.8:null,//  200,
              height: orientation== Orientation.portrait?MediaQuery.of(context).size.height*0.2:null,
              fit: BoxFit.cover,
            )
                : Text(controller.ConvertMutiLaguage('Not image select', context)),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: ()async{
                XFile? xFile= await controller.pickImage();
                if(xFile!=null){
                  String imageQuestion=await controller.imageToBase64(File(xFile.path));
                  question= question.copyWith(questionImage:imageQuestion);
                }

                setState(() {


                });
              },


              child: Text(controller.ConvertMutiLaguage('Select image', context)),
            ),
          ],
        ),
      );
    widgets.add(imagePicker);

//add answer

    for(int i=0;i<numberAnswer;i++){
      widgets.add(
        ListTile(
          title: Row(
            children: [
              Text(AppLocalizations.of(context).translate("Answer ${i+1}!"),
                  style: Theme.of(context).textTheme.titleLarge
              ),

              Checkbox(
                activeColor: Colors.red,
                value: isCorrect==i, onChanged:
              (value) {
                isCorrect=value==true?i:0;
                setState(() {

                });
              },
              ),
              Text(AppLocalizations.of(context).translate("isCorrect"),style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.red,))
            ],
          ),
        )



      );






      Answer answer=Answer(text: "");
      //Map map= {"answerText$i":"","answersImage$i":""};
      if(i>answers.length-1){
        answers.add(answer);
      }else{
        answer=answers[i];
      }




      widgets.add(MyTextFiled( width: MediaQuery.of(context).size.width*0.9,
        text: answers[i].text,//  ["answerText$i"],
        minLines: 1,
        maxLines: 5,
        onChanged:
            (value)
        {
          answers[i]=answers[i].copyWith(text: value);
          //map["answerText$i"] = value;
        }
      ));

      Uint8List? imageAnswer=answers[i].image!=null? controller.base64ToImageBytes(answers[i].image!):null;

      Widget imagePicker= Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageAnswer != null
                ? Image.memory(
              imageAnswer,
              width: orientation== Orientation.landscape?MediaQuery.of(context).size.width*0.8:null,//  200,
              height: orientation== Orientation.portrait?MediaQuery.of(context).size.height*0.2:null,
              fit: BoxFit.cover,
            )
                : Text(controller.ConvertMutiLaguage('Not image select', context)),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: ()async{
                XFile? xFile= await controller.pickImage();
                if(xFile!=null){
                  String imageStr=await controller.imageToBase64(File(xFile.path));
                  answers[i]=answers[i].copyWith(image: imageStr);

                }

                setState(() {


                });
              },


              child: Text(controller.ConvertMutiLaguage('Select image', context)),
            ),
          ],
        ),
      );
      widgets.add(imagePicker);
    }
    //add button
    MyButton continueButton= MyButton(content: "Continue",onPressed: () {
      if(questions!.isNotEmpty){
        List<Question> searchResult= questions!.where((element) => element.question==question.question).toList() ;
        if(searchResult.isNotEmpty){
          showDialog(context: context, builder: (context) => MyConfirmDialog(
            message: "The question '${question.question}' already exists. Do you want to continue further?",
            onContinue: () async{
              saveQuestion();
            },
          )

          );
        }else{

           saveQuestion();

        }
      }else{
         saveQuestion();

      }


    },);
    MyButton doneButton= MyButton(
      margin: const EdgeInsets.only(left: 10),
      content:  actionQuest==ActionQuest.edit?"Save":"Done",onPressed: ()async{
        try {
          await saveQuestion();
          Navigator.pop(context, questions);
        }catch(e){
          print("error $e");
        }
    },);
    widgets.add(Row(
      children: [
        actionQuest==ActionQuest.edit?const SizedBox(): continueButton,
        doneButton
      ],
    ));
    return widgets;
  }


  @override
  Widget setBody() {








   return
     SingleChildScrollView(
     child:
         Center(
           child:
               Container(
                 margin:const EdgeInsets.only(left: 15),

                 child: Column(
                   //mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.start,

                     children: buildWidget()

                 ),
               )



         )


   );
  }

  @override
  String setTitle() {
    return "Input Question";
  }

}