import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_watermark/image_watermark.dart';
import 'package:pdf/pdf.dart';
import 'package:vietjet_tool/common/local_storage/my_storage.dart';
import 'package:vietjet_tool/controllers/my_controller.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:vietjet_tool/models/my_menu/my_menu.dart';

enum TypeScan{selectScan,scanID, scanPassPort,scanDocument}

class ScanDocumentController extends MyController{
  @override
  Future<void> loadData() async {
    // User? user =await MyStorage().getUser();
    // if(user!=null){
    //   DateTime vipExd=user.vipExd??DateTime.now();
    //   if(vipExd.isAfter(DateTime.now())){
    //     vip=true;
    //   }
    //   else{
    //     vip=false;
    //   }
    // }
    vip= await getVip();

  }
  ScanDocumentController(super.myState);
  
  List<String> images=List<String> .empty(growable: true);

  File? fileLocal;
  bool vip=false;
  TypeScan typeScan=TypeScan.selectScan;

  void selectScan({required MyMenu menu}){
    //menu.
  }

  Future<Uint8List?>  buildPdf(List<String> imageToPdf,{bool? scanIdRow,pw.EdgeInsetsGeometry? margin,PdfPageFormat? pageFormat,pw.PageOrientation? pageOrientation})async {
    if(imageToPdf.isEmpty) {
      return null;
    }


    if(typeScan==TypeScan.scanID||typeScan==TypeScan.scanPassPort){
      return scanId(
          imageToPdf: imageToPdf,
        scanIdRow: scanIdRow
          );
    }


    PdfPageFormat pdfPageFormat = pageFormat ?? PdfPageFormat.a4;

    var pdfFinal = pw.Document();

    // final pdf = pw.Document();
    // for (var element in imageToPdf) {
    //
    //   // pdf.addPage(pw.Page(
    //   //     pageFormat: PdfPageFormat.a4,
    //   //     build: (pw.Context context) {
    //   //       return pw.Center(
    //   //         child: pw.Text("Hello World"),
    //   //       ); // Center
    //   //     })); // Page
    //
    //   var image = pw.MemoryImage(
    //     File(element).readAsBytesSync(),
    //   );
    //
    //   pdf.addPage(
    //
    //
    //       pw.Page(
    //     margin: margin??const pw.EdgeInsets.all(0),
    //       pageFormat: pageFormat??PdfPageFormat.undefined,
    //       orientation: pageOrientation,
    //
    //
    //       //pageFormat: PdfPageFormat.a4,
    //       build: (pw.Context context) {
    //     return pw.Center(
    //       child:  pw.Column(
    //
    //         mainAxisSize: (pageFormat==null||pageFormat==PdfPageFormat.undefined)?pw.MainAxisSize.min:pw.MainAxisSize.max,
    //         children: [
    //           pw.Text("Scan by Pzo Tools"),
    //
    //           (pageFormat==null||pageFormat==PdfPageFormat.undefined)? pw.Image(image)
    //          : pw.Expanded(child:  pw.Image(image)),
    //           pw.Text("Scan by Pzo Tools"),
    //           pw.Footer(title: pw.Text("Scan by Pzo Tools"),)
    //
    //         ]
    //       )
    //
    //
    //
    //     ); // Center
    //   })
    //
    //   ); // Page
    //
    // }





    //List<pw.Widget> pageWidgets = List<pw.Widget>.empty(growable: true);

    for (var element in imageToPdf) {
      var image = pw.MemoryImage(
        File(element).readAsBytesSync(),
      );

      pw.PageOrientation pageOrientationPage=pw.PageOrientation.portrait;
      if(pageFormat==null){
        if(image.width!=null&&image.height!=null){
          if(image.width!>image.height!){
            pdfPageFormat=PdfPageFormat.a4.landscape;

          }
          else{
            pdfPageFormat=PdfPageFormat.a4.portrait;
          }
        }

      }

      int dtsYWaterMark=0;

      dtsYWaterMark=(image.height??50)-50;
      print(dtsYWaterMark);
      print(image.width);


      final imageWatermark=await ImageWatermark.addTextWatermark(
          dstY: dtsYWaterMark,
          rightJustify: true,
          color: Colors.black12,

          //dstY: 1,
          imgBytes:image.bytes

          , watermarkText: "Scan by Pzo Tools");




      pw.Widget page =

     pw.Center(
         child:




          pw.Column(

            mainAxisAlignment: pw.MainAxisAlignment.center,
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              mainAxisSize:
              pageFormat == PdfPageFormat.undefined
                  ? pw.MainAxisSize.min
                  :pw.MainAxisSize.max,
              children:

              (!vip)?
              pageFormat==PdfPageFormat.undefined?
                  ///undefined
          [

          pw.Image(image,
          height: pageFormat == PdfPageFormat.undefined?null:pdfPageFormat.height
          ),
            pw.Text("Scan by Pzo Tools  ",
                textAlign:  pw.TextAlign.right,
                style: const pw.TextStyle(fontSize: 50)),
          ]:
                  ///stand
                  [
                    pw.Image(
                    height: pageFormat == PdfPageFormat.undefined?null:pdfPageFormat.height,
                        pw.MemoryImage(

                          imageWatermark
                        ),
                    )



                  ]:
                  ///VIP
              [
                pw.Image(

                    image,
                    height: pageFormat == PdfPageFormat.undefined?null:pdfPageFormat.height
                ),

              ]


      )

      );

      pdfFinal.addPage(
          pw.Page(
            margin: margin ?? const pw.EdgeInsets.all(0),
            pageFormat: pdfPageFormat,
            build: (context) => page,
          )
      );


    }



    return pdfFinal.save();





  }

