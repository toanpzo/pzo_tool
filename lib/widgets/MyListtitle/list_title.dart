import 'package:flutter/material.dart';

enum TypeListTitle { menu, setting, text }

class MyListTitle extends StatelessWidget {
  final Function()? onTap;
  final TypeListTitle? type;
  final String title;
  final String? subTitle;
  final double? width;
  final double? height;
  final Widget? iconMenu;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Widget? image;
  final BuildContext context;
  final Color? colorText;
  final Color? colorSubText;
  final TextStyle? styleText;
  final TextStyle? styleSubText;
  Widget? trailing;
  Widget? leading;
  final Decoration? decoration;

   MyListTitle(
      {super.key,
      this.onTap,
      this.type,
      required this.title,
      this.subTitle,
      this.width,
      this.height,
      this.iconMenu,
      this.margin,
      this.padding,
      this.image,
      required this.context,
      this.colorText,
      this.colorSubText,
      this.styleText,
      this.styleSubText, this.trailing, this.leading,  this.decoration});

  Widget titleWidget() => Text(
        title,
        style: styleText
            ?? TextStyle(color: colorText)

            // Theme.of(context)
            // .textTheme
            // .headlineSmall
            // ?.copyWith(color: colorText),
      );
  Widget? subTitleWidget() =>subTitle!=null? Text(subTitle!,
  style: styleSubText??TextStyle(color: colorSubText)
      //Theme.of(context).textTheme.bodyLarge?.copyWith(color: colorSubText),
  ):null;


  @override
  Widget build(BuildContext context) {

    if(type==TypeListTitle.menu ){
      leading ??= iconMenu??Icon(Icons.do_not_disturb_on_total_silence,color: colorText,);
    }else if(type==TypeListTitle.setting && onTap!=null){

      trailing=const Icon(Icons.arrow_forward_ios);
    }




    return
    Container(
      margin: margin,
      padding: padding,
      width: width,
      height: height,
      decoration: decoration?? const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12
          )
        )
      ),
      child: ListTile(
        onTap: onTap,
        title: titleWidget(),
        subtitle: subTitleWidget(),
        trailing: trailing,
        leading: leading,
      ),
    );
  
  }
}
