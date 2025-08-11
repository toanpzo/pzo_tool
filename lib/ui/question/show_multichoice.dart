import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:vietjet_tool/common/local_storage/my_storage.dart';
import 'package:vietjet_tool/common/localizations/appLocalizations.dart';
import 'package:vietjet_tool/common/template/my_state.dart';
import 'package:vietjet_tool/controllers/my_controller.dart';
import 'package:vietjet_tool/models/questions/bank_question/bank_question.dart';
import 'package:vietjet_tool/models/questions/save_score/save_score.dart';
import 'package:vietjet_tool/ui/question/question.dart';
import 'package:vietjet_tool/ui/question/question_controller.dart';
import 'package:vietjet_tool/widgets/button/button_widget.dart';
import 'package:vietjet_tool/widgets/dialog/dialogs.dart';
import 'package:vietjet_tool/widgets/text_field/text_filed.dart';

import '../../models/questions/question/question.dart';
import '../../models/questions/wrong_question/wrong_question.dart';

enum TypePageChoice{load, review,test,processReview, processTest}

class ShowChoice extends StatefulWidget {

  final String title;
  late  List<Question> questions;
  final BankQuestion bankQuestion;
   ShowChoice({super.key, required this.title,required this.bankQuestion});

  @override
  State<ShowChoice> createState() => _ShowChoiceState();
}

class _ShowChoiceState extends MyState<ShowChoice> {
  TypePageChoice typePageChoice=TypePageChoice.load;
  late Question question;
  int? select;
  int index=0;
  bool saveQuestShow=false;
  List<Question> questionShow=List<Question>.empty(growable: true);
  List<Question> questionShowSave=List<Question>.empty(growable: true);
  bool endQuest=false;
  bool revise=false;
  SaveScore saveScore=SaveScore(totalCorrect: 0, totalWrong: 0, dem: 0);

  List<WrongQuestion> wrongQuestions=List<WrongQuestion>.empty(growable: true);

  ///hide review
  bool hideNumberReviewWrong=true;
  //int? totalNumberWrong;
  TextEditingController totalNumberWrongController=TextEditingController();
  /// test