  void addTwoImageToPage( {required pw.Document pdfFinal ,required List<pw.Widget> imageWidgets, bool? scanIdRow}){



    List<pw.Widget>images =List.from(imageWidgets);

      if(!vip){
        pw.Widget pwText =pw.Text("Scan by Pzo Tools  ",
            textAlign: pw.TextAlign.right,
            style: const pw.TextStyle(fontSize: 20));
        images.add(pwText);
      }





      pw.Widget page =

      pw.Container(
          child: scanIdRow==true?

          pw.Row(

              mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: images


          )
          :pw.Center(
            child: pw.Column(


                mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: images


            )
          )



      );

      pdfFinal.addPage(
          pw.Page(
            //margin: margin ?? const pw.EdgeInsets.all(0),
            pageFormat: PdfPageFormat.a4,
            //orientation: pageOrientation,
            build: (context) => page,
          )
      );

      //images.clear();

  }

  Future<Uint8List>  scanId({ required List<String> imageToPdf,bool? scanIdRow })async {

    var pdfFinal = pw.Document();


    // if(imageToPdf.length>=2) {
    //   var image = pw.MemoryImage(
    //     File(imageToPdf[0]).readAsBytesSync(),
    //   );
    //   var image1 = pw.MemoryImage(
    //     File(imageToPdf[1]).readAsBytesSync(),
    //   );
    //
    //   double hightImage=PdfPageFormat.a4.height/2.8;
    //
    //   if(image1.height!=null&&image1.width!=null) {
    //     if (image1.height! > image1.width!){
    //       hightImage=(8.5 / 2.54) * 72;
    //     }else{
    //       hightImage=(5.5 / 2.54) * 72;
    //     }
    //
    //   }
    //
    //
    //
    //   pw.Widget page =
    //
    //   pw.Center(
    //       child:
    //
    //
    //       pw.Column(
    //
    //           mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
    //           crossAxisAlignment: pw.CrossAxisAlignment.center,
    //           children:
    //
    //           (!vip) ?
    //
    //           [
    //
    //             pw.Image(image,height: hightImage),
    //             pw.Image(image1,height: hightImage),
    //             pw.Text("Scan by Pzo Tools  ",
    //                 textAlign: pw.TextAlign.right,
    //                 style: const pw.TextStyle(fontSize: 20)),
    //           ] :
    //
    //           ///stand
    //
    //           ///VIP
    //           [
    //             pw.Image(image,height: hightImage),
    //             pw.Image(image1,height: hightImage),
    //
    //           ]
    //
    //
    //       )
    //
    //   );
    //
    //   pdfFinal.addPage(
    //       pw.Page(
    //         //margin: margin ?? const pw.EdgeInsets.all(0),
    //         pageFormat: PdfPageFormat.a4,
    //         //orientation: pageOrientation,
    //         build: (context) => page,
    //       )
    //   );
    // }

    if(imageToPdf.isNotEmpty){
      List<pw.Widget> images=List<pw.Widget>.empty(growable: true);
      for (int i=0;i<imageToPdf.length;i++) {
        double heightImage=5;
        var image = pw.MemoryImage(
          File(imageToPdf[i]).readAsBytesSync(),
        );

        if(image.height!=null&&image.width!=null) {
          if (image.height! > image.width!){
            switch (typeScan){
              case TypeScan.scanDocument: heightImage=29; break;
              case TypeScan.scanID: heightImage=8.5; break;
              case TypeScan.scanPassPort: heightImage=12.5; break;
              default: heightImage=29;break;
            }
          }else{
            switch (typeScan){
              case TypeScan.scanDocument: heightImage=20; break;
              case TypeScan.scanID: heightImage=5.5; break;
              case TypeScan.scanPassPort: heightImage=8.8; break;
              default: heightImage=20;break;
            }
          }

        }
        heightImage= ConvertCmToPt(heightImage);
        pw.Widget pwImage=  pw.Image(image,height: heightImage);
        images.add(pwImage);

        //set page

        if(images.length==2){

          addTwoImageToPage(
              imageWidgets: images,
              pdfFinal:pdfFinal ,
              scanIdRow: scanIdRow,
               );

          images.clear();

        }

      }

      if(images.isNotEmpty){

        addTwoImageToPage(
            pdfFinal:pdfFinal ,
            imageWidgets:images ,
          scanIdRow: scanIdRow
            );
      }

    }



    return pdfFinal.save();


  }






