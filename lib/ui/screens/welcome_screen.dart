import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const String routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Header com gradiente (onde ficaria a foto + logo)
          Container(
            height: size.height * 0.48,
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
          ),

          // Cartão branco inferior
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.55,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 8),
                  const Text(
                    'Bem-vindo ao app do\naluguel sem stress!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.avalystGreen,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Para simplificar o seu dia a dia.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Botão "Entrar"
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.avalystGreen,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                      child: const Text(
                        'Entrar',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Divisor "Ou"
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'Ou',
                          style: TextStyle(
                            color: Color(0xFF707070),
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Botão "Cadastrar"
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: AppColors.avalystGreen,
                          width: 2,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, SignupScreen.routeName);
                      },
                      child: const Text(
                        'Cadastrar',
                        style: TextStyle(
                          color: AppColors.avalystGreen,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
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
