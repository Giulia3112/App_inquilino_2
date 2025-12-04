// lib/ui/screens/contract_details_screen.dart

import 'package:flutter/material.dart';
import '../../theme/app_text_styles.dart';

class ContractDetailsScreen extends StatelessWidget {
  const ContractDetailsScreen({super.key});

  static const routeName = '/contractDetails';

  @override
  Widget build(BuildContext context) {
    final payments = [
      {'mes': 'Janeiro', 'valor': 'R\$ 2.500,00', 'pago': true},
      {'mes': 'Fevereiro', 'valor': 'R\$ 2.500,00', 'pago': true},
      {'mes': 'Março', 'valor': 'R\$ 2.500,00', 'pago': false},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Contrato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              'Apartamento - Centro, Curitiba',
              style: AppTextStyles.titleMedium,
            ),
            const SizedBox(height: 4),
            const Text(
              'Aluguel: R\$ 2.500,00 • Vencimento dia 10',
              style: AppTextStyles.bodySecondary,
            ),
            const SizedBox(height: 16),
            const Text(
              'Histórico de pagamentos',
              style: AppTextStyles.titleMedium,
            ),
            const SizedBox(height: 8),
            ...payments.map((p) {
              final pago = p['pago'] as bool;
              return ListTile(
                leading: Icon(
                  pago ? Icons.check_circle : Icons.radio_button_unchecked,
                  color: pago ? Colors.green : Colors.grey,
                ),
                title: Text(
                  '${p['mes']} - ${p['valor']}',
                  style: AppTextStyles.bodyRegular,
                ),
                subtitle: Text(
                  pago ? 'Pago' : 'Em aberto',
                  style: AppTextStyles.bodySecondary,
                ),
                onTap: () {
                  // TODO: abrir boleto/detalhe
                },
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

