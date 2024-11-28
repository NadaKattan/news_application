import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xff39A552);
  static const Color red = Color(0xffC91C22);
  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff303030);
  static const Color grey = Color(0xff4F5A69);
  static Color scaffoldColor = Colors.transparent;
  static ThemeData lightThemeData = ThemeData(
      primaryColor: primary,
      textTheme: const TextTheme(
        headlineSmall:
            TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: white),
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          // color: white
        ),
        labelMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: black,
        ),
        bodyMedium: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: black,
        ),
      ),
      // scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        backgroundColor: primary,
        foregroundColor: white,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
      ));
}
