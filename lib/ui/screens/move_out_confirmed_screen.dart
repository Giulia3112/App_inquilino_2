import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import 'rent_management_screen.dart';

class MoveOutConfirmedScreen extends StatelessWidget {
  const MoveOutConfirmedScreen({super.key});

  static const String routeName = '/move-out-confirmed';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.55,
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 18,
                          color: AppColors.avalystGreen,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Voltar',
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.avalystGreen,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Sua desocupação foi',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF203555),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'confirmada pela imobiliária.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF203555),
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Você pode solicitar um\ncertificado de crédito.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF203555),
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                  const Spacer(),
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
                        // TODO: fluxo real de certificado
                      },
                      child: const Text(
                        'Solicitar certificado de crédito',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.avalystGreen,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RentManagementScreen.routeName,
                          (route) => false,
                        );
                      },
                      child: const Text(
                        'Voltar para Gestão do Aluguel',
                        style: TextStyle(
                          color: Color(0xFF203555),
                          fontSize: 14,
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
