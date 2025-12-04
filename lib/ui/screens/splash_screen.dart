// lib/ui/screens/splash_screen.dart
import 'dart:async';
import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryPurple,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.home_outlined,
              size: 72,
              color: Colors.white,
            ),
            SizedBox(height: 16),
            Text(
              'Avalyst',
              style: AppTextStyles.titleLarge
                  .copyWith(color: Colors.white, fontSize: 26),
            ),
            SizedBox(height: 8),
            Text(
              'App do Inquilino',
              style: AppTextStyles.bodySecondary
                  .copyWith(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
