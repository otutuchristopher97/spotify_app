import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const MaterialColor primaryColorSwatch = MaterialColor(
    0xFF000000,
    <int, Color>{
      25: Color(0xFFFCFAFF),
      50: Color(0xFFF9F5FF),
      100: Color(0xFFF4EBFF),
      200: Color.fromARGB(255, 88, 87, 87),
      300: Color(0xFF000000),
      400: Color(0xFF000000),
      500: Color(0xFF000000),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    },
  );
  static const MaterialColor errorColorSwatch = MaterialColor(
    0xFF9E77ED,
    <int, Color>{
      25: Color(0xFFFFFBFA),
      50: Color(0xFFFEF3F2),
      100: Color(0xFFFEE4E2),
      200: Color(0xFFFECDCA),
      300: Color(0xFFFDA29B),
      400: Color(0xFFF97066),
      500: Color(0xFFF04438),
      600: Color(0xFFD92D20),
      700: Color(0xFFB42318),
      800: Color(0xFF912018),
      900: Color(0xFF7A271A),
    },
  );
  static const MaterialColor successColorSwatch = MaterialColor(
    0xFF9E77ED,
    <int, Color>{
      25: Color(0xFFF6FEF9),
      50: Color(0xFFECFDF3),
      100: Color(0xFFD1FADF),
      200: Color(0xFFA6F4C5),
      300: Color(0xFF6CE9A6),
      400: Color(0xFF32D583),
      500: Color(0xFF12B76A),
      600: Color(0xFF039855),
      700: Color(0xFF027A48),
      800: Color(0xFF05603A),
      900: Color(0xFF054F31),
    },
  );

  static Color primaryColor = primaryColorSwatch.shade600;
  static const Color accentColor = Color.fromARGB(255, 52, 51, 55);
  static const Color greyColor = Color(0xFF667085);
  static const Color greyLightColor = Color(0xFFD0D5DD);
  static const Color blackTextColor = Color(0xFF0F1419);
  static const Color whiteTextColor = Color(0xFFFFFFFF);
  static Color backgroundColor = primaryColor;
  static const Color warningColor = Color(0xFFF79009);
  static Color errorColor = errorColorSwatch.shade500;
  static Color successColor = errorColorSwatch.shade500;
  static Color transparentColor = Colors.transparent;
}
