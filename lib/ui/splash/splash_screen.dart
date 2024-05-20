import 'package:flutter/material.dart';
import 'package:vietjet_tool/ui/home/my_home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool loaded=false;
  @override
  void initState() {
    super.initState();
    loadData();
    // WidgetsBinding.instance.addPostFrameCallback((_) async{
    //   if (!mounted) return;
    //
    //   MyTheme? myTheme =await MyStorage().getTheme();
    //
    //   context.read<ChangeTheme>().setAppColor(myTheme);
    //
    //
    //
    //    Navigator.push(context, MaterialPageRoute(builder: (context) => const MyMenu(),));
    //
    //
    // });
  }

  void loadData()async{
    //MyTheme myTheme = await MyStorage().getTheme();
    await Future.delayed(Duration(seconds: 1));
    // if (!mounted) return;
    //
    //   if(myTheme.myColorScheme==null){
    //   myTheme=myTheme.copyWith(myColorScheme: MyColorScheme(primary: MyColorSchemeConstant.primary.value,
    //   background: MyColorSchemeConstant.background.value
    //   ));
    // }

     // context.read<ChangeTheme>().setAppColor(myTheme);
     //
     //  loaded=true;



     Navigator.pushAndRemoveUntil(
       context,  MaterialPageRoute(builder: (context) => MyHome(),),(route) => false,);

    //context.read<ChangeTheme>().setAppColor(myTheme);
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Theme.of(context).colorScheme.background,
          child:  const Center(
            child: Image(
              image: AssetImage("assets/icons/logo.png"),
              height: 100,
            )


            //LoadingAnimationWidget.beat(color: Theme.of(context).colorScheme.primary, size: 200),
            //     LoadingAnimationWidget.twistingDots(
            //     leftDotColor: Theme.of(context).colorScheme.primary,
            //     rightDotColor: Theme.of(context).colorScheme.secondary,
            // size: 200,
            // ),
          ),
        )


    );
  }

}



