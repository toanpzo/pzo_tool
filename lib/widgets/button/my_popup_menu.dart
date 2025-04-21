
import 'package:flutter/material.dart';
import 'package:vietjet_tool/controllers/my_controller.dart';

import '../../common/localizations/appLocalizations.dart';

enum TypePopup{text,widget}


class MyPopupmenuItem{
  final TypePopup? type;
  final Object values;
  final Widget? content;
  final String? contentString;
  final Function function;
  MyPopupmenuItem({this.contentString, required this.function, this.type,  required this.values,this.content });

}

class MyPopupMenu extends StatelessWidget {
  final List<MyPopupmenuItem> items;


  // late  TypePopup? typePopup;
  //
  // final List<Object> values;
  // final List<Widget>? contents;
  // final List<String>? contentStrings;
  // final List<Function> functions;

   const MyPopupMenu({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    //TypePopup typePopup=typePopup??TypePopup.text;


    List<PopupMenuEntry> widgets=List<PopupMenuEntry>.empty(growable: true);

    for(int i=0;i<items.length;i++){
      TypePopup typePopup=items[i].type??TypePopup.text;
      PopupMenuItem item= PopupMenuItem(
        value: items[i].values,
        child: typePopup==TypePopup.text?Text( AppLocalizations.of(context).translate(items[i].contentString??"")):items[i].content??const Text("") //  Text( AppLocalizations.of(context).translate("Save bank question")),
      );
      widgets.add(item);
    }

return PopupMenuButton(
  onSelected: (value) {
    try {
      items.firstWhere((element) => element.values==value).function.call();
    }catch(e){
      MyController.showErrorDialogEvery(e.toString());
    }
    // your logic
  },
  itemBuilder:
      (context) {
    return  widgets;
  },
);

  }
}


