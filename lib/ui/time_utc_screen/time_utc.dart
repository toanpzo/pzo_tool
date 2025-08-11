
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vietjet_tool/controllers/provider/provider.dart';

class TimeUTC extends StatefulWidget {
  const TimeUTC({super.key});

  @override
  State<TimeUTC> createState() => _TimeUTCState();
}

class _TimeUTCState extends State<TimeUTC> {
  String time="";
  DateFormat dateFormat = DateFormat("dd/MM/yyyy H:mm:ss");

  // Timer scheduleTimeout([int milliseconds = 10000]) =>
  //     Timer(Duration(milliseconds: milliseconds), handleTimeout);
  //
  // void handleTimeout() {
  //   time="UTC: ${dateFormat.format(DateTime.now().toUtc())}";
  //   setState(() {
  //
  //   });
  //
  // }



  late Timer _timer;
  late DateTime _now;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        _now = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //time="UTC: ${dateFormat.format(DateTime.now().toUtc())}";
    time="UTC: ${dateFormat.format(_now.toUtc())}";

    //scheduleTimeout(1000*5);
    return Text(time,
    style: TextStyle(color: Theme.of(context).colorScheme.primary,
    ),
      textAlign: TextAlign.center,
    );
  }
}
