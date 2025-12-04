// lib/ui/screens/home_screen.dart

import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import 'contract_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // por enquanto fixo; depois você liga em dados reais
  final bool _garantiaEmDia = true;

  @override
  Widget build(BuildContext context) {
    // truque pra acessar _garantiaEmDia como const field:
    const bool garantiaEmDia = true;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          Text(
            'Olá, inquilino!',
            style: AppTextStyles.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Veja o status da sua garantia e próximos pagamentos.',
            style: AppTextStyles.bodySecondary,
          ),
          const SizedBox(height: 16),
          _StatusCard(garantiaEmDia: garantiaEmDia),
          const SizedBox(height: 16),
          Text(
            'Contrato atual',
            style: AppTextStyles.titleMedium,
          ),
          const SizedBox(height: 8),
          _ContractCard(
            onTap: () {
              Navigator.pushNamed(
                context,
                ContractDetailsScreen.routeName,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _StatusCard extends StatelessWidget {
  final bool garantiaEmDia;

  const _StatusCard({required this.garantiaEmDia});

  @override
  Widget build(BuildContext context) {
    final color = garantiaEmDia ? AppColors.success : AppColors.warning;
    final title =
        garantiaEmDia ? 'Sua garantia está em dia' : 'Garantia em atraso';
    final subtitle = garantiaEmDia
        ? 'Nenhuma ação é necessária no momento.'
        : 'Regularize sua garantia para evitar problemas com o aluguel.';

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.1),
              child: Icon(
                garantiaEmDia ? Icons.check : Icons.warning_amber_outlined,
                color: color,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.titleMedium),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: AppTextStyles.bodySecondary,
                  ),
                ],
              ),
            ),
            if (!garantiaEmDia)
              TextButton(
                onPressed: () {
                  // TODO: navega pra tela de regularização
                },
                child: const Text('Regularizar'),
              ),
          ],
        ),
      ),
    );
  }
}

class _ContractCard extends StatelessWidget {
  final VoidCallback onTap;

  const _ContractCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const Icon(Icons.apartment_outlined),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Apartamento - Centro, Curitiba',
                      style: AppTextStyles.bodyRegular,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Aluguel: R\$ 2.500,00 • Vencimento dia 10',
                      style: AppTextStyles.bodySecondary,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
