import 'package:flutter/material.dart';
import 'package:app_inquilino_2/ui/screens/main_shell.dart';
import 'package:app_inquilino_2/ui/screens/register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Hero da parte de cima
          Expanded(
            flex: 4,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  color: Colors.blueGrey, // placeholder pra imagem
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black45],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Text(
                      'app do aluguel\nsem stress!',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'GothamRounded',
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Card de baixo com botões
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Bem-vindo ao app do aluguel sem stress!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'GothamRounded',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF96C83C),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Para simplificar o seu dia a dia.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'SegoeUI',
                      fontSize: 13,
                      color: Color(0xFF1A3057),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // BOTÃO ENTRAR → MainShell
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF96C83C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => MainShell(),
                        ),
                      );
                    },
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
                        fontFamily: 'SegoeUI',
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // BOTÃO CADASTRAR → RegisterScreen
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF96C83C)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => RegisterScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Cadastrar',
                      style: TextStyle(
                        fontFamily: 'GothamRounded',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF96C83C),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

