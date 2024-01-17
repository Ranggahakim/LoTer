import 'package:flutter/material.dart';

class LoterMaterialTheme {
  static ThemeData myTheme = ThemeData(
      useMaterial3: true,
      primaryColor: const Color.fromARGB(255, 255, 160, 0),
      primaryTextTheme: const TextTheme(bodyMedium: TextStyle()).apply(
        bodyColor: Colors.black,
        displayColor: Colors.black),
      
      );
}
