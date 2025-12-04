// lib/ui/widgets/avalyst_drawer.dart
import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../screens/payment_data_screen.dart';
import '../screens/documents_screen.dart';
import '../screens/support_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/login_screen.dart';

class AvalystDrawer extends StatelessWidget {
  const AvalystDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const _DrawerHeader(),
            const Divider(),
            _DrawerItem(
              icon: Icons.credit_card_outlined,
              title: 'Dados de Pagamento',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, PaymentDataScreen.routeName);
              },
            ),
            _DrawerItem(
              icon: Icons.description_outlined,
              title: 'Meus Contratos & Documentos',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, DocumentsScreen.routeName);
              },
            ),
            _DrawerItem(
              icon: Icons.support_agent_outlined,
              title: 'Suporte',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, SupportScreen.routeName);
              },
            ),
            _DrawerItem(
              icon: Icons.person_outline,
              title: 'Meu Perfil',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, ProfileScreen.routeName);
              },
            ),
            const Spacer(),
            const Divider(),
            _DrawerItem(
              icon: Icons.logout,
              title: 'Sair',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  LoginScreen.routeName,
                  (_) => false,
                );
              },
              color: AppColors.error,
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: AppColors.primaryPurpleLight,
        child: const Icon(Icons.home_outlined, color: AppColors.primaryPurple),
      ),
      title: const Text(
        'App do Inquilino Avalyst',
        style: AppTextStyles.titleMedium,
      ),
      subtitle: const Text(
        'Gerencie seu aluguel com segurança.',
        style: AppTextStyles.bodySecondary,
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? color;

  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: color ?? AppColors.textPrimary),
      title: Text(
        title,
        style: AppTextStyles.bodyRegular.copyWith(
          color: color ?? AppColors.textPrimary,
        ),
      ),
      onTap: onTap,
    );
  }
}
