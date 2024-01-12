import 'package:flutter/material.dart';

class LoterMaterialTheme {
  static ThemeData myTheme = ThemeData(
      useMaterial3: true,
      primaryColor: Color.fromARGB(255, 255, 160, 0),
      backgroundColor: Colors.white,
      primaryTextTheme: TextTheme(bodyMedium: TextStyle()).apply(
        bodyColor: Colors.black,
        displayColor: Colors.black),
      
      );
}
