
import 'package:flutter/material.dart';

class MyTextFiled extends StatelessWidget {
  final String? text;
  final double? width;
  final double? height;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? minLines;
  final int? maxLines;

  final TextCapitalization? textCapitalization;

  final TextAlign? textAlign;
  final TextStyle? style;
  final int? maxLength;
  final bool? pass;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final bool? readOnly;
  final Widget? label;
  final Widget? suffix;
  final Widget? prefix;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
    const MyTextFiled({super.key,this.width,this.hintText, this.height, this.keyboardType, this.textInputAction, this.textCapitalization, this.textAlign, this.style, this.maxLength, this.pass, this.suffixIcon, this.prefixIcon, this.controller, this.onChanged, this.text, this.readOnly, this.label, this.suffix, this.prefix, this.margin, this.padding, this.minLines, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:margin?? EdgeInsets.symmetric(vertical: 10),
      padding:padding?? EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary
        ),
        borderRadius: BorderRadius.all(Radius.circular(5)),
        
       // color: Colors.red

      ),
      width: width,
      height: height,
      child:  TextField(
        minLines: minLines,
        maxLines: maxLines,





        onChanged: onChanged,
        controller:  text!=null?TextEditingController(text: text) :controller,
          keyboardType: keyboardType??TextInputType.text,
          textInputAction: textInputAction,
          textCapitalization: textCapitalization??TextCapitalization.none,
          textAlign: textAlign??TextAlign.start,
          style: style??const TextStyle(),
          maxLength:maxLength,
          obscureText: pass??false,
        readOnly: readOnly??false,


        //cursorHeight: 16,
        decoration: InputDecoration(
          label: label,
          suffix: suffix,

          prefix: prefix,

          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,


          hintText: hintText??"",
          border:  InputBorder.none,
            //contentPadding: EdgeInsets.symmetric(horizontal: 5)

        ),

      ),
    );
  }
}
