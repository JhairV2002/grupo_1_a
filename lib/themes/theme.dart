import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color.fromARGB(255, 25, 25, 25);
  static const Color secondary = Color.fromARGB(255, 34, 34, 34);
  static const Color primaryText = Colors.white;
  static const Color primaryIcon = Color.fromARGB(255, 40, 224, 46);
  static const Color hoverFloatButton = Color.fromARGB(255, 63, 240, 69);

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primary,
    scaffoldBackgroundColor: secondary,
    cardTheme: const CardTheme(
      color: secondary,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryIcon,
      hoverColor: hoverFloatButton,
    ),
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(
        color: primaryText,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
      ),
    ),
    iconTheme: const IconThemeData(
      color: primaryIcon,
    ),
    listTileTheme: const ListTileThemeData(textColor: primaryText),
  );
}
