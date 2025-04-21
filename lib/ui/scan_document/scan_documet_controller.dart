import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_watermark/image_watermark.dart';
import 'package:pdf/pdf.dart';
import 'package:vietjet_tool/controllers/my_controller.dart';
import 'package:pdf/widgets.dart' as pw;

class ScanDocumentController extends MyController{
  @override
  Future<void> loadData() async {
    //vip=true;

  }
  ScanDocumentController(super.myState);
  
  List<String> images=List<String> .empty(growable: true);

  File? fileLocal;
  bool vip=false;

  Future<Uint8List>  buildPdf(List<String> imageToPdf,{pw.EdgeInsetsGeometry? margin,PdfPageFormat? pageFormat,pw.PageOrientation? pageOrientation})async {
    pageFormat = pageFormat ?? PdfPageFormat.undefined;

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

      //Image.Me



      if(pageOrientation==null){
        if(image.width!=null&&image.height!=null){
          if(image.width!>image.height!){
            pageOrientation= pw.PageOrientation.landscape;

          }
          else{
            pageOrientation= pw.PageOrientation.portrait;
          }
        }

      }

      int dtsYWaterMark=0;

      dtsYWaterMark=(image.height??50)-50;
      print(dtsYWaterMark);
      print(image.width);
      // if(pageOrientation==pw.PageOrientation.portrait){
      //   dtsYWaterMark=image.height??50-50;
      // }
      // if(pageOrientation==pw.PageOrientation.portrait){
      //   dtsYWaterMark=image.width??50-50;
      // }
      // print(pageFormat.height);
      // print(pageFormat.width);
      //
      // print(image.width);
      // print(image.height);


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

      // pw.Container(
      //   height: (pageFormat==PdfPageFormat.undefined)?null:vip?pageFormat.height:pageFormat.height*0.9,
      //   child:




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

          pw.Image(image),
            pw.Text("Scan by Pzo Tools  ",
                textAlign:  pw.TextAlign.right,
                style: const pw.TextStyle(fontSize: 50)),
          ]:
                  ///stand
                  [
                    pw.Image(
                        pw.MemoryImage(
                          imageWatermark
                        )
                    )



                  ]:
                  ///VIP
              [
                pw.Image(image),
                // pageFormat == PdfPageFormat.undefined
                //     ? pw.Image(image)
                //     : pw.Expanded(child: pw.Image(image)),
                //
                // (pageFormat == PdfPageFormat.undefined&&!vip)
                //     ? pw.Text("Scan by Pzo Tools",
                //     textAlign:  pw.TextAlign.right,
                //     style: const pw.TextStyle(fontSize: 50)) : pw.SizedBox(),

              ]


      )

      );

      pdfFinal.addPage(
          pw.Page(
            margin: margin ?? const pw.EdgeInsets.all(0),
            pageFormat: pageFormat,
            orientation:  pageOrientation,
            build: (context) => page,
          )
      );

      // pdfFinal.addPage(
      //     pw.Page(
      //       margin: margin ?? const pw.EdgeInsets.all(0),
      //       pageFormat: pageFormat,
      //       orientation: pageOrientation,
      //       build: (context) => page,
      //     )
      // );

      // if (pageFormat == PdfPageFormat.undefined) {
      //   pdfFinal.addPage(
      //       pw.Page(
      //         margin: margin ?? const pw.EdgeInsets.all(0),
      //         pageFormat: pageFormat,
      //         orientation: pageOrientation,
      //         build: (context) => page,
      //       )
      //   );
      // } else {
      //   pageWidgets.add(page);
      // }

      // Center

    }


    // if (pageFormat != PdfPageFormat.undefined) {
    //   pdfFinal.addPage(
    //       pw.MultiPage(
    //         footer:vip?null: (context) {
    //           return pw.Text("Scan by Pzo Tools",textAlign: pw.TextAlign.right);
    //         },
    //         //footer: null,
    //           // footer: (context)
    //           // {
    //           //   return pw.Text("Scan by Pzo Tools",textAlign: pw.TextAlign.right);
    //           //  // return vip? pw.SizedBox():
    //           // },
    //           margin: margin ?? const pw.EdgeInsets.all(0),
    //           pageFormat: pageFormat,
    //           orientation: pageOrientation,
    //
    //
    //
    //           build: (pw.Context context) {
    //             return pageWidgets;
    //           })
    //
    //   );
    // }


    return pdfFinal.save();
    // String fileName="${DateTime.now().toString()}.pdf";
    // await MyStorage().writeFileLocal(fileName, bytes);
    // fileLocal= await MyStorage().getLocalFile(fileName);

    //return bytes;





  }

  Future<Uint8List>  scanId(List<String> imageToPdf)async {

    var pdfFinal = pw.Document();


    if(imageToPdf.length>=2) {
      var image = pw.MemoryImage(
        File(imageToPdf[0]).readAsBytesSync(),
      );
      var image1 = pw.MemoryImage(
        File(imageToPdf[1]).readAsBytesSync(),
      );

      double hightImage=PdfPageFormat.a4.height/2.8;



      pw.Widget page =

      pw.Center(
          child:


          pw.Column(

              mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children:

              (!vip) ?

              [

                pw.Image(image,height: hightImage),
                pw.Image(image1,height: hightImage),
                pw.Text("Scan by Pzo Tools  ",
                    textAlign: pw.TextAlign.right,
                    style: const pw.TextStyle(fontSize: 20)),
              ] :

              ///stand

              ///VIP
              [
                pw.Image(image,height: hightImage),
                pw.Image(image1,height: hightImage),

              ]


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