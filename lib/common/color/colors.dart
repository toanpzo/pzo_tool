// import 'package:flutter/material.dart';
//
//
// class AppColorConstant{
//   static Color primaryColor= const Color(0xFF9426FA);
//   static Color backgroundColor=  const Color(0xFFE4DFE8);
//
//   static Color primaryColorDark= const Color(0xFFB4C5FF);
//   static Color backgroundColorDark= const Color(0xFF575459);
// }
//
// class MyColorSchemeConstant{
//   static Color primary= const Color(0xFFB4C5FF);
//   static Color onPrimary=const Color(0xFF002979);
//   static Color secondary=const Color(0xFFC1C5DD);
//   static Color onSecondary=const Color(0xFF2B3042);
//   static Color error=const Color(0xFFFFB4AB);
//   static Color onError=const Color(0xFF690005);
//   static Color background= Colors.grey;
//   static Color onBackground=const Color(0xFFE4E2E6);
//   static Color surface=const Color(0xFF1B1B1F);
//   static Color onSurface=const Color(0xFFE4E2E6);
//
//   static Color primaryDark= const Color(0xFFB4C5FF);
//   static Color onPrimaryDark= const Color(0xFF002979);
//   static Color secondaryDark= const Color(0xFFC1C5DD);
//   static Color onSecondaryDark= const Color(0xFF2B3042);
//   static Color errorDark= const Color(0xFFFFB4AB);
//   static Color onErrorDark= const Color(0xFF690005);
//   static Color backgroundDark= Colors.grey;
//   static Color onBackgroundDark= const Color(0xFFE4E2E6);
//   static Color surfaceDark= const Color(0xFF1B1B1F);
//   static Color onSurfaceDark= const Color(0xFFE4E2E6);
// }
//
//
//
//
//
//
//
//
//
// class AppColors {
//   Color? primaryColor= Color(0xFF9426FA);
//   Color? backgroundColor= Colors.orange;
//   MyColorScheme? myColorScheme=MyColorScheme();
//
//   AppColors({this.primaryColor, this.backgroundColor, this.myColorScheme});
// }
//
// class MyColorScheme{
//   Color? primary= Color(0xFFB4C5FF);
//   Color? onPrimary= Color(0xFF002979);
//   Color? secondary= Color(0xFFC1C5DD);
//   Color? onSecondary= Color(0xFF2B3042);
//
//   Color? error= Color(0xFFFFB4AB);
//   Color? onError= Color(0xFF690005);
//   Color? background= Colors.grey;
//   Color? onBackground= Color(0xFFE4E2E6);
//   Color? surface= Color(0xFF1B1B1F);
//   Color? onSurface= Color(0xFFE4E2E6);
//
//   MyColorScheme({
//     this.primary,
//     this.onPrimary,
//     this.secondary,
//     this.onSecondary,
//     this.error,
//     this.onError,
//     this.background,
//     this.onBackground,
//     this.surface,
//     this.onSurface
//   });
// }
//
//
//
//
// // class AppColors {
// //   Color? _primaryColor = Color(0xff3771ff);
// //   Color get primaryColor=>_primaryColor??Color(0xff3771ff);
// //
// //
// //   Color? primaryColorDark = Color(0xff1d5fff);
// //   Color? primaryColorLight = Color(0xff7098ff);
// //   Color? primaryColorBlueSky = Color(0xff87cefa);
// //
// //   Color? darkGrey = Color(0xff25221e);
// //
// //   //Button
// //   Color? buttonIconColor = Colors.white;
// //   Color? buttonTextColor = Colors.white;
// //
// //   //Navigation
// //   Color? navIconColor = Colors.white;
// //   Color? navTextColor = Colors.white;
// //
// //   //Popup
// //   Color? popupTitleColor = Colors.white;
// //
// //   //Another
// //   Color? accentColor = Color(0xffED561F);
// //   Color? tabBarBackgroundColor = Colors.white;
// //
// //   Color? errorColor = Color(0xFFFF2525);
// //   Color? whiteColor = Color(0xFFFFFFFF);
// //
// //   Color? dartTextColor = Color(0xFF1C1C20);
// //   Color? grayTextColor = Color(0xFF6f6f6f);
// //
// //   Color? hintTextColor = Color(0x806f6f6f);
// //   Color? blackColor = Color(0xff000000);
// //
// //   AppColors({
// //     this.primaryColor,
// //     this.primaryColorDark,
// //     this.primaryColorLight,
// //     this.primaryColorBlueSky,
// //     this.darkGrey,
// //     this.buttonIconColor,
// //     this.buttonTextColor,
// //     this.navIconColor,
// //     this.navTextColor,
// //     this.popupTitleColor,
// //     this.accentColor,
// //     this.tabBarBackgroundColor,
// //     this.errorColor,
// //     this.whiteColor,
// //     this.dartTextColor,
// //     this.grayTextColor,
// //     this.hintTextColor,
// //     this.blackColor
// //   });
// //
// // //   gradientBackgroundColors = [whiteColor, Color(0xff914820)];
// //   //
// //   // static const materialPrimaryColorDark =
// //   //     MaterialColor(AppColors.primaryColorDark.value, const <int, Color>{
// //   //   50: AppColors.primaryColorDark,
// //   //   100: AppColors.primaryColorDark,
// //   //   200: AppColors.primaryColorDark,
// //   //   300: AppColors.primaryColorDark,
// //   //   400: AppColors.primaryColorDark,
// //   //   500: AppColors.primaryColorDark,
// //   //   600: AppColors.primaryColorDark,
// //   //   700: AppColors.primaryColorDark,
// //   //   800: AppColors.primaryColorDark,
// //   //   900: AppColors.primaryColorDark,
// //   // });
// //   //
// //   //  Color backgroundColor = whiteColor;
// //   //  Color grayBackgroundColor = Color(0xFFD9D9D9);
// // }
//
// extension ColorExt on Color {
//   Color withPercentAlpha(double percent) {
//     if (percent >= 1) {
//       return this;
//     }
//
//     return withAlpha((255 * percent).toInt());
//   }
//
//   static Color colorWithHex(int hexColor) {
//     return Color.fromARGB(
//       0xFF,
//       (hexColor >> 16) & 0xFF,
//       (hexColor >> 8) & 0xFF,
//       hexColor & 0xFF,
//     );
//   }
// }
