import 'package:flutter/material.dart';
import 'package:vietjet_tool/common/template/my_state.dart';
import 'package:vietjet_tool/main.dart';
import 'package:vietjet_tool/widgets/dialog/dialogs.dart';

class MyController{
  
  MyState myState;


  MyController(this.myState);

  Future<void> loadData()async{

  }


  
  void update(){
    myState.setState(() {
      
    });
  }
  
  void setViewState(MyViewState myViewState ){
    myState.myViewState=myViewState;
    myState.setState(() {

    });
  }


  void showErrorDialog(String error){
    BuildContext? context =navigatorKey.currentContext;
    if(context!=null) {
      showDialog(context: navigatorKey.currentContext!,
        builder: (context) =>
            MyAlertDialog(title: "Error", message: error, action: "Ok"),);
    }
  }

//myViewState myViewState=myViewState.loadingAll;
  // MyState myState=MyState();
  //
  //
  // void loading(){
  //   try {
  //     myViewState = myViewState.loaded;
  //   }catch(e){
  //     myViewState=myViewState.error;
  //   }

  // }
  //
  // void updateState(myViewState myViewState){
  //   myState.setState(() {
  //     myState.myViewState=myViewState;
  //   });
  //
  //
  // }

}