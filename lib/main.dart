import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'ui/screens/splash_screen.dart';

void main() {
  runApp(const AvalystApp());
}

class AvalystApp extends StatelessWidget {
  const AvalystApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App do Inquilino Avalyst',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const SplashScreen(),
    );
  }
}
