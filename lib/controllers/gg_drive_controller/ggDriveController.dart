

import 'dart:io';

import 'package:vietjet_tool/controllers/apiServiceController.dart';



class GoogleDriveController {
  final String ggUrl = "/google-drive";

  // 📌 Endpoint constants
  final String endPointListFile       = "/listFile";
  final String endPointListFolder     = "/listFolder";
  final String endPointCreateFile     = "/create-file";
  final String endPointCreateFileText = "/create-file-content";
  final String endPointReplaceFile    = "/replace-file";
  final String endPointReplaceContent = "/replace-file-content";
  final String endPointCreateFolder   = "/create-folder";
  final String endPointDownload       = "/download";

  /// 📂 List files
  Future<ApiResult> listFiles({String? name, int? pageSize}) {
    final queryParams = <String, dynamic>{};

    if (name != null && name.isNotEmpty) {
      queryParams['name'] = name;
    }
    if (pageSize != null) {
      queryParams['pageSize'] = pageSize;
    }

    return ApiService().get(endPointListFile, queryParams: queryParams);
  }

  /// 📂 List folders
  Future<ApiResult> listFolders() {
    return ApiService().get(ggUrl + endPointListFolder);
  }

  /// 📄 Create file (upload file multipart)
  Future<ApiResult> createFile(String fileName, String parentFolderId, File file) {
    return ApiService().postMultipart(
      "$ggUrl$endPointCreateFile?parentFolderId=$parentFolderId",
      {"fileName": fileName},
      file,
      fileFieldName: "file",
    );
  }

  /// 📄 Create file from content
  Future<ApiResult> createFileContent(String parentFolderId, String fileName, String content, {String mimeType = "text/plain"}) {
    final body = {
      "fileName": fileName,
      "content": content,
      "mimeType": mimeType,
    };
    return ApiService().post("$ggUrl$endPointCreateFileText/$parentFolderId", data: body);
  }

  /// 🔄 Replace file (upload file multipart)
  Future<ApiResult> replaceFile(String fileId, File file) {
    return ApiService().postMultipart(
      "$ggUrl$endPointReplaceFile/$fileId",
      {},
      file,
      fileFieldName: "file",
    );
  }

  /// 🔄 Replace file content
  Future<ApiResult> replaceFileContent(String fileId, String content, {String? fileName, String? mimeType}) {
    final body = {
      "content": content,
      if (fileName != null) "fileName": fileName,
      if (mimeType != null) "mimeType": mimeType,
    };
    return ApiService().post("$ggUrl$endPointReplaceContent/$fileId", data: body);
  }

  /// 📂 Create folder
  Future<ApiResult> createFolder(String folderName, {String? parentFolderId}) {
    final body = {
      "folderName": folderName,
      if (parentFolderId != null) "parentFolderId": parentFolderId,
    };
    return ApiService().post(ggUrl + endPointCreateFolder, data: body);
  }

  /// 🗑️ Delete file or folder
  Future<ApiResult> deleteFile(String fileId) {
    return ApiService().delete("$ggUrl/$fileId");
  }

  /// ⬇️ Download file
  Future<ApiResult> downloadFile(String fileId) {
    return ApiService().get("$ggUrl$endPointDownload/$fileId");
  }
}



