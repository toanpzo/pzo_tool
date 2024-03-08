import 'package:flutter/material.dart';
import 'package:vietjet_tool/common/template/my_state.dart';
import 'package:vietjet_tool/controllers/my_controller.dart';
import 'package:vietjet_tool/ui/test/test_controller.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  MyState createState() => _TestScreenState();
}

class _TestScreenState extends MyState<TestScreen> {
  @override
  MyController createController() {
    return TestController(this);
  }

  @override
  Widget setBody() {
   return Container();
  }

  @override
  String setTitle() {
    return "test";
  }

}