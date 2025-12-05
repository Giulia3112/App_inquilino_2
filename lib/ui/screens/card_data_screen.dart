import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class CardDataScreen extends StatelessWidget {
  const CardDataScreen({super.key});

  static const String routeName = '/card-data';

  @override
  Widget build(BuildContext context) {
    final cards = [
      _CardInfo(
        label: 'Cartão 1',
        name: 'ADILSON GUIMARÃES',
        number: '4551-XXXX-XXXX-4905',
        expiry: '09/31',
      ),
      _CardInfo(
        label: 'Cartão 2',
        name: 'JOANA GUIMARÃES',
        number: '4551-XXXX-XXXX-1234',
        expiry: '09/31',
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F9),
      body: Column(
        children: [
          _buildHeader(context),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: cards.length + 1,
              itemBuilder: (context, index) {
                if (index < cards.length) {
                  final card = cards[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _CardDataTile(
                      info: card,
                      showEdit: true,
                    ),
                  );
                }

                // Botão "Adicionar novo cartão"
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.avalystGreen,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: () {
                        // TODO: fluxo pra adicionar novo cartão
                      },
                      icon: const Icon(Icons.add),
                      label: const Text(
                        'Adicionar novo cartão',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                );
              },
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
      child: Row(
        children: const [
          Text(
            'Dados de cartão',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              'ALAN SERGIO DE CAMPOS',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CardInfo {
  final String label;
  final String name;
  final String number;
  final String expiry;

  _CardInfo({
    required this.label,
    required this.name,
    required this.number,
    required this.expiry,
  });
}

class _CardDataTile extends StatelessWidget {
  final _CardInfo info;
  final bool showEdit;

  const _CardDataTile({
    required this.info,
    this.showEdit = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.credit_card,
                  color: AppColors.avalystGreen,
                ),
                const SizedBox(width: 8),
                Text(
                  info.label,
                  style: const TextStyle(
                    color: Color(0xFF203555),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
                if (showEdit)
                  const Icon(
                    Icons.edit,
                    color: AppColors.avalystGreen,
                    size: 18,
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Nome no cartão:',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 13,
              ),
            ),
            Text(
              info.name,
              style: const TextStyle(
                color: Color(0xFF203555),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Cartão de Crédito:',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 13,
              ),
            ),
            Text(
              info.number,
              style: const TextStyle(
                color: Color(0xFF203555),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Data de validade:',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 13,
              ),
            ),
            Text(
              info.expiry,
              style: const TextStyle(
                color: Color(0xFF203555),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
