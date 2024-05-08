import 'dart:convert';
import 'dart:io';

import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/servicemanagement/v1.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vietjet_tool/common/Constant/constant.dart';
import 'package:http/http.dart' as http;

class PhotosController {

   List<String>  _scopes = [
    'https://www.googleapis.com/auth/photoslibrary'
  ];

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
     //clientId: keyUploadPhotoAndroid,
    //scopes: <String>[PeopleServiceApi.contactsReadonlyScope],
    //serverClientId: keyUploadPhotoAndroid,
    // scopes: <String>[
    //
    //   //'https://www.googleapis.com/auth/photoslibrary'
    // ],

  );

  String? getKeyApi(){
    String? apiKey;
    if(Platform.isIOS){
      apiKey=MyConstant.keyUploadPhotoIOS;
    }else if(Platform.isAndroid){
      apiKey=MyConstant.keyUploadPhotoAndroid;
    }else{

    }

    return apiKey;
  }

  // final GoogleSignIn _googleSignIn = GoogleSignIn(
  //   // Optional clientId
  //    clientId: keyUploadPhotoAndroid,
  //   scopes: <String>['https://www.googleapis.com/auth/photoslibrary'],
  // );






  Future<AuthClient?> getHttpClient() async {
    String keyApiGGPhoto="";
    if(Platform.isIOS){
      keyApiGGPhoto=MyConstant.keyUploadPhotoIOS;
    }else if(Platform.isAndroid){
      keyApiGGPhoto=MyConstant.keyUploadPhotoAndroid;
    }else{

    }
    await _googleSignIn.signOut();
    //await _googleSignIn.signInSilently();
    await _googleSignIn.canAccessScopes(['https://www.googleapis.com/auth/photoslibrary'],accessToken: MyConstant.keyUploadPhotoAndroid);








    //httpClient.post(url)
    print("a");


    AuthClient? client = await _googleSignIn.authenticatedClient();
print("b");
    // AuthClient authClient =
    //
    //
    // await clientViaUserConsent(ClientId(keyApiGGPhoto), _scopes, _userPrompt).catchError((e) => print(e));
     return client;
  }

  // Future<AuthClient> obtainAuthenticatedClient() async {
  //   final flow = await createImplicitBrowserFlow(
  //     ClientId('....apps.googleusercontent.com'),
  //     ['scope1', 'scope2'],
  //   );
  //
  //   try {
  //     return await flow.clientViaUserConsent();
  //   } finally {
  //     flow.close();
  //   }
  // }

  upload(File file) async {

    //var client = http.Client();
    // try {
    //   var response = await client.post(
    //       Uri.https('example.com', 'whatsit/create'),
    //       body: {'name': 'doodle', 'color': 'blue'});
    //   var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    //   var uri = Uri.parse(decodedResponse['uri'] as String);
    //   print(await client.get(uri));
    // } finally {
    //   client.close();
    // }




    AuthClient? client = await getHttpClient();

    //var client = http.Client();

    if(client!=null) {
      var tokenResult = await client.post(
        Uri.parse('https://photoslibrary.googleapis.com/v1/uploads'),
        headers: {
          'Content-type': 'application/octet-stream',
          'X-Goog-Upload-Content-Type': 'image/png',
          'X-Goog-Upload-Protocol': 'raw'
        },
        body: file.readAsBytesSync(),
      );
      print(tokenResult);
      var res = await client.post(
        Uri.parse(
            'https://photoslibrary.googleapis.com/v1/mediaItems:batchCreate'),
        headers: {'Content-type': 'application/json'},
        body: jsonEncode({
          "newMediaItems": [
            {
              "description": "item-description",
              "simpleMediaItem": {
                "fileName": "flutter-photos-upload",
                "uploadToken": tokenResult.body,
              }
            }
          ]
        }),
      );
      print(res.body);
    }
      await _googleSignIn.signOut();





  }

  _userPrompt(String url) {
    print(url);
    launchUrl(Uri.parse(url));
    //launch(url);
  }
}