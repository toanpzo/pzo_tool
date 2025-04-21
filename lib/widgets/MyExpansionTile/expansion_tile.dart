import 'package:flutter/material.dart';

enum TypeExpansionTile { menu, setting, text }

class MyExpansionTile extends StatelessWidget {
  final Function()? onTap;
  final TypeExpansionTile? type;
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
  final List<Widget>? children;

   MyExpansionTile(
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
      this.styleSubText, this.trailing, this.leading,  this.decoration, this.children});

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

    if(type==TypeExpansionTile.menu ){
      leading ??= iconMenu??Icon(Icons.do_not_disturb_on_total_silence,color: colorText,);
    }else if(type==TypeExpansionTile.setting && onTap!=null){

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
      child: ExpansionTile(


        title: titleWidget(),
        subtitle: subTitleWidget(),
        trailing: trailing,
        leading: leading,
        children: children??[],
      ),
    );
  
  }
}
