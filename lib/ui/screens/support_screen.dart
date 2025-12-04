import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Suporte Avalyst'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Como podemos te ajudar?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Escolha uma opção abaixo ou envie uma mensagem para nossa equipe.',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 24),
              _SupportOptionTile(
                icon: Icons.chat_bubble_outline,
                title: 'Chat com a equipe Avalyst',
                subtitle: 'Fale com nosso atendimento sobre sua garantia.',
                onTap: () {
                  // TODO: Implementar navegação para chat/contato
                },
              ),
              _SupportOptionTile(
                icon: Icons.phone_outlined,
                title: 'Central de atendimento',
                subtitle: 'Ligue para tirar dúvidas urgentes.',
                onTap: () {
                  // TODO: Implementar ligação ou exibição de número
                },
              ),
              _SupportOptionTile(
                icon: Icons.email_outlined,
                title: 'E-mail de suporte',
                subtitle: 'Envie uma solicitação detalhada para nossa equipe.',
                onTap: () {
                  // TODO: Implementar redirecionamento para e-mail
                },
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryPurple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // TODO: Implementar abertura de ticket/mensagem
                  },
                  child: const Text(
                    'Abrir chamado',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _SupportOptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _SupportOptionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: AppColors.primaryPurple.withOpacity(0.08),
          child: Icon(
            icon,
            color: AppColors.primaryPurple,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 13,
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
