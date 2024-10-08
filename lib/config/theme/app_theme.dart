import 'package:flutter/material.dart';

class ThemesApp {
  static final light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green,
    appBarTheme: const AppBarTheme(color: Colors.orangeAccent),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Georgia',
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        color: Colors.red,
      ),
      titleLarge: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
    ),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.lightBlue[800],
    appBarTheme: const AppBarTheme(color: Colors.lime),
    scaffoldBackgroundColor: Colors.black45,
    fontFamily: 'TiltPrism',
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        color: Colors.green,
      ),
      titleLarge: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
    ),
  );
}
