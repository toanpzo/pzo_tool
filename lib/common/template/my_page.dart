import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vietjet_tool/common/template/my_state.dart';




class MyPage extends StatefulWidget {
   MyPage({super.key, required this.title, this.body, required this.myViewState});
   String title;
   MyViewState myViewState;
   Widget? body;

  @override
  State<MyPage> createState() => _MyPageState();


}

class _MyPageState extends State<MyPage> {

  Widget buildMainWidget(Widget bodyWidget){
    return

    Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(widget.title),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){}, child: const Icon(Icons.add)),
        body:bodyWidget


      //widget.body??Container(),

    );
  }



  Widget loadingAllPage(){
    return Scaffold(
        body: Center(
          child: LoadingAnimationWidget.twistingDots(
            leftDotColor: Theme.of(context).colorScheme.primary,
            rightDotColor: Theme.of(context).colorScheme.secondary,
            size: 200,
          ),
        ));
  }
  Widget loadingPage(){
    return Scaffold(
        body: Center(
          child: LoadingAnimationWidget.twistingDots(
            leftDotColor: Theme.of(context).colorScheme.primary,
            rightDotColor: Theme.of(context).colorScheme.onPrimary,
            size: 200,
          ),
        ));
  }
  Widget loadedPage(){
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(widget.title),
        ),
        body:widget.body??Container()
    );
  }
  Widget errorPage(){
    return Scaffold(
        body: Center(
          child: LoadingAnimationWidget.twistingDots(
            leftDotColor: Theme.of(context).colorScheme.primary,
            rightDotColor: Theme.of(context).colorScheme.onPrimary,
            size: 200,
          ),
        ));
  }



  @override
  Widget build(BuildContext context) {

    switch (widget.myViewState){
      case MyViewState.loadingAll:
        return loadingAllPage();
      case MyViewState.loading:
        return loadingPage();
      case MyViewState.loaded:
        return loadedPage();
      case MyViewState.error:
        return errorPage();
      default: return errorPage();
    }

    // Widget scaffoldWidget=Container();
    // Widget bodyWidget=Container();
    //
    //
    //
    // switch (widget.myState) {
    //   case MyState.loadingAll:
    //     scaffoldWidget=Center(
    //           child: LoadingAnimationWidget.twistingDots(
    //             leftDotColor: const Color(0xFF1A1A3F),
    //             rightDotColor: const Color(0xFFEA3799),
    //             size: 200,
    //           ));
    //     break;
    //   case MyState.loading:
    //     scaffoldWidget=Container();
    //     break;
    //   case MyState.loaded:
    //     buildMainWidget(widget.body??Container());
    //     break;
    //   case MyState.error:
    //     scaffoldWidget=Container();
    //     break;
    // }
    // return scaffoldWidget;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add)),
      body:widget.body??Container()


      //widget.body??Container(),

    );
  }

   void update(){
    setState(() {

    });
  }
}

