// lib/ui/screens/club_screen.dart

import 'package:flutter/material.dart';
import '../../theme/app_text_styles.dart';

class ClubScreen extends StatelessWidget {
  const ClubScreen({super.key});

  static const routeName = '/club';

  @override
  Widget build(BuildContext context) {
    final benefits = [
      'Desconto em mudança',
      'Parceria com limpeza residencial',
      'Seguro residencial com condições especiais',
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: benefits.length,
        itemBuilder: (_, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.card_giftcard_outlined),
              title: Text(benefits[index], style: AppTextStyles.bodyRegular),
              subtitle: const Text(
                'Veja detalhes da parceria.',
                style: AppTextStyles.bodySecondary,
              ),
              onTap: () {
                // TODO: abrir detalhes do benefício
              },
            ),
          );
        },
      ),
    );
  }
}
