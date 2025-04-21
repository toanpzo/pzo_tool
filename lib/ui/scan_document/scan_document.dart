

import 'dart:io';

import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:pdf/pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:vietjet_tool/common/local_storage/my_storage.dart';
import 'package:vietjet_tool/common/localizations/appLocalizations.dart';
import 'package:vietjet_tool/common/template/my_state.dart';
import 'package:vietjet_tool/controllers/my_controller.dart';
import 'package:vietjet_tool/ui/scan_document/scan_documet_controller.dart';
import 'package:vietjet_tool/widgets/button/MyIconTextButton.dart';
import 'package:vietjet_tool/widgets/button/my_popup_menu.dart';
import 'package:vietjet_tool/widgets/dialog/dialogs.dart';

import '../../widgets/button/button_widget.dart';

class ScanDocument extends StatefulWidget {
  const ScanDocument({super.key});

  @override
  State<ScanDocument> createState() => _ScanDocumentState();
}

class _ScanDocumentState extends MyState<ScanDocument> {

  List<String> _pictures = [];
    Uint8List? pdfFinalData;
    File? file;
  @override
  MyController createController() {
    // TODO: implement createController
    return ScanDocumentController(this);
  }

  @override
  Future<void> afterLoadData() async{
    //pdfFinalData =await (controller as ScanDocumentController).pdfFinal.save();


  }
  @override
  // TODO: implement actionMenu
  List<Widget>? get actionMenu{
    List<MyPopupmenuItem> items=List<MyPopupmenuItem>.empty(growable: true);

    items.add(MyPopupmenuItem(function: (){
      MyStorage().getPathFromFilePicker(typeFile: "pdf",changePath: true);
    }, values: 1,contentString: "Change local save document"));
    items.add(MyPopupmenuItem(function: (){
      onPressedAdd();
    }, values: 2,contentString: "Pdf format"));
    items.add(MyPopupmenuItem(function: ()async{
      pdfFinalData= await (controller as ScanDocumentController).buildPdf(_pictures,pageFormat: PdfPageFormat.standard);
      setState(() {

      });
    }, values: 3,contentString: "Pdf format standard"));
    items.add(MyPopupmenuItem(function: () async{
      pdfFinalData= await (controller as ScanDocumentController).buildPdf(_pictures,pageFormat: PdfPageFormat.a4);
      setState(() {

      });
    }, values: 4,contentString: "Pdf format a4"));
    items.add(MyPopupmenuItem(function: ()async{
      pdfFinalData=await (controller as ScanDocumentController).buildPdf(_pictures);
      setState(() {

      });
    }, values: 5,contentString: "Pdf format undi"));
    items.add(MyPopupmenuItem(function:onPressedScanId, values: 6,contentString: "Scan ID"));
    MyPopupMenu popupMenu=MyPopupMenu(items: items,);
    return [popupMenu];
  }

