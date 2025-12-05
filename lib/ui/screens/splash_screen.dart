// lib/ui/screens/splash_screen.dart
import 'dart:async';
import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Pequeno delay antes de ir para a tela de boas-vindas / login
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, WelcomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Gradiente igual ao layout
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
        child: Stack(
          children: [
            // Logo centralizado
            Center(
              child: Image.asset(
                'assets/images/logo_app_inquilino.png',
                width: 220,
                fit: BoxFit.contain,
              ),
            ),
            // Loading embaixo (opcional)
            Positioned(
              bottom: 48,
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                  width: 32,
                  height: 32,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.avalystGreen,
                    ),
                    backgroundColor: Colors.white.withOpacity(0.25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
