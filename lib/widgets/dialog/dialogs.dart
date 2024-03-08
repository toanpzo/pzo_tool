import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vietjet_tool/theme/text_theme.dart';
import '../../common/color/colors.dart';
//import '../button/button_widget.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:DragonV_app/res/res.dart';
// import 'package:DragonV_app/ui/widgets/button_widget.dart';

enum MyAlertDialogType { info, warning, error, success }

extension MyAlertDialogTypeExt on MyAlertDialogType {
  Color get color {
    switch (this) {
      case MyAlertDialogType.error:
        return Colors.redAccent;
      case MyAlertDialogType.warning:
        return Colors.yellow[700]!;
      case MyAlertDialogType.success:
        return Colors.green;
      default:
        return Colors.black87;
    }
  }
}

class MyLoadingDialog extends StatelessWidget {
  const MyLoadingDialog({Key? key, this.message}) : super(key: key);

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: (message == null)
          ? _buildLoadingWidgetNoMessage(context)
          : _buildLoadingWidgetMessage(context),
    );
  }

  Widget _buildLoadingWidgetNoMessage(BuildContext context) {

    return Center(
      child:
          SpinKitFadingCircle(color: Theme.of(context).colorScheme.secondary),
      //SpinKitPulse(color: AppColors.primaryColor),
    );
  }

  Widget _buildLoadingWidgetMessage(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SpinKitPulse(color: Theme.of(context).primaryColor),
              const SizedBox(width: 20),
              Flexible(
                child: Text(
                  message ?? '',
                  style: Theme.of(context).textTheme.bodyMedium,
                  //context.theme.textTheme.body,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({
    Key? key,
    this.type=MyAlertDialogType.info,
    required this.title,
    required this.message,
    required this.action,
    this.onAction,
  }) : super(key: key);

  final MyAlertDialogType type;
  final String title;
  final String message;
  final String action;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    // Color colorBtn=MyAlertDialogType.info.color;
    // if(type!=null){
    //   colorBtn=type!.color;
    // }


    return AlertDialog(
      title:
      Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge!//?.medium// context.theme.textTheme.bodyLarge?.medium
                  .copyWith(color: type.color),
            ),
      content: Text(
        message??"",
        style: Theme.of(context).textTheme.bodyMedium,//context.theme.textTheme.body,
      ),
      actions: <Widget>[
        // MyButton.filledButton(
        //   title: action,
        //   onPressed: () {
        //     onAction?.call();
        //     Navigator.pop(context);
        //   },
        // ),
        ElevatedButton(onPressed: () {
          onAction?.call();
          Navigator.pop(context);
        }, child: Text(action))

      ],
    );
  }
}

class MyConfirmDialog extends StatelessWidget {
  final String? title;
  final String? message;
  final String? actionTitle;
  final String? cancelTitle;
  final VoidCallback? onContinue;

  MyConfirmDialog(
      {this.title,
        this.message,
        this.actionTitle,
        this.cancelTitle,
        this.onContinue});

  @override
  Widget build(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(cancelTitle ?? "cancel"),//context.localization!.cancel),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text(actionTitle ?? "confirm"),//context.localization!.confirm),
      onPressed: () {
        Navigator.of(context).pop();
        onContinue?.call();
      },
    );

    return AlertDialog(
        title: title != null ? Text(title!) : null,
        content: Text(message ?? ""),
        actions: [
          cancelButton,
          continueButton,
        ]);
  }
}


class MyColorPicker extends StatelessWidget {
  const MyColorPicker({super.key, required this.pickerColor, required this.onColorChanged, this.title, this.action});
  final Color pickerColor;
  final Function(Color) onColorChanged;
  final String? title;
  final List<Widget>? action;

  @override
  Widget build(BuildContext context) {
    return

      AlertDialog(
        title: Text(title??'Pick a color!'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: pickerColor,
            onColorChanged: onColorChanged,
          ),
        ),
        actions: action
      );

  }
}





// class ImageDialog extends StatelessWidget {
//   const ImageDialog({
//     Key? key,
//     required this.title,
//     required this.description,
//     required this.buttonText,
//     this.imageUrl,
//     this.onAction,
//     this.titleColor,
//   }) : super(key: key);
//
//   final String title;
//   final String description;
//   final String buttonText;
//   final VoidCallback? onAction;
//   final String? imageUrl;
//   final Color? titleColor;
//
//   static const double padding = 16;
//   static const double avatarRadius = 66;
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(padding),
//       ),
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//       child: dialogContent(context),
//     );
//   }
//
//   Widget dialogContent(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         Container(
//           padding: const EdgeInsets.only(
//             top: avatarRadius + padding,
//             bottom: padding,
//             left: padding,
//             right: padding,
//           ),
//           margin: const EdgeInsets.only(top: avatarRadius),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(padding),
//             boxShadow: const [
//               BoxShadow(
//                 color: Colors.black26,
//                 blurRadius: 10,
//                 offset: Offset(0, 10),
//               ),
//             ],
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min, // To make the card compact
//             children: <Widget>[
//               Text(
//                 title,
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.w700,
//                   color: titleColor ?? Colors.black54,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Text(
//                 description,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   fontSize: 16,
//                 ),
//               ),
//               const SizedBox(height: 24),
//               Align(
//                 alignment: Alignment.bottomRight,
//                 child: MyButton.filledButton(
//                   onPressed: () {
//                     onAction?.call();
//                     Navigator.of(context).pop(); // To close the dialog
//                   },
//                   title: buttonText,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Positioned.fill(
//           child: Align(
//             alignment: Alignment.topCenter,
//             child: CircleAvatar(
//               backgroundImage: NetworkImage(imageUrl!),
//               backgroundColor: Colors.cyan,
//               radius: avatarRadius,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
