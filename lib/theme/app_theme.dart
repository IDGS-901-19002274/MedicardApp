import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color.fromARGB(255, 69, 214, 225);
  static const Color secundary = Color.fromARGB(255, 159, 243, 245);
  static const Color tertiary = Color.fromARGB(255, 233, 216, 254);
  static const Color fourth = Color.fromARGB(255, 82, 114, 242);
  static const Color fifth = Color.fromARGB(255, 52, 67, 102);
  static const Color white = Color.fromARGB(255, 251, 244, 234);
  static const Color dark = Color.fromARGB(255, 52, 59, 64);

  static Color transparentDark = const Color.fromARGB(124, 52, 59, 64);
  static Color ultraSoftDark = const Color.fromARGB(64, 52, 59, 64);

  static ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: primary,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(color: primary, elevation: 0),
      scaffoldBackgroundColor: Colors.white);

  static ThemeData darkTheme = ThemeData.dark().copyWith(
      primaryColor: primary,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(color: primary, elevation: 0),
      scaffoldBackgroundColor: dark);
}
