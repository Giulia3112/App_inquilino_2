import 'package:flutter/material.dart';
import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Depois de 1 segundo, vai para a tela de boas-vindas
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF031A70),
              Color(0xFF8D65F7),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Center(
          child: Text(
            'app do\ninquilino\nAvalyst',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'GothamRounded', // ou padrão se ainda não configurou
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
