import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vietjet_tool/common/template/my_state.dart';
import 'package:vietjet_tool/controllers/my_controller.dart';
import 'package:vietjet_tool/ui/home/my_home.dart';
import 'package:vietjet_tool/ui/splash/splash_controller.dart';

import '../../common/Constant/constant.dart';
import '../../common/local_storage/my_storage.dart';
import '../../controllers/apiServiceController.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

// class _SplashScreenState extends MyState<SplashScreen> {
//   bool loaded=false;
//   @override
//   void initState() {
//     super.initState();
//     //(controller as SplashController).loadingFuture=(controller as SplashController).loadDataNe();
//    // loadData();
//     // WidgetsBinding.instance.addPostFrameCallback((_) async{
//     //   if (!mounted) return;
//     //
//     //   MyTheme? myTheme =await MyStorage().getTheme();
//     //
//     //   context.read<ChangeTheme>().setAppColor(myTheme);
//     //
//     //
//     //
//     //    Navigator.push(context, MaterialPageRoute(builder: (context) => const MyMenu(),));
//     //
//     //
//     // });
//   }
//
//   void loadData()async{
//     //MyTheme myTheme = await MyStorage().getTheme();
//     await Future.delayed(Duration(seconds: 1));
//     // if (!mounted) return;
//     //
//     //   if(myTheme.myColorScheme==null){
//     //   myTheme=myTheme.copyWith(myColorScheme: MyColorScheme(primary: MyColorSchemeConstant.primary.value,
//     //   background: MyColorSchemeConstant.background.value
//     //   ));
//     // }
//
//     // context.read<ChangeTheme>().setAppColor(myTheme);
//     //
//     //  loaded=true;
//
//
//
//     Navigator.pushAndRemoveUntil(
//       context,  MaterialPageRoute(builder: (context) => MyHome(),),(route) => false,);
//
//     //context.read<ChangeTheme>().setAppColor(myTheme);
//   }
//
//
//
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //       body: Container(
//   //         color: Theme.of(context).colorScheme.background,
//   //         child:  const Center(
//   //             child: Image(
//   //               image: AssetImage("assets/icons/logo.png"),
//   //               height: 100,
//   //             )
//   //
//   //
//   //           //LoadingAnimationWidget.beat(color: Theme.of(context).colorScheme.primary, size: 200),
//   //           //     LoadingAnimationWidget.twistingDots(
//   //           //     leftDotColor: Theme.of(context).colorScheme.primary,
//   //           //     rightDotColor: Theme.of(context).colorScheme.secondary,
//   //           // size: 200,
//   //           // ),
//   //         ),
//   //       )
//   //
//   //
//   //   );
//   // }
//
//   @override
//   MyController createController() {
//     return SplashController(this);
//   }
//
//   @override
//   Future<void> afterLoadData() async {
//     await Future.delayed(const Duration(seconds: 2));
//     Navigator.pushAndRemoveUntil(
//       context,  MaterialPageRoute(builder: (context) => MyHome(),),(route) => false,);
//   }
//
//   @override
//   Widget setBody() {
//     // TODO: implement setBody
//     return
//
//       TextButton(onPressed:() async{
//         print("bat dau bam click");
//         controller.setViewState(MyViewState.loadingAll);
//         await controller.loadingFuture;
//         controller.setViewState(MyViewState.loaded);
//         print("click xong");
//
//       }, child: Text("kkk"));
//     //   Container(
//     //   color: Theme.of(context).colorScheme.background,
//     //   child:  const Center(
//     //       child: Image(
//     //         image: AssetImage("assets/icons/logo.png"),
//     //         height: 100,
//     //       )
//     //
//     //
//     //     //LoadingAnimationWidget.beat(color: Theme.of(context).colorScheme.primary, size: 200),
//     //     //     LoadingAnimationWidget.twistingDots(
//     //     //     leftDotColor: Theme.of(context).colorScheme.primary,
//     //     //     rightDotColor: Theme.of(context).colorScheme.secondary,
//     //     // size: 200,
//     //     // ),
//     //   ),
//     // );
//   }
//
//   @override
//   String setTitle() {
//     // TODO: implement setTitle
//    return "";
//   }
//
// }

class _SplashScreenState extends State<SplashScreen> {
  bool loaded=false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      try {
        final splashController = Provider.of<SplashController>(
            context, listen: false);
        print(splashController);

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MyHome()),
              (route) => false,
        );
      }catch(e){
        print(e);
      }

    });


    //loadData();
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
    //await Future.delayed(Duration(seconds: 1));
    final splashController = Provider.of<SplashController>(context, listen: false);
    print(splashController);




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



