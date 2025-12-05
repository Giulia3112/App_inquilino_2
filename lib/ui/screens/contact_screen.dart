import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../widgets/app_header.dart';
import '../widgets/app_menu_drawer.dart';

class ContactScreen extends StatelessWidget {
  static const String routeName = '/contact';

  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppMenuDrawer(),
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Column(
          children: [
            const AppHeader(title: 'Contato'),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Fale com a gente',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF203555),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Escolha a melhor forma de atendimento para tirar suas dúvidas '
                      'ou falar sobre seu contrato.',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF4F5B6C),
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 24),

                    _ContactTile(
                      icon: Icons.chat_bubble_outline,
                      title: 'Chat / WhatsApp',
                      subtitle:
                          'Atendimento rápido para dúvidas sobre aluguel, garantia e boletos.',
                      onTap: () {
                        // TODO: abrir link / deep link do WhatsApp ou chat
                      },
                    ),
                    const SizedBox(height: 12),

                    _ContactTile(
                      icon: Icons.phone_in_talk_outlined,
                      title: 'Telefone',
                      subtitle:
                          'Fale com a central de atendimento em horário comercial.',
                      onTap: () {
                        // TODO: iniciar ligação (tel:)
                      },
                    ),
                    const SizedBox(height: 12),

                    _ContactTile(
                      icon: Icons.mail_outline,
                      title: 'E-mail',
                      subtitle:
                          'Envie documentos ou demandas que precisam de análise detalhada.',
                      onTap: () {
                        // TODO: abrir app de e-mail
                      },
                    ),

                    const SizedBox(height: 32),
                    const Text(
                      'Atendimento',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF203555),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Segunda a sexta, das 9h às 18h\nHorário de Brasília (exceto feriados).',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF4F5B6C),
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ContactTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFE6F8E7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.chat_bubble_outline,
                color: AppColors.avalystGreen,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF203555),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF4F5B6C),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
