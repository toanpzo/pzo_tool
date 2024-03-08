import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vietjet_tool/common/local_storage/my_storage.dart';
import 'package:vietjet_tool/models/theme_models/my_theme.dart';



// ThemeData lightMode = ThemeData(
//     useMaterial3: true,
//     brightness: Brightness.light,
//     primaryColor: Color(0xFF9426FA),
//     backgroundColor: Colors.orange,
//
//     // appBarTheme: const AppBarTheme(
//     // backgroundColor: Colors.purple,
//     //
//     //
//     //
//     // ),
//     // textTheme: const TextTheme(
//     //   titleMedium: TextStyle(color: Colors.green)
//     //
//     // ),
//     colorScheme:  ColorScheme(
//           brightness: Brightness.light,
//           primary: Color(0xFF9426FA), //Color(0xFF0052DD),
//           onPrimary: Color(0xFFFFFFFF),
//           // primaryContainer: Color(0xFFDBE1FF),
//           // onPrimaryContainer: Color(0xFF00174C),
//           secondary: Color(0xFF595E72),
//           onSecondary: Color(0xFFFFFFFF),
//           // secondaryContainer: Color(0xFFDDE1F9),
//           // onSecondaryContainer: Color(0xFF161B2C),
//
//           error: Color(0xFFBA1A1A),
//           // errorContainer: Color(0xFFFFDAD6),
//           onError: Color(0xFFFFFFFF),
//           //onErrorContainer: Color(0xFF410002),
//           background:   Color(0xFFFEFBFF),
//           onBackground:  Color(0xFF1B1B1F),
//           surface: Color(0xFFFEFBFF),
//           onSurface: Color(0xFF1B1B1F),
//           // surfaceVariant: Color(0xFFE2E2EC),
//           // onSurfaceVariant: Color(0xFF45464F),
//           // tertiary: Color(0xFF745470),
//           // onTertiary: Color(0xFFFFFFFF),
//           // tertiaryContainer: Color(0xFFFFD6F7),
//           // onTertiaryContainer: Color(0xFF2B122A),
//           // outline: Color(0xFF757680),
//           // onInverseSurface: Color(0xFFF2F0F4),
//           // inverseSurface: Color(0xFF303034),
//           // inversePrimary: Color(0xFFB4C5FF),
//           // shadow: Color(0xFF000000),
//           // surfaceTint: Color(0xFF0052DD),
//           // outlineVariant: Color(0xFFC5C6D0),
//           // scrim: Color(0xFF000000),
//     )
//
// );
//
// ThemeData darkMode = ThemeData(
//     useMaterial3: true,
//     brightness: Brightness.dark,
//     // appBarTheme: const AppBarTheme(
//     //       backgroundColor: Colors.grey,
//     // ),
//
//     colorScheme:  ColorScheme(
//           brightness: Brightness.dark,
//           primary: Color(0xFFB4C5FF),
//           onPrimary: Color(0xFF002979),
//           //primaryContainer: Color(0xFF003DA9),
//           //onPrimaryContainer: Color(0xFFDBE1FF),
//           secondary: Color(0xFFC1C5DD),
//           onSecondary: Color(0xFF2B3042),
//           //secondaryContainer: Color(0xFF414659),
//           //onSecondaryContainer: Color(0xFFDDE1F9),
//
//           error: Color(0xFFFFB4AB),
//           //errorContainer: Color(0xFF93000A),
//           onError: Color(0xFF690005),
//           //onErrorContainer: Color(0xFFFFDAD6),
//           background: Colors.grey, //Color(0xFF1B1B1F),
//           onBackground: Color(0xFFE4E2E6),
//           surface: Color(0xFF1B1B1F),
//           onSurface: Color(0xFFE4E2E6),
//           //surfaceVariant: Color(0xFF45464F),
//           //onSurfaceVariant: Color(0xFFC5C6D0),
//           // tertiary: Color(0xFFE2BBDB),
//           // onTertiary: Color(0xFF422740),
//           // tertiaryContainer: Color(0xFF5B3D58),
//           // onTertiaryContainer: Color(0xFFFFD6F7),
//           // outline: Color(0xFF8F909A),
//           // onInverseSurface: Color(0xFF1B1B1F),
//           // inverseSurface: Color(0xFFE4E2E6),
//           // inversePrimary: Color(0xFF0052DD),
//           // shadow: Color(0xFF000000),
//           // surfaceTint: Color(0xFFB4C5FF),
//           // outlineVariant: Color(0xFF45464F),
//           // scrim: Color(0xFF000000),
//     ));