// import 'dart:convert';
// import 'dart:io';
//
// import 'package:googleapis_auth/auth_io.dart';
// import 'package:http/http.dart' as http;
// import 'package:vietjet_tool/common/Constant/constant.dart';
// import 'package:vietjet_tool/common/local_storage/my_storage.dart';
// import 'package:flutter_appauth/flutter_appauth.dart';
//
// class GgDriveController {
//   String clientId =
//       //"804052998891-pup8prl6cj3vlut1lgs9kksv7bp9a7fv.apps.googleusercontent.com";
//
//   "804052998891-f0t4q2rvjr163mbdakfe10s4620k2a0h.apps.googleusercontent.com";
//   String clientSecret = "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";
//   String refreshToken =
//       "1//0gSpRhXVXbTIsCgYIARAAGBASNwF-L9Irw4eGDrtV6aFOZmFg4msZthZ8Ur-vpOsoIBbj-PIIuJjly_Au3rCPpSv5G-6Nb3bsImM";
//
//   final _clientId = ClientId(
//       "804052998891-pup8prl6cj3vlut1lgs9kksv7bp9a7fv.apps.googleusercontent.com",
//       "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");
//   final _scopes = [
//     'https://www.googleapis.com/auth/drive.file'
//   ]; // hoặc drive.readonly, drive
//
//   String fileRefreshTokenId = '17knZQ0FYZmuNwdTnMvUrJvcGsXboNeTT';
//
//   final FlutterAppAuth appAuth = FlutterAppAuth();
//
//   Future<void> getGoogleRefreshToken() async {
//     //const clientId = clientId;
//     const redirectUrl = 'com.toan.tool:/oauth2redirect';
//     const issuer = 'https://accounts.google.com';
//     // const scopes = [
//     //   'openid',
//     //   'email',
//     //   'profile',
//     //   'https://www.googleapis.com/auth/drive.file' // hoặc full drive
//     // ];
//
//     try {
//       final result = await appAuth.authorizeAndExchangeCode(
//         AuthorizationTokenRequest(
//           clientId,
//           redirectUrl,
//           issuer: issuer,
//           scopes: _scopes,
//           promptValues: ['consent','select_account'], // 🔥 bắt buộc để nhận refresh_token
//           // additionalParameters: {
//           //   'prompt': 'select_account', // ⚠️ BẮT BUỘC để chọn lại
//           // },
//         ),
//       );
//
//       if (result != null) {
//         print('✅ Access Token: ${result.accessToken}');
//         print('🔁 Refresh Token: ${result.refreshToken}');
//         print('⏰ Expires At: ${result.accessTokenExpirationDateTime}');
//         // 👉 Lưu refresh_token vào local storage
//       } else {
//         print('❌ Không nhận được token');
//       }
//     } catch (e) {
//       print('⚠️ Lỗi OAuth: $e');
//     }
//   }
//
//
//   Future<AutoRefreshingAuthClient> getAuthenticatedClient() async {
//     return await clientViaUserConsent(_clientId, _scopes, (url) {
//       print("Please go to the following URL and grant access: ");
//       print("  => $url");
//     });
//   }
//
//   Future<String> downloadPublicDriveTextFile({String? fileId}) async {// mac dinh lay refreshToken
//     try {
//       fileId??=fileRefreshTokenId;
//       final url = 'https://drive.google.com/uc?export=download&id=$fileId';
//       final response = await http.get(Uri.parse(url));
//
//       if (response.statusCode == 200) {
//        // final data = json.decode(response.body);
//         return (response.body);
//       } else {
//         return 'error: ${response.statusCode}';
//       }
//     }catch(e){
//       return "error: $e";
//     }
//   }
//
//   Future<String?> getAccessTokenFromRefreshToken() async {
//     final response = await http.post(
//       Uri.parse('https://oauth2.googleapis.com/token'),
//       headers: {'Content-Type': 'application/x-www-form-urlencoded'},
//       body: {
//         'client_id': clientId,
//         'client_secret': clientSecret,
//         'refresh_token': refreshToken,
//         'grant_type': 'refresh_token',
//       },
//     );
//
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       print("$data");
//
//       Map<String, dynamic> token = {
//         "token": data["access_token"],
//         "exp": DateTime.now().add(Duration(seconds: data["expires_in"]))
//       };
//       await MyStorage().setAccessTokenDrive(token);
//
//       return data["access_token"];
//     } else {
//       print('Failed to get access token: ${response.body}');
//       return null;
//     }
//   }
//
//   Future<String?> getAccessToken() async {
//     Map? token = await MyStorage().getAccessTokenDrive();
//     if (token != null) {
//       DateTime exp = token["exp"];
//       if (exp.isAfter(DateTime.now())) {
//         return token["token"].toString();
//       }
//       return await getAccessTokenFromRefreshToken();
//     } else {
//       return await getAccessTokenFromRefreshToken();
//     }
//   }
//
//   Future<String?> getFolderIdByName({required String folderName}) async {
//     String? accessToken = await getAccessToken();
//     if (accessToken == null) {
//       print("accessToken null");
//       return null;
//     }
//     final query =
//         "name = '$folderName' and mimeType = 'application/vnd.google-apps.folder' and trashed = false";
//     final encoded = Uri.encodeQueryComponent(query);
//
//     final uri = Uri.parse(
//         'https://www.googleapis.com/drive/v3/files?q=$encoded&fields=files(id,name)');
//
//     final res = await http.get(uri, headers: {
//       'Authorization': 'Bearer $accessToken',
//     });
//
//     if (res.statusCode == 200) {
//       final files = json.decode(res.body)['files'];
//       if (files != null && files.isNotEmpty) {
//         return files[0]['id'];
//       }
//     }
//
//     return null;
//   }
//
//   Future<String?> getOrCreateFolderId() async {
//     String? accessToken = await getAccessToken();
//     if (accessToken == null) {
//       print("accessToken null");
//       return null;
//     }
//       final query =
//           "name = '${MyConstant.appFolderName}' and mimeType = 'application/vnd.google-apps.folder' and trashed = false";
//     final uri = Uri.parse(
//         'https://www.googleapis.com/drive/v3/files?q=${Uri.encodeComponent(query)}&fields=files(id,name)');
//
//     final res = await http.get(uri, headers: {
//       'Authorization': 'Bearer $accessToken',
//     });
//
//     if (res.statusCode == 200) {
//       final files = json.decode(res.body)['files'];
//       if (files != null && files.isNotEmpty) {
//         return files[0]['id'];
//       }
//     }
//
//     // Chưa có folder → tạo
//     final createRes = await http.post(
//       Uri.parse('https://www.googleapis.com/drive/v3/files'),
//       headers: {
//         'Authorization': 'Bearer $accessToken',
//         'Content-Type': 'application/json',
//       },
//       body: json.encode({
//         'name': MyConstant.appFolderName,
//         'mimeType': 'application/vnd.google-apps.folder',
//       }),
//     );
//
//     if (createRes.statusCode == 200) {
//       return json.decode(createRes.body)['id'];
//     } else {
//       print('❌ Lỗi tạo folder: ${createRes.body}');
//       return null;
//     }
//   }
//
//   Future<String?> getOrCreateFolderIdFromPath(String folderPath) async {
//     String? accessToken = await getAccessToken();
//     if (accessToken == null) {
//       print("❌ accessToken null");
//       return null;
//     }
//
//     List<String> folders = folderPath.split('/');
//     String? parentId = 'root'; // bắt đầu từ thư mục gốc
//
//     for (final folderName in folders) {
//       // Tìm thư mục con trong parent
//       final query =
//           "mimeType = 'application/vnd.google-apps.folder' and name = '$folderName' and '$parentId' in parents and trashed = false";
//
//       final searchUri = Uri.parse(
//           'https://www.googleapis.com/drive/v3/files?q=${Uri.encodeComponent(query)}&fields=files(id,name)');
//
//       final res = await http.get(searchUri, headers: {
//         'Authorization': 'Bearer $accessToken',
//       });
//
//       if (res.statusCode != 200) {
//         print('❌ Lỗi khi tìm folder: ${res.body}');
//         return null;
//       }
//
//       final files = json.decode(res.body)['files'] as List;
//       if (files.isNotEmpty) {
//         parentId = files[0]['id'];
//       } else {
//         // Nếu không có, tạo folder mới trong parent
//         final createUri =
//             Uri.parse('https://www.googleapis.com/drive/v3/files');
//
//         final metadata = {
//           'name': folderName,
//           'mimeType': 'application/vnd.google-apps.folder',
//           'parents': [parentId],
//         };
//
//         final createRes = await http.post(
//           createUri,
//           headers: {
//             'Authorization': 'Bearer $accessToken',
//             'Content-Type': 'application/json',
//           },
//           body: jsonEncode(metadata),
//         );
//
//         if (createRes.statusCode == 200) {
//           final created = json.decode(createRes.body);
//           parentId = created['id'];
//         } else {
//           print('❌ Lỗi khi tạo folder "$folderName": ${createRes.body}');
//           return null;
//         }
//       }
//     }
//
//     return parentId;
//   }
//
//   /// Upload hoặc ghi đè file .txt vào thư mục PzoTool
//
//   Future<void> uploadOrReplaceTextFileInPzoToolFolder({
//     required String pathFileName, //a.txt or a/nnn/bb/a.txt
//     required String content,
//     String? folderSaveId,
//     String? fileSaveId
//   }) async {
//     String? accessToken = await getAccessToken();
//     if (accessToken == null) {
//       print("accessToken null");
//       return;
//     }
//     String fileName = "";
//     String? folderPath;
//     if (pathFileName.contains('/')) {
//       final parts = pathFileName.split('/');
//       fileName = parts.last;
//       folderPath = parts.sublist(0, parts.length - 1).join('/');
//     } else {
//       fileName = pathFileName;
//     }
//
//     final folderId = folderSaveId ??
//         (folderPath != null
//             ? await getOrCreateFolderIdFromPath(folderPath)
//             : await getOrCreateFolderId());
//     if (folderId == null) {
//       print('❌ Không tìm được folder PzoTool');
//       return;
//     }
//
//
//
//     // // Bước 1: Tìm file trùng tên trong folder
//     // final query =
//     //     "name = '$fileName' and '$folderId' in parents and trashed = false";
//     // final searchUri = Uri.parse(
//     //     'https://www.googleapis.com/drive/v3/files?q=${Uri.encodeComponent(query)}&fields=files(id,name)');
//     //
//     // final searchRes = await http.get(searchUri, headers: {
//     //   'Authorization': 'Bearer $accessToken',
//     // });
//     //
//     // String method = 'POST';
//     // Uri uploadUri = Uri.parse(
//     //     'https://www.googleapis.com/upload/drive/v3/files?uploadType=multipart');
//     // var metadata = {
//     //   'name': fileName,
//     //   'mimeType': 'text/plain',
//     //   'parents': [folderId],
//     // };
//     //
//     // if (searchRes.statusCode == 200) {
//     //   final files = json.decode(searchRes.body)['files'];
//     //   if (files.isNotEmpty) {
//     //     final fileId = files[0]['id'];
//     //     method = 'PATCH';
//     //     metadata = {
//     //       'name': fileName,
//     //       'mimeType': 'text/plain',
//     //     };
//     //
//     //     uploadUri = Uri.parse(
//     //         'https://www.googleapis.com/upload/drive/v3/files/$fileId?uploadType=multipart&addParents=$folderId');
//     //   }
//     // }
//
//
//
//
//
//     String method = 'POST';
//     Uri uploadUri = Uri.parse(
//         'https://www.googleapis.com/upload/drive/v3/files?uploadType=multipart');
//     var metadata = {
//       'name': fileName,
//       'mimeType': 'text/plain',
//       'parents': [folderId],
//     };
//     if(fileSaveId!=null){
//       final fileId = fileSaveId;
//       method = 'PATCH';
//       metadata = {
//         'name': fileName,
//         'mimeType': 'text/plain',
//       };
//
//       uploadUri = Uri.parse(
//           'https://www.googleapis.com/upload/drive/v3/files/$fileId?uploadType=multipart&addParents=$folderId');
//     }
//
//
//
//
//     final body = '''
// --boundary
// Content-Type: application/json; charset=UTF-8
//
// ${jsonEncode(metadata)}
// --boundary
// Content-Type: text/plain
//
// $content
// --boundary--
// ''';
//
//     final req = http.Request(method, uploadUri)
//       ..headers['Authorization'] = 'Bearer $accessToken'
//       ..headers['Content-Type'] = 'multipart/related; boundary=boundary'
//       ..body = body;
//
//     final streamed = await req.send();
//     final respBody = await streamed.stream.bytesToString();
//
//     if (streamed.statusCode == 200) {
//       print('✅ Upload/Ghi đè thành công!');
//     } else {
//       print('❌ Lỗi upload: ${streamed.statusCode} - $respBody');
//     }
//   }
//
//   Future<String?> getFileIdByName({
//     required String fileName,
//   }) async {
//     String? accessToken = await getAccessToken();
//     if (accessToken == null) {
//       print("accessToken null");
//       return null;
//     }
//     final encodedName =
//         Uri.encodeFull("name = '$fileName' and trashed = false");
//     final uri = Uri.parse(
//       'https://www.googleapis.com/drive/v3/files?q=$encodedName&fields=files(id,name)',
//     );
//
//     final response = await http.get(
//       uri,
//       headers: {'Authorization': 'Bearer $accessToken'},
//     );
//
//     if (response.statusCode == 200) {
//       final files = json.decode(response.body)['files'];
//       if (files.isNotEmpty) {
//         return files[0]['id'];
//       } else {
//         print('⚠️ Không tìm thấy file: $fileName');
//         return null;
//       }
//     } else {
//       print('❌ Lỗi khi tìm fileId: ${response.body}');
//       return null;
//     }
//   }
//
//   Future<String?> readTextFileFromDrive(
//       {String? fileId, String? fileName}) async {
//     String? accessToken = await getAccessToken();
//     if (accessToken == null) {
//       print("accessToken null");
//       return null;
//     }
//     if (fileId == null) {
//       if (fileName != null) {
//         fileId = await getFileIdByName(fileName: fileName);
//       } else {
//         return null;
//       }
//     }
//
//     final uri = Uri.parse(
//         'https://www.googleapis.com/drive/v3/files/$fileId?alt=media');
//
//     final response = await http.get(
//       uri,
//       headers: {'Authorization': 'Bearer $accessToken'},
//     );
//
//     if (response.statusCode == 200) {
//       return response.body; // Nội dung file dạng text
//     } else {
//       print('❌ Lỗi đọc file: ${response.statusCode} - ${response.body}');
//       return null;
//     }
//   }
//
//   Future<void> uploadFileToDrive(File file) async {
//     String? accessToken = await getAccessToken();
//     if (accessToken == null) {
//       print("accessToken null");
//       return;
//     }
//
//     final uri = Uri.parse(
//         'https://www.googleapis.com/upload/drive/v3/files?uploadType=multipart');
//     final fileBytes = await file.readAsBytes();
//     final fileName = file.path.split('/').last;
//
//     final request = http.MultipartRequest('POST', uri)
//       ..headers['Authorization'] = 'Bearer $accessToken'
//       ..fields['metadata'] = jsonEncode({'name': fileName})
//       ..files.add(http.MultipartFile.fromBytes(
//         'file',
//         fileBytes,
//         filename: fileName,
//       ));
//
//     final response = await request.send();
//     final body = await response.stream.bytesToString();
//
//     if (response.statusCode == 200) {
//       print('Upload thành công: $body');
//     } else {
//       print('Upload lỗi: $body');
//     }
//   }
//
//   Future<void> listFiles() async {
//     String? accessToken = await getAccessToken();
//     if (accessToken == null) {
//       print("accessToken null");
//       return;
//     }
//     final response = await http.get(
//       Uri.parse('https://www.googleapis.com/drive/v3/files'),
//       headers: {'Authorization': 'Bearer $accessToken'},
//     );
//
//     if (response.statusCode == 200) {
//       final files = json.decode(response.body)['files'];
//       for (var file in files) {
//         print('${file['name']} (${file['id']})');
//       }
//     } else {
//       print('Lỗi khi lấy danh sách file: ${response.body}');
//     }
//   }
//
//   Future<void> downloadFile(String fileId, String savePath) async {
//     String? accessToken = await getAccessToken();
//     if (accessToken == null) {
//       print("accessToken null");
//       return;
//     }
//     final uri = Uri.parse(
//         'https://www.googleapis.com/drive/v3/files/$fileId?alt=media');
//     final response = await http.get(
//       uri,
//       headers: {'Authorization': 'Bearer $accessToken'},
//     );
//
//     if (response.statusCode == 200) {
//       final file = File(savePath);
//       await file.writeAsBytes(response.bodyBytes);
//       print('Tải thành công: $savePath');
//     } else {
//       print('Lỗi khi tải file: ${response.body}');
//     }
//   }
//
//   Future<void> uploadOrReplaceFile(File file) async {
//     String? accessToken = await getAccessToken();
//     if (accessToken == null) {
//       print("accessToken null");
//       return;
//     }
//
//     final fileName = file.path.split('/').last;
//
//     // Bước 1: Tìm file cũ trùng tên
//     final searchUri = Uri.parse(
//       'https://www.googleapis.com/drive/v3/files?q=name=%27$fileName%27 and trashed=false&fields=files(id,name)',
//     );
//
//     final searchRes = await http.get(
//       searchUri,
//       headers: {'Authorization': 'Bearer $accessToken'},
//     );
//
//     final fileBytes = await file.readAsBytes();
//     final metadata = {'name': fileName};
//
//     if (searchRes.statusCode == 200) {
//       final files = json.decode(searchRes.body)['files'];
//       if (files.isNotEmpty) {
//         // ✅ Đã có file trùng tên → ghi đè bằng PATCH
//         final fileId = files[0]['id'];
//         final uri = Uri.parse(
//             'https://www.googleapis.com/upload/drive/v3/files/$fileId?uploadType=multipart');
//
//         final request = http.MultipartRequest('PATCH', uri)
//           ..headers['Authorization'] = 'Bearer $accessToken'
//           ..fields['metadata'] = jsonEncode(metadata)
//           ..files.add(http.MultipartFile.fromBytes(
//             'file',
//             fileBytes,
//             filename: fileName,
//           ));
//
//         final res = await request.send();
//         final body = await res.stream.bytesToString();
//
//         if (res.statusCode == 200) {
//           print('✅ Ghi đè file thành công!');
//         } else {
//           print('❌ Ghi đè lỗi: $body');
//         }
//       } else {
//         // ✅ Không có file cũ → tạo mới
//         final uri = Uri.parse(
//             'https://www.googleapis.com/upload/drive/v3/files?uploadType=multipart');
//
//         final request = http.MultipartRequest('POST', uri)
//           ..headers['Authorization'] = 'Bearer $accessToken'
//           ..fields['metadata'] = jsonEncode(metadata)
//           ..files.add(http.MultipartFile.fromBytes(
//             'file',
//             fileBytes,
//             filename: fileName,
//           ));
//
//         final res = await request.send();
//         final body = await res.stream.bytesToString();
//
//         if (res.statusCode == 200) {
//           print('✅ Upload mới thành công!');
//         } else {
//           print('❌ Upload lỗi: $body');
//         }
//       }
//     } else {
//       print('❌ Lỗi khi tìm file cũ: ${searchRes.body}');
//     }
//   }
// }
