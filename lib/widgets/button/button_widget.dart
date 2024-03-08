import 'package:flutter/material.dart';

enum TypeButton{ delete,link,radio,check,icon}


class MyButton extends StatelessWidget {
  final TypeButton? typeButton;
  final String content;
  final Function()? onPressed;
  final double? width;
  final double? height;
  final Widget? iconWidget;
  final bool? isEnable;

    MyButton(
       {super.key,this.typeButton,required this.content,this.onPressed, this.width, this.height, this.iconWidget,this.isEnable
   });

  @override
  Widget build(BuildContext context) {
    switch (typeButton){
      case TypeButton.link:
        return  SizedBox(
            width: width,
            height: height,
            child:
            TextButton(onPressed: isEnable!=false?onPressed:null, child: Text(content))
        );
      case TypeButton.radio:
        return TextButton(onPressed: isEnable!=false?onPressed:null, child: Text(content));
      case TypeButton.check:
        return TextButton(onPressed: isEnable!=false?onPressed:null, child: Text(content));
      case TypeButton.delete:
        return  SizedBox(
            width: width,
            height: height,
            child:
            ElevatedButton(style: ElevatedButton.styleFrom(
              backgroundColor: isEnable!=false?Colors.red:null,
            ),  onPressed: isEnable!=false?onPressed:null,
                child: Text(content,style: isEnable!=false?TextStyle(color: Colors.white70):null


            ))
        );
    case TypeButton.icon :
    return  SizedBox(
    width: width,
    height: height,
    child:
    ElevatedButton.icon(onPressed: isEnable!=false?onPressed:null, icon: iconWidget??const Icon(Icons.do_not_disturb_on_total_silence), label: Text(content))
    );
    default :
    return  SizedBox(
    width: width,
    height: height,
    child:
    ElevatedButton(
    onPressed: isEnable!=false?onPressed:null, child: Text(content))
    );
    }

    // return  SizedBox(
    //   width: width,
    //   height: height,
    //   child:
    //   ElevatedButton(onPressed: onPressed??(){}, child: Text(content))
    // );
  }
}











// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../common/color/colors.dart';
// //import 'package:DragonV_app/res/res.dart';
//
// enum MyButtonType {
//   filled,
//   outline,
//   linked,
//   text,
// }
//
//
//
// class MyButton extends StatelessWidget {
//   const MyButton({
//     ValueKey? key,
//     this.width = 180,
//     this.height = 44,
//     this.title,
//     required this.onPressed,
//     this.type = MyButtonType.filled,
//     this.radius,
//     this.wTitle,
//     this.btnColor,
//     this.tintColor,
//   }) : super(key: key);
//
//   factory MyButton.textButton({
//     ValueKey? key,
//     String? title,
//     Function()? onPressed,
//     Widget? wTitle,
//     Color? tintColor,
//     double width = 0,
//   }) {
//     return MyButton(
//       key: key,
//       width: width,
//       title: title,
//       onPressed: onPressed,
//       type: MyButtonType.text,
//       wTitle: wTitle,
//       tintColor: tintColor,
//     );
//   }
//
//   factory MyButton.filledButton({
//     ValueKey? key,
//     double width = 180,
//     double height = 44,
//     String? title,
//     Function()? onPressed,
//     double? radius,
//     Widget? wTitle,
//     Color? btnColor,
//     Color? tintColor,
//   }) {
//     return MyButton(
//       key: key,
//       width: width,
//       height: height,
//       title: title,
//       onPressed: onPressed,
//       radius: radius,
//       wTitle: wTitle,
//       btnColor: btnColor,
//       tintColor: tintColor,
//     );
//   }
//
//   factory MyButton.deleteButton({
//     ValueKey? key,
//     double width = 180,
//     double height = 44,
//     String? title = 'Delete',
//     required Function() onPressed,
//     double? radius,
//     Widget? wTitle,
//     Color? tintColor,
//   }) {
//     return MyButton(
//       key: key,
//       width: width,
//       height: height,
//       title: title,
//       onPressed: onPressed,
//       radius: radius,
//       wTitle: wTitle,
//       btnColor: Colors.redAccent[100],
//       tintColor: tintColor,
//     );
//   }
//
//   factory MyButton.linkedButton({
//     ValueKey? key,
//     String? title,
//     Function()? onPressed,
//     Widget? wTitle,
//     Color? tintColor,
//     double width = 0,
//   }) {
//     return MyButton(
//       key: key,
//       width: width,
//       title: title,
//       onPressed: onPressed,
//       type: MyButtonType.linked,
//       wTitle: wTitle,
//       tintColor: tintColor,
//     );
//   }
//
//   final double width;
//   final double height;
//   final String? title;
//   final MyButtonType type;
//   final Function()? onPressed;
//   final double? radius;
//   final Widget? wTitle;
//   final Color? btnColor;
//   final Color? tintColor;
//
//   @override
//   Widget build(BuildContext context) {
//     return ConstrainedBox(
//       constraints: BoxConstraints(minWidth: width, minHeight: height),
//       child: _buildButton(context),
//     );
//   }
//
//   Widget _buildButton(BuildContext context) {
//     switch (type) {
//       case MyButtonType.filled:
//         return ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: btnColor ?? AppColors.primaryColor,
//             disabledForegroundColor: btnColor?.withPercentAlpha(0.5) ??
//                 AppColors.primaryColor.withPercentAlpha(0.5).withOpacity(0.38),
//             disabledBackgroundColor: btnColor?.withPercentAlpha(0.5) ??
//                 AppColors.primaryColor.withPercentAlpha(0.5).withOpacity(0.12),
//           ),
//           onPressed: onPressed,
//           child: wTitle ??
//               Text(
//                 title??"",
//                 style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: tintColor ?? Colors.white,),
//               ),
//         );
//       case MyButtonType.outline:
//         return OutlinedButton(
//           style: OutlinedButton.styleFrom(
//             foregroundColor: tintColor?.withPercentAlpha(0.2) ??
//                 AppColors.primaryColor.withPercentAlpha(0.2),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(radius ?? height / 2),
//             ),
//             side: BorderSide(color: tintColor ?? AppColors.primaryColor),
//           ),
//           onPressed: onPressed,
//           child: wTitle ??
//               Text(
//                 title??"",
//                 style: Theme.of(context).textTheme.bodyMedium?.copyWith(//context.theme.textTheme.body.medium.copyWith(
//                   color: tintColor ?? AppColors.primaryColor,
//                 ),
//               ),
//         );
//       case MyButtonType.linked:
//         return CupertinoButton(
//           onPressed: onPressed,
//           padding: EdgeInsets.zero,
//           child: Text(
//             title??'',
//             style: Theme.of(context).textTheme.bodyMedium?.copyWith(//context.theme.textTheme.body.medium.copyWith(
//               color: tintColor ?? AppColors.primaryColorDark,
//               decoration: TextDecoration.underline,
//             ),
//           ),
//         );
//       case MyButtonType.text:
//         return CupertinoButton(
//           onPressed: onPressed,
//           padding: EdgeInsets.zero,
//           child: Text(
//             title??"",
//             style: Theme.of(context).textTheme.bodyMedium?.copyWith(//context.theme.textTheme.body.medium.copyWith(
//               color: tintColor ?? AppColors.primaryColorDark,
//             ),
//           ),
//         );
//       default:
//         return Container();
//     }
//   }
// }
//
// class PBDropdownButton extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
//
// }