ThemeData lightMode = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    // textTheme: ThemeData().textTheme.copyWith(
    //     bodyMedium: TextStyle().copyWith(fontSize: 200)
    // )



    //primaryColor: AppColorConstant.primaryColor,
    //backgroundColor: AppColorConstant.backgroundColor,

    // colorScheme:  ColorScheme(
    //   brightness: Brightness.light,
    //   primary: MyColorSchemeConstant.primary,
    //   onPrimary: MyColorSchemeConstant.onPrimary,
    //   // primaryContainer: Color(0xFFDBE1FF),
    //   // onPrimaryContainer: Color(0xFF00174C),
    //   secondary: MyColorSchemeConstant.secondary,
    //   onSecondary: MyColorSchemeConstant.onSecondary,
    //   // secondaryContainer: Color(0xFFDDE1F9),
    //   // onSecondaryContainer: Color(0xFF161B2C),
    //
    //   error: MyColorSchemeConstant.error,
    //   // errorContainer: Color(0xFFFFDAD6),
    //   onError: MyColorSchemeConstant.onError,
    //   //onErrorContainer: Color(0xFF410002),
    //   background:   MyColorSchemeConstant.background,
    //   onBackground:  MyColorSchemeConstant.onBackground,
    //   surface: MyColorSchemeConstant.surface,
    //   onSurface: MyColorSchemeConstant.onSurface,
    //   // surfaceVariant: Color(0xFFE2E2EC),
    //   // onSurfaceVariant: Color(0xFF45464F),
    //   // tertiary: Color(0xFF745470),
    //   // onTertiary: Color(0xFFFFFFFF),
    //   // tertiaryContainer: Color(0xFFFFD6F7),
    //   // onTertiaryContainer: Color(0xFF2B122A),
    //   // outline: Color(0xFF757680),
    //   // onInverseSurface: Color(0xFFF2F0F4),
    //   // inverseSurface: Color(0xFF303034),
    //   // inversePrimary: Color(0xFFB4C5FF),
    //   // shadow: Color(0xFF000000),
    //   // surfaceTint: Color(0xFF0052DD),
    //   // outlineVariant: Color(0xFFC5C6D0),
    //   // scrim: Color(0xFF000000),
    // )

);

