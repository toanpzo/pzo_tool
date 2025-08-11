
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';
class Dropboxcontroller{

  String appkey="4fjsc2047d6jpl5";
  String appSecret="8okph5ig4hakq0e";
  String accessToken="sl.u.AF2D-Uadq3S_U91NRWKQnXrkrQYVyRAGGWR4pGjk6UtJoaj5_PpRvHltvmtTslN8XQpeDNSQrxkoaqzwSvzhcHL7h0Xj1mv5-Ldry3u9crsvqPi1KWn2suLiFc0wqGYAi0CFBYFAlBKT4wtKBsOY3vcgrw_Ug9ePKmEdKY3htiVNXSJH0esaOU-TogxYOCBvNEqcAmfUbfJJk9uIe_PqPqDq9il6jZx8c0wBPAfEMkI_haSrQ95YSpmCQFl2uTGb4kMXYLSAoDh84FDBeyDz-lJu6mUHmBRTVTjkFTgf-Bm4z06HwWsvIlHp1tqRQQoUNx1f1shmX9YWvOZdujeMWk9oFXCPiMIRdyjBKM8njxsyye30Q7Qq2IRXuO3h4hLZjJuwXvumU6pxHCQYpoEwts9KzfW0KfdCMZ61QpD7Nl_BOmyq5YwNbx3PJcOUVZutenLJuOG12J6WNu3NVfZmWU_7TzXbUnbY4OjJejjIsdeNIRJ1oDcByhp8GSSqV0QnlI_qyuVbNEcUj59BpB8cgCYp49MSYYjK1aqbUHPXClp10butI62dTBEi7uT5hw9rBpS5jxE9ooie1hzEFAcvaKVpTS25fY0fHLMngzVxzJkL3JYDgImpsW3xH0hfNe5g-Fm9aMbg2J9eMK3u12XZGzS-gpvRcbE4hDWJKxgZU4nbl9Sjd7ZR5kLOsoZQEYWympISs9GNGs1yATRwoaOdIvR77Z38REGJdDeoZ2z95ftmNeRHXTue_nS1eDHJ0OafwZpW9JSa9xPETKvqy5H1YHXF9izp7YjpA-AKTKn1H4eWim5xjkDOZu-9C54srVsq5W4PvTKYdBiEtAqxMgH5fC2MIqAsk_G8r5b79GiIUS3gEQP1z-_qG0p1Fxy2NSqYddF1JRZpm1BX7_ZIfCxwLIyAdNkysNnv_8zfGloPQEVeYh7l06Oj6sbqovkRa16jvyxTkKhnD4UA8LdRHukILFltl6B8jshgiJ4WMzsAOCMGJpTS0O3n8zgHe_P7DwmDL1QhcCNUjiJHGuJzAQzQMBtZBG9wqfUpW70-XMoq7T1uHd3jX77B6wVcHUzhO7D2iVme9m1w5LmDoWx-u7pAXypc9fgjV4HSzfB8EqJSzlux7L5G-KShlipWVMqvAGJt1nIwgEXM5mVXcS0zH57OYDcfVQlAXbsvMlmAyZFWfsXsMobhMO21u9ntK4h4L_ZrEvVJr4_VYE1cfLpnAJz45QH3MXKlLuFiUuTjQReNSqLeFRYu3XSHJNQ8OEtf2JVdnAAUK51y7i55HfMhbsCQjUYUMGUY5QuZ4GrukuJf_AG_RJ3fWunbWTQqmqai3wkeLgHVqhwMYfSRzQMDMyMirt6hTyIZyE7n2cJr4a9fCS8eAFmqbmdPTdHNda6gsRkzHqBtdePcDiJc3K5C4q3XZhAbTLX2qU_XdYRqpJ7YLq50DQ";

