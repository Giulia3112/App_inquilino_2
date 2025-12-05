import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({super.key});

  static const String routeName = '/documents';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F9),
      body: Column(
        children: [
          _buildHeader(context),
          const SizedBox(height: 24),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Material(
                        color: const Color(0xFF00AEEF), // azul do card
                        borderRadius: BorderRadius.circular(24),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(24),
                          onTap: () {
                            // TODO: download real do contrato
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 24,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(
                                  Icons.description_outlined,
                                  size: 40,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'Clique e faça download do\n'
                                  'seu Contrato de Garantia\n'
                                  'Locatícia Avalyst',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ),
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

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 48,
        left: 20,
        right: 20,
        bottom: 20,
      ),
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
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Documentos',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'ALAN SERGIO DE CAMPOS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Contrato 46233',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 13,
            ),
          ),
          Text(
            'Contrato iniciado em 03/10/2023',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 13,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Imobiliária APOLAR PINHAIS',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 13,
            ),
          ),
          Text(
            'AVENIDA MARINGÁ, 4155 - D - ATUBA - PINHAIS - PR\nCEP: 83326-010',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
