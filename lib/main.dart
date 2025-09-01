//import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vietjet_tool/common/local_storage/my_storage.dart';
import 'package:vietjet_tool/common/template/my_state.dart';
import 'package:vietjet_tool/controllers/provider/provider.dart';
import 'package:vietjet_tool/models/fuel/fuel.dart';
import 'package:vietjet_tool/models/person/person.dart';
import 'package:vietjet_tool/models/questions/question/question.dart';
import 'package:vietjet_tool/models/questions/save_score/save_score.dart';
import 'package:vietjet_tool/models/questions/type_question/type_question.dart';
import 'package:vietjet_tool/models/questions/wrong_question/wrong_question.dart';
import 'package:vietjet_tool/models/theme_models/my_color_scheme.dart';
import 'package:vietjet_tool/models/version/version.dart';
import 'package:vietjet_tool/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:vietjet_tool/ui/splash/splash_controller.dart';
import 'package:vietjet_tool/ui/splash/splash_screen.dart';

import 'common/Constant/constant.dart';
import 'common/localizations/appLocalizations.dart';
import 'common/router/my_router.dart';
import 'controllers/apiServiceController.dart';
import 'models/questions/anwser/answer.dart';
import 'models/questions/bank_question/bank_question.dart';
import 'models/theme_models/my_theme.dart';
import 'models/user/my_user.dart';

final navigatorKey = GlobalKey<NavigatorState>();


void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  String path = "/assets/data";

  if(kIsWeb){

  }else{
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    path=appDocumentDirectory.path;
  }




  Hive.init(path);
  Hive.registerAdapter(PersonAdapter());
  Hive.registerAdapter(FuelAdapter());
  Hive.registerAdapter(MyThemeAdapter());
  Hive.registerAdapter(MyColorSchemeAdapter());

  Hive.registerAdapter(TypeQuestionAdapter());
  Hive.registerAdapter(BankQuestionAdapter());
  Hive.registerAdapter(QuestionAdapter());
  Hive.registerAdapter(AnswerAdapter());
  Hive.registerAdapter(WrongQuestionAdapter());
  Hive.registerAdapter(SaveScoreAdapter());
  Hive.registerAdapter(MyUserAdapter());
  Hive.registerAdapter(VersionAdapter());
  //Hive.registerAdapter(Wrong)

  //typeid 10







  runApp(

    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChangeTheme()),
        ChangeNotifierProvider(create: (_) => ChangeTimeUtc()),
        Provider<SplashController>(create: (_) => SplashController(null)),
      ],
      child: const MyApp(
      ),
    ),
  );
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {

  @override
  void dispose() {
    super.dispose();
    Hive.close();

  }
  Locale? _locale;

  void loadData()async{
    String baseUrl= await MyStorage().getApiBaseUrl()??MyConstant.baseUrl;
    ApiService(baseUrl: baseUrl);
    MyTheme myTheme = await MyStorage().getTheme();
    //await Future.delayed(Duration(seconds: 3));
    if (!mounted) return;

    if(myTheme.myColorScheme==null&&myTheme.brightness==null){
      myTheme=myTheme.copyWith(myColorScheme: MyColorScheme(primary: MyColorSchemeConstant.primary.value,
          background: MyColorSchemeConstant.background.value
      ));
    }

     context.read<ChangeTheme>().setAppColor(myTheme);
    //
    //  loaded=true;



    // Navigator.pushAndRemoveUntil(
    //   context, MaterialPageRoute(builder: (context){
    //
    //   return MyMenu(myTheme: myTheme,);
    // }),(route) => false,);

    //context.read<ChangeTheme>().setAppColor(myTheme);
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   loadData();
  //
  // }

  @override
  void initState() {
    super.initState();
    loadData();
  }



  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: _locale?? const Locale('vi', 'VN'),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('vi', 'VN'),
        Locale('sk', 'SK'),
      ],
      navigatorKey: navigatorKey,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],


      theme:context.watch<ChangeTheme>().theme,
      //darkTheme: darkMode,
      home:  const SplashScreen(),

      onGenerateRoute: (RouteSettings settings) {
        return RouteController().getGenerateRoute(settings, context);
      },
      //const UploadPhotoScreen(),

      //MyMenu(),
      //Home()

      // MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


// class MyApp extends StatelessWidget {
//
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//
//
//       theme:context.watch<ChangeTheme>().theme==0?lightMode:darkMode,
//       //darkTheme: darkMode,
//       home: const MyMenu(),
//
//      // MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
