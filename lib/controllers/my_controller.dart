import 'package:flutter/cupertino.dart';
import 'package:vietjet_tool/common/template/my_page.dart';
import 'package:vietjet_tool/common/template/my_state.dart';

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