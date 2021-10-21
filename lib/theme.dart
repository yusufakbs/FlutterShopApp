import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData theme() {
  return ThemeData(
      appBarTheme: appBarTheme(),
      scaffoldBackgroundColor: Colors.white,
      textTheme: textTheme(),
      // inputDecorationTheme: inputDecorationTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity);
}

// InputDecorationTheme inputDecorationTheme() {
//   return InputDecorationTheme(
//     // floatingLabelBehavior: FloatingLabelBehavior.always,
//     contentPadding: EdgeInsets.symmetric(
//       horizontal: 42,
//       vertical: 20,
//     ),
//     enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(28),
//         borderSide: BorderSide(color: kTextColor),
//         gapPadding: 10),
//     focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(28),
//         borderSide: BorderSide(color: kTextColor),
//         gapPadding: 10),
//   );
// }

TextTheme textTheme() {
  return TextTheme(
      bodyText1: TextStyle(color: kTextColor),
      bodyText2: TextStyle(color: kTextColor));
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      color: Colors.white,
      elevation: 0,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: TextTheme(
          headline6: TextStyle(
        color: Color(0XFF8B8B8B),
        fontSize: 18,
      )));
}
