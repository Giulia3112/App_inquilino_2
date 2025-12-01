import 'package:flutter/material.dart';

class RentManagementScreen extends StatelessWidget {
  const RentManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _ActionTile(
              icon: Icons.shield_outlined,
              label: 'Garantia locatícia',
              onTap: () {
                // TODO: navega para tela de garantia (em dia / em atraso)
              },
            ),
            _ActionTile(
              icon: Icons.receipt_long_outlined,
              label: 'Pagamento do aluguel',
              onTap: () {
                // TODO: navega para pagamento
              },
            ),
            _ActionTile(
              icon: Icons.check_circle_outline,
              label: 'Negociação de débito',
              onTap: () {
                // TODO
              },
            ),
            _ActionTile(
              icon: Icons.exit_to_app_outlined,
              label: 'Informar desocupação',
              onTap: () {
                // TODO
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: const Color(0xFF96C83C)),
              const SizedBox(height: 12),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'SegoeUI',
                  fontSize: 13,
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