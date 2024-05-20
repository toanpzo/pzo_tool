import 'package:flutter/material.dart';
import 'package:vietjet_tool/common/local_storage/my_storage.dart';
import 'package:vietjet_tool/common/localizations/appLocalizations.dart';
import 'package:vietjet_tool/common/template/my_state.dart';
import 'package:vietjet_tool/controllers/my_controller.dart';
import 'package:vietjet_tool/models/questions/bank_question/bank_question.dart';
import 'package:vietjet_tool/models/questions/save_score/save_score.dart';
import 'package:vietjet_tool/ui/question/question_controller.dart';
import 'package:vietjet_tool/widgets/button/button_widget.dart';
import 'package:vietjet_tool/widgets/dialog/dialogs.dart';

import '../../models/questions/question/question.dart';
import '../../models/questions/wrong_question/wrong_question.dart';

class ShowChoice extends StatefulWidget {
  final String title;
  final List<Question> questions;
  final BankQuestion bankQuestion;
  const ShowChoice({super.key, required this.title, required this.questions, required this.bankQuestion});

  @override
  State<ShowChoice> createState() => _ShowChoiceState();
}

class _ShowChoiceState extends MyState<ShowChoice> {
  late Question question;
  int? select;
  int index=0;
  bool saveQuestShow=false;
  List<Question> questionShow=List<Question>.empty(growable: true);
  bool endQuest=false;
  bool revise=false;
  SaveScore saveScore=SaveScore(totalCorrect: 0, totalWrong: 0, dem: 0);

  List<WrongQuestion> wrongQuestions=List<WrongQuestion>.empty(growable: true);

  @override
  Future<void> afterLoadData()async {
    wrongQuestions=await MyStorage().getWrongQuestion(widget.bankQuestion.id)??wrongQuestions;



    List<Question> questionShowSave= await (controller as QuestionController).getQuestionsShow(widget.bankQuestion.id);
  if(questionShowSave.isNotEmpty){
    bool result= await showDialog(context: context, builder: (context) => MyCustomDialog(title: title, content: Text(AppLocalizations.of(context)
        .translate("Do you want continute")),
      actions: [
        MyButton(content: "Yes",
        onPressed: (){
          Navigator.pop(context,true);

        },
        ),
        MyButton(content: "No",
          onPressed: (){
            Navigator.pop(context,false);

          },
        )
      ],
    ),);

    if(result){
      saveScore= await MyStorage().getSaveScore(widget.bankQuestion.id)??saveScore;
      questionShow=questionShowSave;
      index=saveScore.dem;
    }else{
      await MyStorage().deleteListQuestionShow(widget.bankQuestion.id);
      questionShow=widget.questions;
      questionShow.shuffle();
    }

  }else{
    questionShow=widget.questions;
    questionShow.shuffle();
  }







  }


  @override
  MyController createController() {
    return QuestionController(this);
  }


  void addWrongQuest(Question question){
    for(int i=0;i<wrongQuestions.length;i++){
      if(wrongQuestions[i].questWrong==question){
        wrongQuestions[i]=wrongQuestions[i].copyWith(numberMistakes: wrongQuestions[i].numberMistakes+1);
        return;
      }
    }
    wrongQuestions.add(WrongQuestion(questWrong: question, numberMistakes: 1));
  }

  void actionClickButton(int index,  int choice)  async{

    if(!saveQuestShow){
      await
      MyStorage().setListQuestionShow(questionShow, widget.bankQuestion.id);
      saveQuestShow=true;

    }




    saveScore=saveScore.copyWith(dem: index+1);

    if(question.answerCorrect!=question.answers[choice]){
      saveScore=saveScore.copyWith(totalWrong: saveScore.totalWrong+1);
      addWrongQuest(question);
      await MyStorage().setWrongQuestion(wrongQuestions, widget.bankQuestion.id);
      var result= await showDialog(context: context, builder: (context) => MyAlertDialog(title: '', message: "Answer correct is:\n${question.answerCorrect!.text}"),);



     // MyController.showErrorDialogEvery("Answer correct is:\n${question.answerCorrect!.text}");
    }else{
      saveScore=saveScore.copyWith(totalCorrect: saveScore.totalCorrect+1);
    }

    if(endQuest){
      await MyStorage().deleteListQuestionShow(widget.bankQuestion.id);
      String result=AppLocalizations.of(context).translate("Result");
      String correct=AppLocalizations.of(context).translate("Correct");
      String wrong=AppLocalizations.of(context).translate("Wrong");
      var a= await showDialog(context: context, builder: (context) => MyAlertDialog(title: "Success", message: "$result $correct: ${saveScore.totalCorrect} $wrong: ${saveScore.totalWrong}"),);
      if(a==null){
        Navigator.pop(context);
      }

    }else{
      await MyStorage().setSaveScore(saveScore, widget.bankQuestion.id);
    }



    

  }

  List<Widget> buildColumn(){
    if(index==questionShow.length-1){
      endQuest=true;
    }
    question=questionShow[index];
    List<Widget> widgets=List<Widget> .empty(growable: true);
    //add total score

    String total=AppLocalizations.of(context).translate("Total");
    String correct=AppLocalizations.of(context).translate("Correct");
    String wrong=AppLocalizations.of(context).translate("Wrong");


    Widget totalWidget= Container(
      margin: const EdgeInsets.only(left: 10),
      child: Text("$total: ${saveScore.dem}/${questionShow.length} $correct: ${saveScore.totalCorrect} $wrong: ${saveScore.totalWrong}",style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red)),
    );
    widgets.add(totalWidget);

    //add quest
    Widget questionStr= Container(
      margin: const EdgeInsets.only(left: 10),
      child: Text(question.question,style: Theme.of(context).textTheme.titleLarge),
    );
    widgets.add(questionStr);


    for(int i=0;i<question.numberQuestion;i++){
      Widget answer= RadioListTile(
        title: Text(question.answers[i].text),
        value: i, groupValue: select, onChanged: (value){
        select=value;
        setState(() {


        });
      },);
      widgets.add(answer);
    }
    MyButton btnNext= MyButton(
      content: !endQuest?"Next":"Finish",
      padding: const EdgeInsets.only(left: 10,top: 30),
      onPressed: (){
        if(select==null){
          MyController.showErrorDialogEvery(AppLocalizations.of(context).translate("Please select answer!"));
          
        }else{
          actionClickButton(index,select!);
          if(endQuest){


          }else{


            setState(() {
              index++;
              select=null;

            });
          }
          
        }
        
        


      },

    );

    widgets.add(
        btnNext);


    return widgets;
  }

  @override
  Widget setBody() {

    return SingleChildScrollView(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:buildColumn()
      ),
    );



  }

  @override
  String setTitle() {
    return widget.title;
  }
}

