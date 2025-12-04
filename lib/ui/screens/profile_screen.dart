// lib/ui/screens/profile_screen.dart

import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 36,
            backgroundColor: AppColors.primaryPurpleLight,
            child: Icon(Icons.person_outline, size: 32),
          ),
          const SizedBox(height: 12),
          const Text(
            'Nome do Inquilino',
            style: AppTextStyles.titleMedium,
          ),
          const SizedBox(height: 4),
          const Text(
            'email@exemplo.com',
            style: AppTextStyles.bodySecondary,
          ),
          const SizedBox(height: 24),
          ListTile(
            leading: const Icon(Icons.phone_outlined),
            title: const Text('Telefone', style: AppTextStyles.bodyRegular),
            subtitle: const Text(
              '(41) 99999-9999',
              style: AppTextStyles.bodySecondary,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.badge_outlined),
            title: const Text('CPF', style: AppTextStyles.bodyRegular),
            subtitle: const Text(
              '000.000.000-00',
              style: AppTextStyles.bodySecondary,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

