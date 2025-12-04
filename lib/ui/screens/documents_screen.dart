// lib/ui/screens/documents_screen.dart

import 'package:flutter/material.dart';
import '../../theme/app_text_styles.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({super.key});

  static const routeName = '/documents';

  @override
  Widget build(BuildContext context) {
    final docs = [
      'Contrato de Locação',
      'Vistoria Inicial',
      'Comprovante de Pagamento - Janeiro',
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        itemBuilder: (_, index) {
          return ListTile(
            leading: const Icon(Icons.description_outlined),
            title: Text(docs[index], style: AppTextStyles.bodyRegular),
            subtitle: const Text(
              'Toque para visualizar',
              style: AppTextStyles.bodySecondary,
            ),
            onTap: () {
              // TODO: abrir visualização de PDF/documento
            },
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: docs.length,
      ),
    );
  }
}

