import 'package:flutter/material.dart';
import 'package:vietjet_tool/common/template/my_state.dart';
import 'package:vietjet_tool/controllers/my_controller.dart';
import 'package:vietjet_tool/ui/question/question_controller.dart';
import 'package:vietjet_tool/widgets/button/button_widget.dart';

import '../../models/questions/question/question.dart';

class ShowChoice extends StatefulWidget {
  final String title;
  final List<Question> questions;
  const ShowChoice({super.key, required this.title, required this.questions});

  @override
  State<ShowChoice> createState() => _ShowChoiceState();
}

class _ShowChoiceState extends MyState<ShowChoice> {
  late Question question;
  int? select;
  int index=0;
  List<Question> questionShow=List<Question>.empty(growable: true);

  @override
  Future<void> afterLoadData()async {
    question=widget.questions[index];
  }


  @override
  MyController createController() {
    return QuestionController(this);
  }

  List<Widget> buildColumn(){
    List<Widget> widgets=List<Widget> .empty(growable: true);
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
      content: "Next",
      padding: const EdgeInsets.only(left: 10),
      onPressed: (){

      },

    );
    widgets.add(
        btnNext);

    return widgets;
  }

  @override
  Widget setBody() {


    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:buildColumn()
      );
  }

  @override
  String setTitle() {
    return widget.title;
  }
}

