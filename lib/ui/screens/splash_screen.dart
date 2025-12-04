import 'dart:async';
import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/main_shell_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLogged = false; // Aqui depois você troca pela verificação real

  @override
  void initState() {
    super.initState();

    // Simula carregamento + verificação de login
    Timer(const Duration(seconds: 2), () {
      if (_isLogged) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MainShellScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Avalyst',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