ThemeData darkMode = ThemeData(

    useMaterial3: true,
    brightness: Brightness.dark,

    // primaryColor: AppColorConstant.primaryColorDark,
    // backgroundColor: AppColorConstant.backgroundColorDark,

    // colorScheme:  ColorScheme(
    //   brightness: Brightness.dark,
    //   primary: MyColorSchemeConstant.primaryDark,
    //   onPrimary: MyColorSchemeConstant.onPrimaryDark,
    //   // primaryContainer: Color(0xFFDBE1FF),
    //   // onPrimaryContainer: Color(0xFF00174C),
    //   secondary: MyColorSchemeConstant.secondaryDark,
    //   onSecondary: MyColorSchemeConstant.onSecondaryDark,
    //   // secondaryContainer: Color(0xFFDDE1F9),
    //   // onSecondaryContainer: Color(0xFF161B2C),
    //
    //   error: MyColorSchemeConstant.errorDark,
    //   // errorContainer: Color(0xFFFFDAD6),
    //   onError: MyColorSchemeConstant.onErrorDark,
    //   //onErrorContainer: Color(0xFF410002),
    //   background:   MyColorSchemeConstant.backgroundDark,
    //   onBackground:  MyColorSchemeConstant.onBackgroundDark,
    //   surface: MyColorSchemeConstant.surfaceDark,
    //   onSurface: MyColorSchemeConstant.onSurfaceDark,
    //   // surfaceVariant: Color(0xFFE2E2EC),
    //   // onSurfaceVariant: Color(0xFF45464F),
    //   // tertiary: Color(0xFF745470),
    //   // onTertiary: Color(0xFFFFFFFF),
    //   // tertiaryContainer: Color(0xFFFFD6F7),
    //   // onTertiaryContainer: Color(0xFF2B122A),
    //   // outline: Color(0xFF757680),
    //   // onInverseSurface: Color(0xFFF2F0F4),
    //   // inverseSurface: Color(0xFF303034),
    //   // inversePrimary: Color(0xFFB4C5FF),
    //   // shadow: Color(0xFF000000),
    //   // surfaceTint: Color(0xFF0052DD),
    //   // outlineVariant: Color(0xFFC5C6D0),
    //   // scrim: Color(0xFF000000),
    // )

);

// class AppColorConstant{
//   static Color primaryColor= const Color(0xFF09F1BB);
//   static Color backgroundColor=  const Color(0xFFE4DFE8);
//
//   static Color primaryColorDark= const Color(0xFFB4C5FF);
//   static Color backgroundColorDark= const Color(0xFF575459);
// }

class MyColorSchemeConstant{
  static Color primary=  const Color(0xFF14CAF3);
  static Color onPrimary=const Color(0xFFA85DEE);
  static Color secondary=const Color(0xFFC1C5DD);
  static Color onSecondary=const Color(0xFF2B3042);
  static Color error=const Color(0xFFFFB4AB);
  static Color onError=const Color(0xFF690005);
  static Color background= const Color(0xFFFFFFFF);
  static Color onBackground=const Color(0xFFE4E2E6);
  static Color surface=const Color(0xFF1B1B1F);
  static Color onSurface=const Color(0xFFE4E2E6);

  static Color primaryDark= const Color(0xFFB4C5FF);
  static Color onPrimaryDark= const Color(0xFF002979);
  static Color secondaryDark= const Color(0xFFC1C5DD);
  static Color onSecondaryDark= const Color(0xFF2B3042);
  static Color errorDark= const Color(0xFFFFB4AB);
  static Color onErrorDark= const Color(0xFF690005);
  static Color backgroundDark= Colors.grey;
  static Color onBackgroundDark= const Color(0xFFE4E2E6);
  static Color surfaceDark= const Color(0xFF1B1B1F);
  static Color onSurfaceDark= const Color(0xFFE4E2E6);
}


class ChangeTheme with ChangeNotifier, DiagnosticableTreeMixin {


