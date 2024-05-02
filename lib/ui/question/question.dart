import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vietjet_tool/common/localizations/appLocalizations.dart';
import 'package:vietjet_tool/common/template/my_state.dart';
import 'package:vietjet_tool/controllers/my_controller.dart';
import 'package:vietjet_tool/models/questions/type_question/type_question.dart';
import 'package:vietjet_tool/ui/question/input_quest.dart';
import 'package:vietjet_tool/ui/question/question_controller.dart';
import 'package:vietjet_tool/widgets/button/button_widget.dart';
import 'package:vietjet_tool/widgets/dialog/dialogs.dart';
import 'package:vietjet_tool/widgets/text_field/text_filed.dart';
import '../../models/questions/bank_question/bank_question.dart';
import '../../models/questions/question/question.dart';
import '../../widgets/MyListtitle/list_title.dart';

enum TypePage{ isTypeQuestions,isBankQuestion,isQuestion}

enum Modified{edit,add,delete,update}

class QuestionScreen extends StatefulWidget {

  final bool? edit;
  final TypePage typePage;
  final String? idParent;
  final String? title;
   const QuestionScreen({super.key, this.edit, required this.typePage, this.idParent, this.title,
  });

  @override
  MyState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends MyState<QuestionScreen> {
  TypePage pageType= TypePage.isTypeQuestions;
  bool isEdit=false;
  List<Widget> listTitles=List<Widget>.empty(growable: true);

  List<TypeQuestion>? typeQuestions;
  List<BankQuestion>? bankQuestions;
  List<Question>? questions;
  String idParentPage="";






  String idTypeEdit="";
  String idBankEdit="";
  String idQuestEdit="";

  @override
  Future<void> beforeLoadData() async{
    isEdit=widget.edit??false;

    QuestionController questionController =controller as QuestionController;
    questionController.type=pageType=widget.typePage;
    questionController.idParentPage=idParentPage=widget.idParent??"";


  }


  @override
  Future<void> afterLoadData() async{
    QuestionController questionController =controller as QuestionController;

    typeQuestions= questionController.typeQuestions;
    bankQuestions=questionController.bankQuestions;
    questions=questionController.questions;

  }


  @override
  // TODO: implement floatButton
  Widget? get floatButton => FloatingActionButton(onPressed: ()async {
    switch (pageType){
      case TypePage.isTypeQuestions: onShowDialogTypeQuest(Modified.add); break;
      case TypePage.isBankQuestion: onShowDialogBankQuest(Modified.add); break;
      case TypePage.isQuestion:
        //onShowDialogQuest(Modified.add);
        questions= await Navigator.push(context, MaterialPageRoute(builder: (context) => InputQuestionScreen(idBankQuest: idParentPage),));
        setState(() {

        });
        break;

    }

    // typeQuestions ??= List<TypeQuestion>.empty(growable: true);
    //
    //
    // typeQuestions!.add(TypeQuestion(id: DateTime.now().toString(),name: "halo"));
    //
    // await (controller as QuestionController).saveTypeQuestion(typeQuestions!);


  },child: const Icon(Icons.add),);

  void onShowDialogTypeQuest(Modified value,{int? select}){
    String textEdit= select!=null?typeQuestions![select] .name:"";
    TextEditingController nameTypeQuestions= TextEditingController( text:textEdit);
    showDialog(context: context, builder: (context) {

      switch (value){
        case Modified.edit: return MyCustomDialog(
          title: "Please input type questions!",
          content:
          MyTextFiled(
            controller: nameTypeQuestions,),
          firstButton: "OK",
          onFirstButton: ()async{
            //typeQuestions ??= List<TypeQuestion>.empty(growable: true);


            //typeQuestions!.add(TypeQuestion(id: DateTime.now().toString(),name: nameTypeQuestions.value.text));
            if(typeQuestions!=null && select!=null) {
              typeQuestions![select] = typeQuestions![select].copyWith(
                  name: nameTypeQuestions.value.text);
              await (controller as QuestionController).saveTypeQuestion(
                  typeQuestions!);
            }

          },

        );
        case Modified.delete: return MyCustomDialog(
          title: AppLocalizations.of(context).translate("Are you sure?"),
          content:
          Text(AppLocalizations.of(context).translate("If you agree, all related data will be deleted")),
          firstButton: "OK",
          onFirstButton: ()async{
           await (controller as QuestionController).deleteTypeQuestion(typeQuestions![select!].id);
          },

        );
        default: return MyCustomDialog(
          title: AppLocalizations.of(context).translate("Please input type questions!"),
          content:
          MyTextFiled(controller: nameTypeQuestions,),
          firstButton: "OK",
          onFirstButton: ()async{
            typeQuestions ??= List<TypeQuestion>.empty(growable: true);


            typeQuestions!.add(TypeQuestion(id: DateTime.now().toString(),name: nameTypeQuestions.value.text));

            await (controller as QuestionController).saveTypeQuestion(typeQuestions!);

          },

        );
          // TODO: Handle this case.
      }


  });
  }
  void onShowDialogBankQuest(Modified value,{int? select}){
    String textEdit= select!=null?bankQuestions![select] .name:"";
    TextEditingController nameBankQuestions= TextEditingController( text:textEdit);
    showDialog(context: context, builder: (context) {

      switch (value){
        case Modified.edit: return MyCustomDialog(
          title: "Please input bank name questions!",
          content:
          MyTextFiled(
            controller: nameBankQuestions,),
          firstButton: "OK",
          onFirstButton: ()async{
            if(bankQuestions!=null && select!=null) {
              bankQuestions![select] = bankQuestions![select].copyWith(
                  name: nameBankQuestions.value.text);
              await (controller as QuestionController).saveBankQuestion(
                  bankQuestions!,idParentPage);
            }

          },

        );
        case Modified.delete: return MyCustomDialog(
          title: AppLocalizations.of(context).translate("Are you sure?"),
          content:
          Text(AppLocalizations.of(context).translate("If you agree, all related data will be deleted")),
          firstButton: "OK",
          onFirstButton: ()async{
            await (controller as QuestionController).deleteBankQuestion(bankQuestions![select!].id);
          },

        );
        default: return MyCustomDialog(
          title: AppLocalizations.of(context).translate("Please input name bank questions!"),
          content:
          MyTextFiled(controller: nameBankQuestions,),
          firstButton: "OK",
          onFirstButton: ()async{
            bankQuestions ??= List<BankQuestion>.empty(growable: true);


            bankQuestions!.add(BankQuestion(id: DateTime.now().toString(),name: nameBankQuestions.value.text,idTypeQuestion: idParentPage));

            await (controller as QuestionController).saveBankQuestion(bankQuestions!,idParentPage);

          },

        );
      // TODO: Handle this case.
      }


    });
  }
  void onShowDialogQuest(Modified value,{int? select}){
    List<Widget> widgets= List<Widget>.empty(growable: true);

    List<Widget> contents(){

      return widgets;

    }

    void showInputBottomSheet(){

      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => Container(
          height: MediaQuery.of(context).size.height * 0.90,
          width: MediaQuery.of(context).size.height * 0.99,
          decoration: new BoxDecoration(
            color: Theme.of(context).colorScheme.background,//Colors.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(25.0),
              topRight: const Radius.circular(25.0),
            ),
          ),
          child: Center(
            child: GridView.count(crossAxisCount: 3),
          ),
        ),
      );

    }



