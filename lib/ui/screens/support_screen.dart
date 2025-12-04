// lib/ui/screens/support_screen.dart

import 'package:flutter/material.dart';
import '../../theme/app_text_styles.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  static const routeName = '/support';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: const [
          Text(
            'Canais de atendimento',
            style: AppTextStyles.titleMedium,
          ),
          SizedBox(height: 16),
          _SupportItem(
            icon: Icons.whatsapp,
            title: 'WhatsApp',
            subtitle: '(99) 99999-9999',
          ),
          _SupportItem(
            icon: Icons.phone_in_talk_outlined,
            title: 'Telefone',
            subtitle: '(41) 3333-3333',
          ),
          _SupportItem(
            icon: Icons.email_outlined,
            title: 'E-mail',
            subtitle: 'suporte@avalyst.com',
          ),
        ],
      ),
    );
  }
}

class _SupportItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _SupportItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: AppTextStyles.bodyRegular),
      subtitle: Text(subtitle, style: AppTextStyles.bodySecondary),
      onTap: () {
        // TODO: integrar com url_launcher para abrir canal
      },
    );
  }
}
