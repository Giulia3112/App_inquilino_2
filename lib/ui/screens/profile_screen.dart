import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meu perfil'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 36,
                child: Icon(Icons.person, size: 40),
              ),
              const SizedBox(height: 12),
              const Text(
                'Nome do Inquilino',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'email@exemplo.com',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 24),
              Card(
                child: Column(
                  children: const [
                    _ProfileItem(
                      icon: Icons.home_outlined,
                      label: 'Meus imóveis',
                    ),
                    Divider(height: 0),
                    _ProfileItem(
                      icon: Icons.lock_outline,
                      label: 'Segurança da conta',
                    ),
                    Divider(height: 0),
                    _ProfileItem(
                      icon: Icons.description_outlined,
                      label: 'Documentos',
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.borderColor),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // TODO: Implementar logout
                  },
                  child: const Text(
                    'Sair da conta',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ProfileItem({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        label,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        // TODO: Implementar navegação
      },
    );
  }
}
