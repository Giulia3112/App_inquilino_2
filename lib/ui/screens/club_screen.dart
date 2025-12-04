import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class ClubAvalystScreen extends StatelessWidget {
  const ClubAvalystScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Clube Avalyst'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Benefícios exclusivos para inquilinos Avalyst',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Aproveite descontos em serviços, experiências e produtos parceiros.',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: const [
                    _BenefitCard(
                      title: 'Desconto em serviços de mudança',
                      partner: 'Parceiro: Mudanças Rápidas',
                      description:
                          '10% de desconto em fretes e mudanças para inquilinos Avalyst.',
                    ),
                    _BenefitCard(
                      title: 'Limpeza residencial',
                      partner: 'Parceiro: Casa Limpinha',
                      description:
                          'Cupons mensais para limpeza com profissionais de confiança.',
                    ),
                    _BenefitCard(
                      title: 'Seguros e serviços',
                      partner: 'Parceiro: Protege+',
                      description:
                          'Condições especiais em seguros residenciais e serviços adicionais.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BenefitCard extends StatelessWidget {
  final String title;
  final String partner;
  final String description;

  const _BenefitCard({
    required this.title,
    required this.partner,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              partner,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryPurple,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              description,
              style: TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
