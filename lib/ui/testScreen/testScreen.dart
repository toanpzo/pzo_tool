import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:vietjet_tool/controllers/ggPhotoController/ggPhoto_controller.dart';
import 'package:vietjet_tool/models/questions/anwser/answer.dart';

class UploadPhotoScreen extends StatefulWidget {
  const UploadPhotoScreen({Key? key}) : super(key: key);

  @override
  _UploadPhotoScreenState createState() => _UploadPhotoScreenState();
}

class _UploadPhotoScreenState extends State<UploadPhotoScreen> {

  Answer answer=Answer(text: "text");

  bool loading = false;
  pickAndUploadFile() async {
    loading = true;
    setState(() {});
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);

    if(result != null) {
      File file = File(result.files.single.path!);
      await PhotosController().upload(file);
      loading = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Photos upload')),
      body: Center(
        child: loading
            ? const CircularProgressIndicator()
            : TextButton(
          onPressed: () => pickAndUploadFile(),
          child: const Text('Upload Image'),
        ),
      ),
    );
  }
}