  @override
  Widget? get bottomNavigationBar {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyIconTextButton(iconButton: IconButton(onPressed: onPressedNew, icon:Image.asset("assets/images/new.png",height: 30),),
          label: AppLocalizations.of(context).translate("New"),),
        MyIconTextButton(iconButton:IconButton(onPressed: onPressedAdd, icon:Image.asset("assets/images/add.png",height: 30),),
          label: AppLocalizations.of(context).translate("Add"),),
        MyIconTextButton(iconButton: IconButton(onPressed: (){
          if(pdfFinalData!=null) {
            MyStorage().writeFile(pdfFinalData!, "PzoScan", typeFile: "pdf");
          }
        }, icon:Image.asset("assets/images/save.png",height: 30),),
          label: AppLocalizations.of(context).translate("Save"),),
        MyIconTextButton(iconButton: IconButton(onPressed: ()async{
          var result= await showModalBottomSheet(context: context, builder: (context) => const FormatPdf(),);


          if(result!=false){
            pdfFinalData= await (controller as ScanDocumentController).buildPdf(_pictures,pageFormat: PdfPageFormat.a4);
            setState(() {


            });

          }



        }, icon:Image.asset("assets/images/pdfFormat.png",height: 30),),
          label: AppLocalizations.of(context).translate("Format PDF"),),




      ],
    );
  }











  void onPressedAdd() async {
    List<String> pictures;
    try {
      pictures = await CunningDocumentScanner.getPictures(isGalleryImportAllowed: true) ?? [];
      if (!mounted) return;
      _pictures.addAll(pictures);
      pdfFinalData= await (controller as ScanDocumentController).buildPdf(_pictures);
      setState(() {


      });
    } catch (exception) {
      print("fhdjkshfjkdsh");
      // Handle exception here
    }
  }

  void onPressedNew() async {
    List<String> pictures;
    try {
      bool? results;
      if(_pictures.isNotEmpty) {
        results = await showDialog(context: context, builder: (context) =>
            MyConfirmDialog(
              message:"Do you want to create a new document scan?",
              onContinue: (){
                Navigator.pop(context,true);
              },

            ),);
      }else{
        results=true;
      }

      if(results!=true){
        return;
      }

   //   await CunningDocumentScanner.getPictures(isGalleryImportAllowed: true);
      pictures = await CunningDocumentScanner.getPictures(isGalleryImportAllowed: true) ?? [];
      if (!mounted) return;
      _pictures=pictures;
      pdfFinalData= await (controller as ScanDocumentController).buildPdf(_pictures);
      setState(() {

      });
    } catch (exception) {
      // Handle exception here
    }
  }
  void onPressedScanId() async {
    List<String> pictures;
    try {

      pictures = await CunningDocumentScanner.getPictures(
          noOfPages: 2,
          isGalleryImportAllowed: true) ?? [];
      if (!mounted) return;
      _pictures=pictures;
      pdfFinalData= await (controller as ScanDocumentController).scanId(_pictures);
      setState(() {

      });
    } catch (exception) {
      // Handle exception here
    }
  }



  @override
  Widget setBody() {
//     final pdfController = PdfController(
//       document: PdfDocument.openData(pdfFinalData??Uint8List.fromList(  [1,2,5,54,54,5,45])),
//     );
//
// // Simple Pdf view with one render of page (loose quality on zoom)
//     return PdfView(
//       controller: pdfController,
//     );






      return

  //    Column(
  //      children: [
      //   Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     _pictures.isNotEmpty?
      //     MyButton(content: "Save",
      //       onPressed: ()async{
      //       if(pdfFinalData!=null) {
      //         MyStorage().writeFile(pdfFinalData!, "PzoScan", typeFile: "pdf");
      //       }
      //       },
      //     ):const SizedBox(),
      //     MyButton(content: "Add",
      //       onPressed: onPressedAdd,
      //     ),
      //     MyButton(content: "New",
      //       onPressed: onPressedNew,
      //     )
      //   ],
      // ),
       //Expanded(child:
       //SingleChildScrollView(
      // child:
       pdfFinalData!=null?
       // PDFView(
       //   autoSpacing: false,
       //   pdfData: pdfFinalData,
       // )
       SfPdfViewer.memory(pdfFinalData!,

       )


           :Center(
         child: IconButton(onPressed: onPressedNew, icon:Image.asset("assets/images/new.png",height: 50),),


       );
      //   ,
    //),
     //  )



  //    ]);






  }

  @override
  String setTitle() {
    // TODO: implement setTitle
    return "Scan";
  }

}


class FormatPdf extends StatelessWidget {
  const FormatPdf({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Text("Page Format"),
            Container()
          ],
        ),
        Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Text("Ngang doc"),
            Container()
          ],
        ),
        Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            MyButton(content: "ok",
            onPressed: (){
              Navigator.pop(context);

            },
            )
          ],
        )

      ],

    );
  }
}

