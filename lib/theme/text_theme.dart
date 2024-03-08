// import 'package:flutter/material.dart';
//
// import '../common/color/colors.dart';
//
// const fontFamily = 'Roboto';
//
// class TextSizes {
//   static const bodyLarge = 18.0;
//   static const body = 16.0;
//   static const bodySmall = 14.0;
//   static const bodySmall2 = 12.0;
//   static const headerLine = 200.0;
// }
//
// extension TextThemeExt on TextTheme {
//   TextStyle get body => bodyLarge!.copyWith(fontSize: TextSizes.body);
//   TextStyle get bodyMedium => bodyLarge!.copyWith(fontSize: TextSizes.body);
//
//   TextStyle get headerLine =>
//       bodyLarge!.copyWith(fontSize: TextSizes.headerLine);
// }
//
// extension TextStyleExt on TextStyle {
//   TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
//
//   TextStyle get medium => copyWith(fontWeight: FontWeight.w600);
//
//   TextStyle get light => copyWith(fontWeight: FontWeight.w300);
//
//   // colors
//   // TextStyle get colorPrimary => copyWith(color: AppColors.primaryColor);
//   //
//   // TextStyle get colorAccent => copyWith(color: AppColors.accentColor);
//   //
//   // TextStyle get colorDart => copyWith(color: AppColors.dartTextColor);
//   //
//   // TextStyle get colorGray => copyWith(color: AppColors.grayTextColor);
//   //
//   // TextStyle get colorWhite => copyWith(color: AppColors.whiteColor);
// }
//
// // TextTheme createTextTheme() => const TextTheme(
// //       bodyLarge: TextStyle(
// //         fontFamily: fontFamily,
// //         fontWeight: FontWeight.normal,
// //         fontSize: TextSizes.bodyLarge,
// //         color: Colors.black87,
// //       ),
// //     );
// //
// // TextTheme createPrimaryTextTheme() =>
// //     createTextTheme().apply(bodyColor: AppColors.whiteColor);
// //
// // TextTheme createAccentTextTheme() =>
// //     createTextTheme().apply(bodyColor: AppColors.whiteColor);
//
// TextTheme textTheme(BuildContext context) {
//   return Theme.of(context).textTheme;
// }
//
// TextTheme primaryTextTheme(BuildContext context) {
//   return Theme.of(context).primaryTextTheme;
// }