    String textEdit= select!=null?typeQuestions![select] .name:"";
    TextEditingController nameTypeQuestions= TextEditingController( text:textEdit);
    showDialog(context: context, builder: (context) {

      switch (value){
        case Modified.edit: return MyCustomDialog(
          title: "",
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [MyTextFiled(
              controller: nameTypeQuestions,),
              MyTextFiled(
                controller: nameTypeQuestions,),],
          ),

          firstButton: "OK",
          onFirstButton: ()async{
            //typeQuestions ??= List<TypeQuestion>.empty(growable: true);


            //typeQuestions!.add(TypeQuestion(id: DateTime.now().toString(),name: nameTypeQuestions.value.text));
            if(typeQuestions!=null && select!=null) {
              typeQuestions![select] = typeQuestions![select].copyWith(
                  name: nameTypeQuestions.value.text);
              await (controller as QuestionController).saveTypeQuestion(
                  typeQuestions!);
            }

          },

        );
        case Modified.delete: return MyCustomDialog(
          title: AppLocalizations.of(context).translate("Are you sure?"),
          content:
          Text(AppLocalizations.of(context).translate("If you agree, all related data will be deleted")),
          firstButton: "OK",
          onFirstButton: ()async{
            await (controller as QuestionController).deleteTypeQuestion(typeQuestions![select!].id);
            typeQuestions= await (controller as QuestionController).getTypeQuestions();
            setState(() {

            });
          },

        );
        default: return MyCustomDialog(
          title: "",
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: widgets.isNotEmpty?widgets:

              [
                MyButton(content: AppLocalizations.of(context).translate("Input"),
                  onPressed: (){
                    //showInputBottomSheet();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => InputQuestionScreen(idBankQuest: idParentPage),));
                  },

                ),
                MyButton(content: AppLocalizations.of(context).translate("Select from Excel")),
                MyButton(content: AppLocalizations.of(context).translate("Select from pzoBank")),
              ],
            ),
          ),


          firstButton: "OK",
          onFirstButton: ()async{
            typeQuestions ??= List<TypeQuestion>.empty(growable: true);


            typeQuestions!.add(TypeQuestion(id: DateTime.now().toString(),name: nameTypeQuestions.value.text));

            await (controller as QuestionController).saveTypeQuestion(typeQuestions!);

          },

        );
      // TODO: Handle this case.
      }


    });
  }








  @override
  MyController createController() {
    return QuestionController(this);
  }

  @override
  Widget setBody() {

    switch (pageType){

      case TypePage.isTypeQuestions:
        if(typeQuestions!=null) {
          return ListView.builder(

            itemCount: typeQuestions!.length,
            itemBuilder: (context, index) =>MyListTitle(title: typeQuestions![index].name,
                onTap: ()async{

              Navigator.push(context,MaterialPageRoute(builder: (context) => QuestionScreen(typePage: TypePage.isBankQuestion,edit: isEdit,idParent: typeQuestions![index].id,title: "Bank Questions"),));
              },
                trailing:isEdit?
                Row(
                  mainAxisSize: MainAxisSize.min,
    children:<Widget>
    [
      IconButton(onPressed: (){
        onShowDialogTypeQuest(Modified.edit,select: index);
      }, icon: const Icon(Icons.edit,color: Colors.blue,)),
      IconButton(onPressed: (){
        onShowDialogTypeQuest(Modified.delete,select: index);
      }, icon: const Icon(Icons.delete,color: Colors.red,)),
    ]

    ):null,



                context: context),);
        }
        else {
          return Container();
        }

      case TypePage.isBankQuestion:
        if(bankQuestions!=null) {
          return ListView.builder(

            itemCount: bankQuestions!.length,
            itemBuilder: (context, index) =>MyListTitle(title: bankQuestions![index].name,
                onTap: ()async{

                  Navigator.push(context,MaterialPageRoute(builder: (context) => QuestionScreen(typePage: TypePage.isQuestion,edit: isEdit,idParent: bankQuestions![index].id,title: "Questions"),));
                },
                trailing:isEdit?
                Row(
                    mainAxisSize: MainAxisSize.min,
                    children:<Widget>
                    [
                      IconButton(onPressed: (){
                        onShowDialogBankQuest(Modified.edit,select: index);
                      }, icon: const Icon(Icons.edit,color: Colors.blue,)),
                      IconButton(onPressed: (){
                        onShowDialogBankQuest(Modified.delete,select: index);
                      }, icon: const Icon(Icons.delete,color: Colors.red,)),
                    ]

                ):null,



                context: context),);
        }
        else {
          return Container();
        }
      case TypePage.isQuestion:

        if(questions!=null) {
          return ListView.builder(

            itemCount: questions!.length,
            itemBuilder: (context, index) {
              List<Widget> answers= List<Widget>.empty(growable: true);
              answers.add(Text(AppLocalizations.of(context).translate("Question:")+questions![index].question),);
              for(int i=0;i<questions![index].answers.length;i++){
               Map map=questions![index].answers[i];
                String textAnswer="";
                map.forEach((key, value) { 
                  if(key.toString().contains("answerText")){
                    textAnswer=value;
                  }
                });
                if(
                DeepCollectionEquality().equals(questions![index].answerCorrect, questions![index].answers[i]))
               {
                  answers.add(Text(textAnswer,style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),));
                }else{
                  answers.add(Text(textAnswer));
                }

              }
              if(isEdit){
                return
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.7,
                      margin: EdgeInsets.all(5),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: answers,
                      ),
                    ),
                    Expanded(child: SizedBox()),

                    IconButton(onPressed: (){
                      onShowDialogBankQuest(Modified.edit,select: index);
                    }, icon: const Icon(Icons.edit,color: Colors.blue,)),
                    IconButton(onPressed: (){
                      onShowDialogBankQuest(Modified.delete,select: index);
                    }, icon: const Icon(Icons.delete,color: Colors.red,)),
                  ],

                );

              }else{
                return Container();
              }
            },
          );
        }
        else {
          return Container();
        }
    }


  }





  @override
  String setTitle() {
    return widget.title??"Type Question";
  }

}


class InputBottomSheet extends StatefulWidget {
  const InputBottomSheet({super.key});

  @override
  State<InputBottomSheet> createState() => _InputBottomSheetState();
}

class _InputBottomSheetState extends State<InputBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}



