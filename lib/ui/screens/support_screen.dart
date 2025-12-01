import 'package:flutter/material.dart';
import 'package:app_inquilino_2/ui/screens/components/avalyst_top_bar.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AvalystTopBar(
        title: 'Suporte',
        showMenu: true,
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // -------- WHATSAPP AVALYST --------
            _SupportOption(
              title: 'WhatsApp Avalyst',
              icon: Icons.phone_in_talk_outlined,
              onTap: () {
                // aqui depois você pode colocar um launchUrl() para abrir o WhatsApp
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Abrir WhatsApp Avalyst (em breve)'),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            // -------- ENVIAR SOLICITAÇÃO --------
            _SupportOption(
              title: 'Enviar solicitação',
              icon: Icons.mark_chat_read_outlined,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const SupportRequestScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ---------- CARD DE OPÇÃO DE SUPORTE ----------
class _SupportOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _SupportOption({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.06),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
          child: Row(
            children: [
              Icon(
                icon,
                size: 36,
                color: const Color(0xFF96C83C), // verde Avalyst
              ),
              const SizedBox(width: 20),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'SegoeUI',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A3057), // azul texto
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------- TELA "ENVIAR SOLICITAÇÃO" ----------
class SupportRequestScreen extends StatelessWidget {
  const SupportRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AvalystTopBar(
        title: 'Envie uma solicitação',
        showBack: true,
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Assunto*',
              style: TextStyle(
                fontFamily: 'SegoeUI',
                fontSize: 13,
                color: Color(0xFF1A3057),
              ),
            ),
            const SizedBox(height: 4),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: Color(0xFFAAAAAA), width: 1),
                ),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'visita',
                  child: Text('Agendar visita'),
                ),
                DropdownMenuItem(
                  value: 'duvida',
                  child: Text('Dúvidas sobre contrato'),
                ),
              ],
              onChanged: (_) {},
            ),
            const SizedBox(height: 16),
            const Text(
              'Descreva sua solicitação*',
              style: TextStyle(
                fontFamily: 'SegoeUI',
                fontSize: 13,
                color: Color(0xFF1A3057),
              ),
            ),
            const SizedBox(height: 4),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                alignLabelWithHint: true,
                hintText: 'Digite aqui sua mensagem...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: Color(0xFFAAAAAA), width: 1),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF96C83C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Solicitação enviada com sucesso!'),
                  ),
                );
                Navigator.of(context).pop();
              },
              child: const Text(
                'Agendar visita',
                style: TextStyle(
                  fontFamily: 'GothamRounded',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