  Future<void> uploadFileToDropbox({ required String content,required String dropboxPath,bool? overwrite}) async {
    final bytes = utf8.encode(content); // Chuyển nội dung string sang bytes

    final response = await http.post(
      Uri.parse('https://content.dropboxapi.com/2/files/upload'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Dropbox-API-Arg': jsonEncode({
          "path": dropboxPath,// vi du: /chinh, /chinh/a
          "mode":overwrite==true? "overwrite":"add",  // Ghi đè nếu đã tồn tại
          "autorename": overwrite??false,
          "mute": false,
        }),
        'Content-Type': 'application/octet-stream',
      },
      body: bytes,
    );

    if (response.statusCode == 200) {
      print('✅ Upload thành công!');
    } else {
      print('❌ Upload lỗi: ${response.statusCode} - ${response.body}');
    }
  }
  Future<void> downloadFileFromDropbox({required String dropboxPath}) async {
    final response = await http.post(
      Uri.parse('https://content.dropboxapi.com/2/files/download'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Dropbox-API-Arg': jsonEncode({
          "path": dropboxPath,
        }),
      },
    );

    if (response.statusCode == 200) {
      String content = utf8.decode(response.bodyBytes);
      print('✅ Nội dung file: $content');
    } else {
      print('❌ Download lỗi: ${response.statusCode} - ${response.body}');
    }
  }
  Future<String?> readFileContent({required String dropboxPath}) async {
    final response = await http.post(
      Uri.parse('https://content.dropboxapi.com/2/files/download'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Dropbox-API-Arg': jsonEncode({
          "path": dropboxPath,
        }),
      },
    );

    if (response.statusCode == 200) {
      return utf8.decode(response.bodyBytes);
    } else {
      print('❌ Không đọc được file: ${response.statusCode}');
      return null;
    }
  }
  Future<void> deleteDropboxFile({
    required String dropboxPath,
  }) async {
    final response = await http.post(
      Uri.parse('https://api.dropboxapi.com/2/files/delete_v2'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "path": dropboxPath,
      }),
    );

    if (response.statusCode == 200) {
      print('✅ Đã xóa: $dropboxPath');
    } else {
      print('❌ Lỗi xóa: ${response.statusCode} - ${response.body}');
    }
  }
  Future<void> listDropboxFolder({
    required String dropboxPath,
  }) async {
    final response = await http.post(
      Uri.parse('https://api.dropboxapi.com/2/files/list_folder'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "path": dropboxPath,
      }),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final entries = jsonResponse['entries'] as List;

      for (var entry in entries) {
        print('📄 ${entry['name']} - Type: ${entry[".tag"]}');
      }
    } else {
      print('❌ Lỗi list folder: ${response.statusCode} - ${response.body}');
    }
  }

  Future<void> createDropboxFolder({
    required String dropboxPath,
  }) async {
    final response = await http.post(
      Uri.parse('https://api.dropboxapi.com/2/files/create_folder_v2'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "path": dropboxPath,
        "autorename": true,
      }),
    );

    if (response.statusCode == 200) {
      print('✅ Đã tạo folder: $dropboxPath');
    } else {
      print('❌ Lỗi tạo folder: ${response.statusCode} - ${response.body}');
    }
  }

  Future<void> getDropboxFileMetadata({
    required String dropboxPath,
  }) async {
    final response = await http.post(
      Uri.parse('https://api.dropboxapi.com/2/files/get_metadata'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "path": dropboxPath,
      }),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      print('✅ Metadata cho $dropboxPath:');
      print(jsonEncode(jsonResponse));
    } else {
      print('❌ Lỗi metadata: ${response.statusCode} - ${response.body}');
    }
  }




/// getMeta rev

  Future<void> listFileRevisions({
    required String dropboxPath,
  }) async {
    final response = await http.post(
      Uri.parse('https://api.dropboxapi.com/2/files/list_revisions'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "path": dropboxPath,
        "limit": 10,  // ✅ Số bản revision muốn lấy
      }),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final revisions = jsonResponse['entries'] as List;

      for (var rev in revisions) {
        print('📌 Rev: ${rev["rev"]} - Modified: ${rev["server_modified"]}');
      }
    } else {
      print('❌ Lỗi lấy revision: ${response.statusCode} - ${response.body}');
    }
  }

  Future<void> restoreDropboxFileToRevision({
    required String dropboxPath,
    required String rev,
  }) async {
    final response = await http.post(
      Uri.parse('https://api.dropboxapi.com/2/files/restore'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "path": dropboxPath,
        "rev": rev,
      }),
    );

    if (response.statusCode == 200) {
      print('✅ Rollback thành công: $dropboxPath về rev: $rev');
    } else {
      print('❌ Lỗi rollback: ${response.statusCode} - ${response.body}');
    }
  }

}