      void setThemeFromAppColor(MyTheme myThemeColor){
        if(myThemeColor.brightness==1){
          myTheme=darkMode;
        }else{
          myTheme=lightMode;
        }




        MyStorage().setTheme(myThemeColor);




        myTheme=ThemeData(
          useMaterial3: true,
          brightness: myThemeColor.brightness==1?Brightness.dark:Brightness.light,
          colorScheme: ColorScheme(
            brightness: myThemeColor.brightness==1?Brightness.dark:Brightness.light,
            primary: myThemeColor.myColorScheme?.primary!=null?Color(myThemeColor.myColorScheme!.primary!):myTheme.colorScheme.primary,
            onPrimary:myThemeColor.myColorScheme?.onPrimary!=null?Color(myThemeColor.myColorScheme!.onPrimary!):myTheme.colorScheme.onPrimary,
            secondary: myThemeColor.myColorScheme?.secondary!=null?Color(myThemeColor.myColorScheme!.secondary!):myTheme.colorScheme.secondary,
            onSecondary: myThemeColor.myColorScheme?.onSecondary!=null?Color(myThemeColor.myColorScheme!.onSecondary!):myTheme.colorScheme.onSecondary,
            error: myThemeColor.myColorScheme?.error!=null?Color(myThemeColor.myColorScheme!.error!):myTheme.colorScheme.error,
            onError: myThemeColor.myColorScheme?.onError!=null?Color(myThemeColor.myColorScheme!.onError!):myTheme.colorScheme.onError,
            surface: myThemeColor.myColorScheme?.surface!=null?Color(myThemeColor.myColorScheme!.surface!):myTheme.colorScheme.surface,
            onSurface: myThemeColor.myColorScheme?.onSurface!=null?Color(myThemeColor.myColorScheme!.onSurface!):myTheme.colorScheme.onSurface,
            background: myThemeColor.myColorScheme?.background!=null?Color(myThemeColor.myColorScheme!.background!):myTheme.colorScheme.background,
            onBackground: myThemeColor.myColorScheme?.onBackground!=null?Color(myThemeColor.myColorScheme!.onBackground!):myTheme.colorScheme.onBackground,
          ),



        );
        // myTheme=myTheme.copyWith(
        //   primaryTextTheme: myTheme.primaryTextTheme.copyWith(
        //     bodyMedium: myTheme.primaryTextTheme.bodyMedium?.copyWith(fontSize: 26)
        //   ),
        // );








            // myTheme =myTheme.copyWith(
            //   primaryColor: myThemeColor.primaryColor!=null?Color(myThemeColor.primaryColor!):myTheme.primaryColor,
            //
            //       colorScheme: myTheme.colorScheme.copyWith(
            //             primary: myThemeColor.myColorScheme?.primary!=null?Color(myThemeColor.myColorScheme!.primary!):myTheme.colorScheme.primary,
            //             onPrimary:myThemeColor.myColorScheme?.onPrimary!=null?Color(myThemeColor.myColorScheme!.onPrimary!):myTheme.colorScheme.onPrimary,
            //             secondary: myThemeColor.myColorScheme?.secondary!=null?Color(myThemeColor.myColorScheme!.secondary!):myTheme.colorScheme.secondary,
            //             onSecondary: myThemeColor.myColorScheme?.onSecondary!=null?Color(myThemeColor.myColorScheme!.onSecondary!):myTheme.colorScheme.onSecondary,
            //             error: myThemeColor.myColorScheme?.error!=null?Color(myThemeColor.myColorScheme!.error!):myTheme.colorScheme.error,
            //             onError: myThemeColor.myColorScheme?.onError!=null?Color(myThemeColor.myColorScheme!.onError!):myTheme.colorScheme.onError,
            //             surface: myThemeColor.myColorScheme?.surface!=null?Color(myThemeColor.myColorScheme!.surface!):myTheme.colorScheme.surface,
            //             onSurface: myThemeColor.myColorScheme?.onSurface!=null?Color(myThemeColor.myColorScheme!.onSurface!):myTheme.colorScheme.onSurface,
            //             background: myThemeColor.myColorScheme?.background!=null?Color(myThemeColor.myColorScheme!.background!):myTheme.colorScheme.background,
            //             onBackground: myThemeColor.myColorScheme?.onBackground!=null?Color(myThemeColor.myColorScheme!.onBackground!):myTheme.colorScheme.onBackground,
            //       )
            // );

      }





      ThemeData myTheme = lightMode;

      ThemeData get theme => myTheme;



      // Future<ThemeData> get theme async{
      //       return _theme;
      // }
      /// theme:0=light_mode
      /// 1=dark_mode

      // void setTheme(ThemeData theme) {
      //       myTheme=theme;
      //       notifyListeners();
      // }

      void setAppColor(MyTheme myThemeColor) {

            setThemeFromAppColor(myThemeColor);
            notifyListeners();

      }




      // /// Makes `Counter` readable inside the devtools by listing all of its properties
      // @override
      // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
      //       super.debugFillProperties(properties);
      //       properties.add(('theme', theme));
      // }
}
