import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:vietjet_tool/common/localizations/appLocalizations.dart';
import 'package:vietjet_tool/common/template/my_page.dart';
import 'package:vietjet_tool/controllers/my_controller.dart';
import 'package:vietjet_tool/controllers/provider/provider.dart';
import 'package:vietjet_tool/ui/home/my_home.dart';
import 'package:vietjet_tool/ui/question/question.dart';
import 'package:vietjet_tool/ui/setting/setting_screen.dart';
import 'package:vietjet_tool/ui/time_utc_screen/time_utc.dart';
import 'package:vietjet_tool/widgets/MyListtitle/list_title.dart';
import 'package:vietjet_tool/widgets/dialog/dialogs.dart';

enum MyViewState { loadingAll, loading, loaded, error }

abstract class MyState<W extends StatefulWidget> extends State<W> {
  String title = "";
  MyViewState myViewState = MyViewState.loadingAll;
  late MyController controller;
  bool dataLoading = true;
  String errorStr = "";
  bool drawer = false;
  Widget? bottomNavigationBar;
  String bottomNavigationBarStr = "";
  List<Widget>? actionMenu;



  Widget? floatButton;
  FloatingActionButtonLocation? floatButtonLocation;

  String setTitle();
  Widget setBody();

  MyController createController();

  Future<void> afterLoadData() async {}
  Future<void> beforeLoadData() async {}

  bool actionBack=false;
  Future<bool> backFunction()async {
    return false;

  }




  @override
  void initState() {
    title = setTitle();
    controller = createController();
    super.initState();
    if (dataLoading != false) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        try {
          await beforeLoadData();
          await controller.loadData();
          await afterLoadData();
          setState(() {
            myViewState = MyViewState.loaded;
          });
        } catch (e) {
          setState(() {
            myViewState = MyViewState.error;
            errorStr = e.toString();
          });
        }
      });
    }
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  Widget loadingAllPage() {
    return Scaffold(
        body: Center(
      child: LoadingAnimationWidget.twistingDots(
        leftDotColor: Theme.of(context).colorScheme.primary,
        rightDotColor: Theme.of(context).colorScheme.secondary,
        size: 200,
      ),
    ));
  }

  Widget loadingPage() {
    return Scaffold(
        body: Center(
      child: LoadingAnimationWidget.twistingDots(
        leftDotColor: Theme.of(context).colorScheme.primary,
        rightDotColor: Theme.of(context).colorScheme.onPrimary,
        size: 200,
      ),
    ));
  }

  Widget drawerMenu() {
    return Drawer(
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: const Icon(Icons.ac_unit_outlined, size: 200),
          ),
          MyListTitle(
              context: context,
              iconMenu:  Icon(Icons.home,
              color: Theme.of(context).colorScheme.primary
              ),
              title: AppLocalizations.of(context).translate("Home"),
              type: TypeListTitle.menu,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHome(),));
              },
              colorText: Theme.of(context).colorScheme.primary),
          MyListTitle(
              context: context,
              iconMenu:  Icon(Icons.settings,
                  color: Theme.of(context).colorScheme.primary
              ),
              title: AppLocalizations.of(context).translate("Setting"),
              type: TypeListTitle.menu,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingScreen(),));
              },
              colorText: Theme.of(context).colorScheme.primary),
          MyListTitle(
              context: context,
              iconMenu:  Icon(Icons.logout,
                  color: Theme.of(context).colorScheme.primary
              ),
              title: AppLocalizations.of(context).translate("Logout"),
              type: TypeListTitle.menu,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHome(),));
              },
              colorText: Theme.of(context).colorScheme.primary),
          MyListTitle(
              context: context,
              iconMenu:  Icon(Icons.question_mark,
                  color: Theme.of(context).colorScheme.primary
              ),
              title: AppLocalizations.of(context).translate("Question"),
              type: TypeListTitle.menu,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const QuestionScreen(typePage: TypePage.isTypeQuestions),));
              },
              colorText: Theme.of(context).colorScheme.primary),
          MyListTitle(
              context: context,
              iconMenu:  Icon(Icons.question_mark,
                  color: Theme.of(context).colorScheme.primary
              ),
              title: AppLocalizations.of(context).translate("EditQuestion"),
              type: TypeListTitle.menu,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const QuestionScreen( edit: true,typePage: TypePage.isTypeQuestions),));
              },
              colorText: Theme.of(context).colorScheme.primary),
        ],
      ),
    );
  }

  Widget loadedPage() {
    Widget child=Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: drawer ? drawerMenu() : null,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(AppLocalizations.of(context).translate(title)),
        actions: actionMenu,
      ),
      floatingActionButton: floatButton,
      floatingActionButtonLocation: floatButtonLocation,
      body: setBody(),
      bottomNavigationBar: bottomNavigationBar ??
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: const TimeUTC(),

            //Text(context.watch<ChangeTimeUtc>().time, textAlign: TextAlign.center,style: TextStyle(color: Theme.of(context).colorScheme.primary)),
          ),
    );
    return actionBack?
    WillPopScope(
      child: child,
      onWillPop:() async =>backFunction(),

    ):child;


  }

  Widget errorPage(String error) {
    return MyAlertDialog(title: "loi", message: errorStr, action: "ok");

    // Scaffold(
    //   body: Center(
    //     child: LoadingAnimationWidget.twistingDots(
    //       leftDotColor: Theme.of(context).colorScheme.primary,
    //       rightDotColor: Theme.of(context).colorScheme.onPrimary,
    //       size: 200,
    //     ),
    //   ));
  }

  @override
  Widget build(BuildContext context) {
    switch (myViewState) {
      case MyViewState.loadingAll:
        return loadingPage();
      case MyViewState.loaded:
        return loadedPage();
      case MyViewState.error:
        return errorPage(errorStr);
      default:
        return loadingPage();
    }
  }
}
