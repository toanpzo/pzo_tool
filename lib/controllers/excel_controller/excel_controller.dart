import 'dart:io';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';


class ExcelController {


  Future<List<int>> generateRosterExcel({
    required DateTime date,
    required List<String> shifts,
    required List<Map<String, String>> rosterData,
  }) async {
    final excel = Excel.createExcel();
    final sheet = excel['Roster'];

    // Tiêu đề
    final title = "Lịch làm việc ca ${shifts.join(", ")} ngày ${date.day}/${date.month}/${date.year}";
    sheet.merge(CellIndex.indexByString("A1"), CellIndex.indexByString("C1"));
    sheet.cell(CellIndex.indexByString("A1")).value = TextCellValue(title);

    // Header
    sheet.cell(CellIndex.indexByString("A2")).value = TextCellValue("Tên");
    sheet.cell(CellIndex.indexByString("B2")).value = TextCellValue("Chức danh");
    sheet.cell(CellIndex.indexByString("C2")).value = TextCellValue("Ca làm việc");

    // Data
    for (int i = 0; i < rosterData.length; i++) {
      final row = i + 3;
      sheet.cell(CellIndex.indexByString("A$row")).value =
          TextCellValue(rosterData[i]["name"] ?? "");
      sheet.cell(CellIndex.indexByString("B$row")).value =
          TextCellValue(rosterData[i]["role"] ?? "");
      sheet.cell(CellIndex.indexByString("C$row")).value =
          TextCellValue(rosterData[i]["shift"] ?? "");
    }

    //final dir = await getApplicationDocumentsDirectory();
    //final file = File("${dir.path}/roster_${date.toIso8601String()}.xlsx");
    //file.writeAsBytesSync(excel.encode()!);
    return excel.encode()??[];
    //return file;
  }

  Future<List<Map<String, String>>> getRosterForDate({
       required FilePickerResult? filePicker, required DateTime date,required List<String> shifts, List<String>? roles,
  int? rowStart,int? rowEnd
  }) async {

    Uint8List? fileBytes = filePicker?.files.single.bytes;
    String? fileName = filePicker?.files.single.name;
    String? filePath = filePicker?.files.single.path;

    // Nếu không có bytes thì đọc từ path
    if (fileBytes == null && filePath != null) {
      fileBytes = await File(filePath).readAsBytes();
    }

    if (fileBytes == null) {
      print("Không đọc được file Excel");
      return [];
    }

      final excel = Excel.decodeBytes(fileBytes,);
    //Excel.decodeBytes(fileBytes);
      print("Đọc thành công file: $fileName");

      // ví dụ lấy sheet đầu tiên
      final firstSheet = excel.tables.keys.first;
      final sheet = excel.tables[firstSheet];
      if (sheet == null) return [];





    final results = <Map<String, String>>[];

    // Tìm cột ứng với ngày cần lọc
    int? dateColumnIndex;
    final headerRow = sheet.rows[8]; //loc lay ngay
    for (int col = 0; col < headerRow.length; col++) {
      final cellValue = headerRow[col]?.value??-1;
      if (cellValue is int && cellValue!=-1)
           {
             DateTime colDate= DateTime(1900, 1, 1).add(Duration(days: cellValue));
             print(colDate);

             if(DateFormat('dd/MM/yyyy').format(colDate)==DateFormat('dd/MM/yyyy').format(date)){
               dateColumnIndex = col;
               break;
             }


      }
    }

    if (dateColumnIndex == null) {
      print("Không tìm thấy ngày trong sheet");
      return [];
    }

    // Lấy dữ liệu từ dòng 18 → 29 (index 17 → 28)
    for (int i = rowStart?? 150; i <= (rowEnd ?? 307); i++) {
      final row = sheet.rows[i];
      final row1 = sheet.rows[i+1];
      if (row.isEmpty) continue;

      final name = row[2]?.value; // cột C
      final role = row[3]?.value; // cột D
      final shift = row[dateColumnIndex]?.value; // cột ứng với ngày
      final shift1 = row1[dateColumnIndex]?.value; // cột ứng với ngày

      if (name != null && role != null && shift != null) {
        if(shifts.contains(shift.toString().trim())&&(shift1.toString().trim()==""||shift1==null)){
          if(roles!=null){
            if(roles.contains(role.toString().trim())){
              results.add({
                "name": name.toString(),
                "role": role.toString(),
                "shift": shift.toString(),
              });
            }
          }else{
            results.add({
              "name": name.toString(),
              "role": role.toString(),
              "shift": shift.toString(),
            });
          }

        }

      }
    }

    return results;
  }


}