  void savePdf()async {
    // pageFormat = pageFormat ?? PdfPageFormat.undefined;
    //
    // // final pdf = pw.Document();
    // // for (var element in imageToPdf) {
    // //
    // //   // pdf.addPage(pw.Page(
    // //   //     pageFormat: PdfPageFormat.a4,
    // //   //     build: (pw.Context context) {
    // //   //       return pw.Center(
    // //   //         child: pw.Text("Hello World"),
    // //   //       ); // Center
    // //   //     })); // Page
    // //
    // //   var image = pw.MemoryImage(
    // //     File(element).readAsBytesSync(),
    // //   );
    // //
    // //   pdf.addPage(
    // //
    // //
    // //       pw.Page(
    // //     margin: margin??const pw.EdgeInsets.all(0),
    // //       pageFormat: pageFormat??PdfPageFormat.undefined,
    // //       orientation: pageOrientation,
    // //
    // //
    // //       //pageFormat: PdfPageFormat.a4,
    // //       build: (pw.Context context) {
    // //     return pw.Center(
    // //       child:  pw.Column(
    // //
    // //         mainAxisSize: (pageFormat==null||pageFormat==PdfPageFormat.undefined)?pw.MainAxisSize.min:pw.MainAxisSize.max,
    // //         children: [
    // //           pw.Text("Scan by Pzo Tools"),
    // //
    // //           (pageFormat==null||pageFormat==PdfPageFormat.undefined)? pw.Image(image)
    // //          : pw.Expanded(child:  pw.Image(image)),
    // //           pw.Text("Scan by Pzo Tools"),
    // //           pw.Footer(title: pw.Text("Scan by Pzo Tools"),)
    // //
    // //         ]
    // //       )
    // //
    // //
    // //
    // //     ); // Center
    // //   })
    // //
    // //   ); // Page
    // //
    // // }
    //
    //
    //
    //
    //
    // List<pw.Widget> pageWidgets = List<pw.Widget>.empty(growable: true);
    //
    // for (var element in imageToPdf) {
    //   var image = pw.MemoryImage(
    //     File(element).readAsBytesSync(),
    //   );
    //
    //
    //   pw.Widget page = pw.Center(
    //       child:
    //
    //
    //       pw.Column(
    //
    //           mainAxisSize:
    //           pageFormat == PdfPageFormat.undefined
    //               ? pw.MainAxisSize.min
    //               : pw.MainAxisSize.max,
    //           children: [
    //
    //             pageFormat == PdfPageFormat.undefined
    //                 ? pw.Image(image)
    //                 : pw.Expanded(child: pw.Image(image)),
    //
    //             pageFormat == PdfPageFormat.undefined
    //                 ? pw.Text("Scan by Pzo Tools",
    //                 textAlign:  pw.TextAlign.right,
    //                 style: const pw.TextStyle(fontSize: 50)) : pw.SizedBox(),
    //
    //           ]
    //       )
    //
    //
    //   );
    //
    //   if (pageFormat == PdfPageFormat.undefined) {
    //     pdfFinal.addPage(
    //         pw.Page(
    //           margin: margin ?? const pw.EdgeInsets.all(0),
    //           pageFormat: pageFormat,
    //           orientation: pageOrientation,
    //           build: (context) => page,
    //         )
    //     );
    //   } else {
    //     pageWidgets.add(page);
    //   }
    //
    //   // Center
    //
    // }
    //
    //
    // if (pageFormat != PdfPageFormat.undefined) {
    //   pdfFinal.addPage(
    //       pw.MultiPage(
    //           footer: (context) => pw.Text("Scan by Pzo Tools",textAlign: pw.TextAlign.right),
    //           margin: margin ?? const pw.EdgeInsets.all(0),
    //           pageFormat: pageFormat,
    //           orientation: pageOrientation,
    //
    //
    //           build: (pw.Context context) {
    //             return pageWidgets;
    //           })
    //
    //   );
    // }
    //


   // MyStorage().writeFile(await pdfFinal.save(), "PzoScan",typeFile: "pdf");



  }

}