  void onclickReview()async{
    typePageChoice=TypePageChoice.review;



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
        typePageChoice=TypePageChoice.processReview;
      }else{
        await MyStorage().deleteListQuestionShow(widget.bankQuestion.id);
        questionShow=widget.questions;
        questionShow.shuffle();
        //typePageChoice=TypePageChoice.processReview;

      }

    }else{
      //questionShow=widget.questions;
      //questionShow.shuffle();
    }
    setState(() {

    });



  }
  void onclickReviewAll()async{
    typePageChoice=TypePageChoice.processReview;



    //List<Question> questionShowSave= await (controller as QuestionController).getQuestionsShow(widget.bankQuestion.id);
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
        //typePageChoice=TypePageChoice.processReview;
      }else{
        await MyStorage().deleteListQuestionShow(widget.bankQuestion.id);
        questionShow=widget.questions;
        questionShow.shuffle();
        //typePageChoice=TypePageChoice.processReview;

      }

    }else{
      questionShow=widget.questions;
      questionShow.shuffle();
    }
    setState(() {

    });



  }
  void onclickTest(){
    questionShow=widget.questions;
    questionShow.shuffle();
    setState(() {
      typePageChoice=TypePageChoice.processTest;
    });
  }

  void setProcessReview(){
    typePageChoice=TypePageChoice.processReview;

  }
  void setProcessTest(){
    typePageChoice=TypePageChoice.processTest;

  }
  void setReview(){
    typePageChoice=TypePageChoice.review;

  }
  void  setTest(){
    typePageChoice=TypePageChoice.test;

  }


  @override
  bool get actionBack => true;
  
  void resetValue(){
    //questionShowSave.clear();
    if(endQuest){
      questionShowSave.clear();
    }
    index=0;
    saveScore=SaveScore(totalCorrect: 0,totalWrong: 0,dem: 0);
    endQuest=false;
  }
  @override
  Future<bool> backFunction() async{

    switch (typePageChoice){
      case TypePageChoice.processTest:
        setState(() {
          typePageChoice=TypePageChoice.test;
        });

        return false;
      case TypePageChoice.processReview:
        setState(() {
          resetValue();
          typePageChoice=TypePageChoice.review;
        });

        return false;
      case TypePageChoice.review:
        setState(() {
          typePageChoice=TypePageChoice.load;
        });
        return false;
      case TypePageChoice.test:
        setState(() {
          typePageChoice=TypePageChoice.load;
        });

        return false;
      default: Navigator.pop(context);return true;
    }

  }

  @override
  Future<void> afterLoadData()async {
    wrongQuestions=await MyStorage().getWrongQuestion(widget.bankQuestion.id)??wrongQuestions;



    questionShowSave= await (controller as QuestionController).getQuestionsShow(widget.bankQuestion.id);







  }
  @override
  Future<void> beforeLoadData() async{
    // TODO: implement beforeLoadData

    widget.questions=  await (controller as QuestionController).getQuestions(widget.bankQuestion.id);
    return super.beforeLoadData();
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
    if(index==questionShow.length-1){
      endQuest=true;
    }

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
        backFunction();
      }

    }else{
      await MyStorage().setSaveScore(saveScore, widget.bankQuestion.id);
    }



    

  }

  List<Widget> buildColumn(){
    // if(index==questionShow.length-1){
    //   endQuest=true;
    // }
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
    if(typePageChoice==TypePageChoice.processReview) {
      widgets.add(totalWidget);
    }

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
      content: !(index==questionShow.length-1)?"Next":"Finish",
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

  Widget buildBody(){
    switch (typePageChoice){
      default:
        return Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(AppLocalizations.of(context).translate("No Data")),
              MyButton(content: "Click to edit bank",typeButton: TypeButton.link,
                onPressed: ()async {
                  //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MyHome(),), (route) => false,)
                  await  Navigator.push(context, MaterialPageRoute(builder: (context) =>  QuestionScreen(
                      title: AppLocalizations.of(context).translate("Bank Question: ")+ widget.bankQuestion.name,
                      idParent: widget.bankQuestion.id,
                      edit: true, typePage: TypePage.isQuestion),));
                  await beforeLoadData();
                  await afterLoadData();
                  setState(() {

                  });
                },
              )
            ],
          )

      );
    }



    /// review
    if(questionShow.isEmpty){
      return Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(AppLocalizations.of(context).translate("No Data")),
              MyButton(content: "Click to edit bank",typeButton: TypeButton.link,
                onPressed: ()async {
                  //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MyHome(),), (route) => false,)
                  await  Navigator.push(context, MaterialPageRoute(builder: (context) =>  QuestionScreen(
                      title: AppLocalizations.of(context).translate("Bank Question: ")+ widget.bankQuestion.name,
                      idParent: widget.bankQuestion.id,
                      edit: true, typePage: TypePage.isQuestion),));
                  await beforeLoadData();
                  await afterLoadData();
                  setState(() {

                  });
                },
              )
            ],
          )

      );
    }else {
      return SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: buildColumn()
        ),
      );
    }
  }




  Widget buildReview(){

    List<Widget> widgets=List<Widget>.empty(growable: true);
    widgets.add(
        MyButton(content: "Review all",
          width: MediaQuery.of(context).size.width*0.8,
          onPressed: onclickReviewAll,
          //     ()
          //
          // {
          //   setState(() {
          //     typePageChoice= TypePageChoice.processReview;
          //   });
          //
          // },
        ));
    widgets.add(
        MyButton(content: "Review frequently incorrect questions",
          width: MediaQuery.of(context).size.width*0.8,
          onPressed: (){
            showDialog(context: context, builder: (context) => MyCustomDialog(title: title, content:

                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(AppLocalizations.of(context)
                        .translate("Number of frequently wrong questions")),
                    MyTextFiled(
                      keyboardType: TextInputType.number,
                      controller: totalNumberWrongController,
                      onChanged: (value) {
                        try {
                          int totalNumberWrong = int.tryParse(value) ?? -1;
                          questionShow= wrongQuestions.where((element) => element.numberMistakes>=totalNumberWrong,).map((e) => e.questWrong,).toList();
                        } catch (e) {

                        }
                      }


                    ),
                  ],
                )

            ,
              actions: [
                MyButton(content: "Ok",
                  onPressed: (){
                    Navigator.pop(context,true);
                    setState(() {
                      typePageChoice=TypePageChoice.processReview;
                    });

                  },
                ),
              ],
            ),);
            setState(() {
              typePageChoice= TypePageChoice.test;
            });

          },
        ));

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widgets.toList(),
      )
    );

  }

  Widget buildTest(){
    return Container();
  }

  Widget buildProcessReviewAndTest(){
    if(questionShow.isEmpty){
      return Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(AppLocalizations.of(context).translate("No Data")),
              MyButton(content: "Click to edit bank",typeButton: TypeButton.link,
                onPressed: ()async {
                  //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MyHome(),), (route) => false,)
                  await  Navigator.push(context, MaterialPageRoute(builder: (context) =>  QuestionScreen(
                      title: AppLocalizations.of(context).translate("Bank Question: ")+ widget.bankQuestion.name,
                      idParent: widget.bankQuestion.id,
                      edit: true, typePage: TypePage.isQuestion),));
                  await beforeLoadData();
                  await afterLoadData();
                  setState(() {

                  });
                },
              )
            ],
          )

      );
    }else {
      return SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: buildColumn()
        ),
      );
    }
  }

  // Widget buildProcessTest(){
  //   if(questionShow.isEmpty){
  //     return Center(
  //         child:Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [Text(AppLocalizations.of(context).translate("No Data")),
  //             MyButton(content: "Click to edit bank",typeButton: TypeButton.link,
  //               onPressed: ()async {
  //                 //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MyHome(),), (route) => false,)
  //                 await  Navigator.push(context, MaterialPageRoute(builder: (context) =>  QuestionScreen(
  //                     title: AppLocalizations.of(context).translate("Bank Question: ")+ widget.bankQuestion.name,
  //                     idParent: widget.bankQuestion.id,
  //                     edit: true, typePage: TypePage.isQuestion),));
  //                 await beforeLoadData();
  //                 await afterLoadData();
  //                 setState(() {
  //
  //                 });
  //               },
  //             )
  //           ],
  //         )
  //
  //     );
  //   }else {
  //     return SingleChildScrollView(
  //       child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           //mainAxisAlignment: MainAxisAlignment.start,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: buildColumn()
  //       ),
  //     );
  //   }
  // }



  @override
  Widget setBody() {

    List<Widget> buttons=List<Widget>.empty(growable: true);
    buttons.add(
        MyButton(content: "Review",
    width: MediaQuery.of(context).size.width*0.8,
    onPressed:

        ()

    {
      onclickReview();

    },
    ));
    buttons.add(
        MyButton(content: "Test",
          width: MediaQuery.of(context).size.width*0.8,
          onPressed: (){
            setState(() {
              typePageChoice= TypePageChoice.processTest;
            });

          },
        ));

    switch (typePageChoice){
      case TypePageChoice.review:
        return buildReview();

      case TypePageChoice.test:
        return buildTest();
      case TypePageChoice.processReview:
        return buildProcessReviewAndTest();
      case TypePageChoice.processTest:
        return buildProcessReviewAndTest();
      default:
        return Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: buttons.toList(),
            )

        );
    }













  }

  @override
  String setTitle() {
    return widget.title;
  }
}

