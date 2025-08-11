

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

import '../../models/my_menu/my_menu.dart';
import '../../widgets/button/button_widget.dart';
import '../../widgets/menu/my_menu.dart';

class ScanDocument extends StatefulWidget {
  final TypeScan? typeScan;
  bool? scanIdRow;
   ScanDocument({super.key,this.typeScan, this.scanIdRow});

  @override
  State<ScanDocument> createState() => _ScanDocumentState();
}

class _ScanDocumentState extends MyState<ScanDocument> {

  MyMenuType menuType=MyMenuType.gridView;
  List<MyMenu> menus=List<MyMenu>.empty(growable: true);

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
    int imageColorPrimary=Theme.of(context).primaryColor.value;
    (controller as ScanDocumentController).typeScan=widget.typeScan??TypeScan.selectScan;
    switch (widget.typeScan){
      case TypeScan.selectScan:
        menus.add(MyMenu(id: DateTime.now().toString(),
            assetImage:  "assets/images/scan/scanDocument.png",
            name: "Scan Document", level: 2, routerName: "/scan/scanDocument"));
        menus.add(MyMenu(id: DateTime.now().toString(), name: "Scan ID",
            assetImage:  "assets/images/scan/scanId.png",
            level: 2, routerName: "/scan/scanId"));
        menus.add(MyMenu(id: DateTime.now().toString(), name: "Scan PassPort",
            assetImage:  "assets/images/scan/scanPassport.png",
            level: 2, routerName: "/scan/scanPassPort"));
        break;
        default:
          (controller as ScanDocumentController).typeScan=widget.typeScan??TypeScan.scanDocument;
          if(widget.scanIdRow==null&&widget.typeScan==TypeScan.scanID){
            await showDialog(context: context, builder: (context) =>
                MyCustomDialog(
                  title: "Select Scan", content: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Material(

                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12), // bo góc splash
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {
                            widget.scanIdRow = true;
                          });
                        },
                        child: Container(
                          height: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: Color(imageColorPrimary), // nền trắng (hoặc màu bạn thích)
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.credit_card_outlined, size: 30),
                              SizedBox(width: 10),
                              Icon(Icons.credit_card_outlined, size: 30),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Material(

                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12), // bo góc splash
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {
                            widget.scanIdRow = false;
                          });
                        },
                        child: Container(
                          height: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: Color(imageColorPrimary), // nền trắng (hoặc màu bạn thích)
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.credit_card_outlined, size: 30),
                              SizedBox(width: 10),
                              Icon(Icons.credit_card_outlined, size: 30),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                  actions: [],

                ),);
          }
     onPressedNew();
     break;
    }




    // (controller as ScanDocumentController).typeScan=widget.typeScan??TypeScan.scanDocument;
    // onPressedNew();


  }
  @override
  // TODO: implement actionMenu
  List<Widget>? get actionMenu{
    List<MyPopupmenuItem> items=List<MyPopupmenuItem>.empty(growable: true);

    items.add(MyPopupmenuItem(function: (){
      MyStorage().getPathFromFilePicker(typeFile: "pdf",changePath: true);
    }, values: 1,contentString: "Change local save document"));
    items.add(MyPopupmenuItem(function: (){
      onPressedNew();
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
    items.add(MyPopupmenuItem(function:(){
      (controller as ScanDocumentController).typeScan=TypeScan.scanID;
       onPressedNew();
    }, values: 6,contentString: "Scan ID"));
    items.add(MyPopupmenuItem(function:(){
      (controller as ScanDocumentController).typeScan=TypeScan.scanPassPort;
      onPressedNew();
    }, values: 7,contentString: "Scan PassPort"));
    MyPopupMenu popupMenu=MyPopupMenu(items: items,);
    return [popupMenu];
  }

  @override
  Widget? get bottomNavigationBar {
    if((controller as ScanDocumentController).typeScan!=TypeScan.selectScan) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyIconTextButton(iconButton: IconButton(onPressed: onPressedNew,
            icon: Image.asset("assets/images/new.png", height: 30),),
            label: AppLocalizations.of(context).translate("New"),),
          MyIconTextButton(iconButton: IconButton(onPressed: onPressedAdd,
            icon: Image.asset("assets/images/add.png", height: 30),),
            label: AppLocalizations.of(context).translate("Add"),),
          MyIconTextButton(iconButton: IconButton(onPressed: () {
            if (pdfFinalData != null) {
              MyStorage().writeFile(pdfFinalData!, "PzoScan", typeFile: "pdf");
            }
          }, icon: Image.asset("assets/images/save.png", height: 30),),
            label: AppLocalizations.of(context).translate("Save"),),
          MyIconTextButton(iconButton: IconButton(onPressed: () async {
            var result = await showModalBottomSheet(
              context: context, builder: (context) => const FormatPdf(),);


            if (result != false) {
              pdfFinalData =
              await (controller as ScanDocumentController).buildPdf(
                  _pictures, pageFormat: PdfPageFormat.a4);
              setState(() {


              });
            }
          }, icon: Image.asset("assets/images/pdfFormat.png", height: 30),),
            label: AppLocalizations.of(context).translate("Format PDF"),),


        ],
      );
    }
  }











  void onPressedAdd() async {
    if((controller as ScanDocumentController).typeScan==TypeScan.scanID) return;
    List<String> pictures;
    try {

      pictures = await CunningDocumentScanner.getPictures(

          isGalleryImportAllowed: true) ?? [];
      if (!mounted) return;
      _pictures.addAll(pictures);
      pdfFinalData= await (controller as ScanDocumentController).buildPdf(_pictures);
      setState(() {


      });
    } catch (exception) {
      print("onPressedAdd $exception");
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
      int numberPage=10000;
      switch((controller as ScanDocumentController).typeScan){
        case TypeScan.scanID: numberPage=2;break;
        default: numberPage=(controller as ScanDocumentController).vip?10000:10;break;
      }

      pictures = await CunningDocumentScanner.getPictures(
          noOfPages: numberPage,
          isGalleryImportAllowed: true) ?? [];
      if (!mounted) return;
      _pictures=pictures;
      pdfFinalData= await (controller as ScanDocumentController).buildPdf(_pictures,scanIdRow: widget.scanIdRow);
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
      pdfFinalData= await (controller as ScanDocumentController).scanId(
          imageToPdf: _pictures,
          );
      setState(() {

      });
    } catch (exception) {
      // Handle exception here
    }
  }



  @override
  Widget setBody() {
if((controller as ScanDocumentController).typeScan==TypeScan.selectScan) {
  return MyMenuWidgets(menuType: menuType, menus: menus);
}else {
  myViewState = MyViewState.loading;
  if (pdfFinalData == null) {
    myViewState = MyViewState.loaded;
  }

  return

    pdfFinalData != null ?
    SfPdfViewer.memory(pdfFinalData!,

      onDocumentLoaded: (detail) {
        myViewState = MyViewState.loaded;
      },

    )


        : Center(
      child: IconButton(onPressed: onPressedNew,
        icon: Image.asset("assets/images/new.png", height: 50),),


    );
}



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

