

import 'package:flutter/material.dart';
import 'package:vietjet_tool/common/template/my_state.dart';
import 'package:vietjet_tool/controllers/my_controller.dart';
import 'package:vietjet_tool/widgets/button/button_widget.dart';

class SelectEditOrReviewQuest extends StatefulWidget {
  const SelectEditOrReviewQuest({super.key});

  @override
  State<SelectEditOrReviewQuest> createState() => _SelectEditOrReviewQuestState();
}

class _SelectEditOrReviewQuestState extends MyState<SelectEditOrReviewQuest> {

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
        MyButton(content: "Edit question",padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          width: width*0.9,
          onPressed: (){
            Navigator.pushNamed(context, "/quest/edit");
          },
        ),

        MyButton(content: "Review and test question",padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          width: width*0.9,
          onPressed: (){
            Navigator.pushNamed(context, "/quest/review");
          },
        ),
      ],
    );

  }

  @override
  String setTitle() {
    return "";
  }
}







// class SelectEditOrReviewQuestdd extends StatelessWidget {
//   const SelectEditOrReviewQuestdd({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     double width=MediaQuery.of(context).size.width;
//     return Scaffold(
//       body:
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           MyButton(content: "Edit question",padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
//           width: width*0.9,
//           onPressed: (){
//             Navigator.pushNamed(context, "/quest/edit");
//           },
//           ),
//
//           MyButton(content: "Review and test question",padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
//             width: width*0.9,
//             onPressed: (){
//               Navigator.pushNamed(context, "/quest/review");
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
