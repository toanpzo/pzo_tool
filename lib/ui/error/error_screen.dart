
import 'package:flutter/material.dart';
import 'package:vietjet_tool/common/template/my_page.dart';

class ErrorScreen extends StatelessWidget {
  final String errorStr;
   const ErrorScreen({super.key, required this.errorStr});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(errorStr),
      ),
    );
  }
}
