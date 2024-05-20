import 'package:flutter/material.dart';
import 'package:vietjet_tool/common/template/my_state.dart';
import 'package:vietjet_tool/controllers/my_controller.dart';

import '../../widgets/button/button_widget.dart';


class AirCraftToolScreen extends StatefulWidget {
  const AirCraftToolScreen({super.key});

  @override
  State<AirCraftToolScreen> createState() => _AirCraftToolScreenState();
}

class _AirCraftToolScreenState extends MyState<AirCraftToolScreen> {
  @override
  MyController createController() {
    return MyController(this);
  }

  @override
  Widget setBody() {
    double width=MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyButton(content: "fuelCalc",padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          width: width*0.9,
          onPressed: (){
            Navigator.pushNamed(context, "/aircraft/fuel");
          },
        ),

        MyButton(content: "melCalc",padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          width: width*0.9,
          onPressed: (){
            Navigator.pushNamed(context, "/aircraft/mel");
          },
        ),
      ],
    );
  }

  @override
  String setTitle() {
    return "AirCraft Tools";
  }

}
