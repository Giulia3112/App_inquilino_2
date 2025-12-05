import 'dart:async';
import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import 'welcome_screen.dart';
import 'main_shell_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLogged = false; // depois trocar por checagem real

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      if (!mounted) return;

      if (_isLogged) {
        Navigator.pushReplacementNamed(context, MainShellScreen.routeName);
      } else {
        Navigator.pushReplacementNamed(context, WelcomeScreen.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors.avalystBlueLight,
              AppColors.avalystBlueMid,
              AppColors.avalystBlueDark,
            ],
            stops: [0.0, 0.773, 1.0],
          ),
        ),
        child: const Center(
          child: Text(
            'app do inquilino\nAvalyst',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              height: 1.3,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
