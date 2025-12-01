import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      primaryColor: const Color(0xFF031A70),
      colorScheme: ColorScheme.fromSeed(
        seedColor: Color(0xFF031A70),
        brightness: Brightness.light,
      ),
      useMaterial3: false,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Color(0xFF031A70),
        brightness: Brightness.dark,
      ),
      useMaterial3: false,
    );
  }
}
