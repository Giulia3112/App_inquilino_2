import 'package:flutter/material.dart';
import 'package:app_inquilino_2/ui/screens/components/avalyst_top_bar.dart';

class ClubScreen extends StatelessWidget {
  const ClubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AvalystTopBar(
        title: 'Clube Avalyst',
        showMenu: true,
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // ------- BANNER PRINCIPAL -------
            _ClubBanner(
              title: 'Aproveite agora os descontos e cashback\ndas nossas marcas parceiras!',
              backgroundColor: const Color(0xFF009483),
            ),

            const SizedBox(height: 20),

            // ------- CARD EXTRA (placeholder) -------
            _ClubBanner(
              title: 'Benefícios exclusivos Avalyst\nem breve!',
              backgroundColor: const Color(0xFF96C83C),
            ),

            const SizedBox(height: 20),

            // ------- CARD FAKE DE FUTUROS BENEFÍCIOS -------
            _ClubOption(
              icon: Icons.local_offer_outlined,
              title: 'Ver cupons disponíveis',
              onTap: () {},
            ),

            const SizedBox(height: 20),

            _ClubOption(
              icon: Icons.card_giftcard_outlined,
              title: 'Cashback acumulado',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _ClubBanner extends StatelessWidget {
  final String title;
  final Color backgroundColor;

  const _ClubBanner({
    required this.title,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontFamily: 'SegoeUI',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _ClubOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ClubOption({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      elevation: 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
          child: Row(
            children: [
              Icon(icon, size: 30, color: const Color(0xFF1A3057)),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'SegoeUI',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1A3057),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
