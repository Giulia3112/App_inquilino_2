// lib/ui/widgets/app_menu_drawer.dart
import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

import '../screens/profile_screen.dart';
import '../screens/card_data_screen.dart';
import '../screens/contact_screen.dart';
import '../screens/club_screen.dart';
import '../screens/support_screen.dart';
import '../screens/login_screen.dart';
import '../screens/documents_screen.dart';

class AppMenuDrawer extends StatelessWidget {
  const AppMenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Drawer(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          width: size.width, // ocupa praticamente toda a largura
          decoration: const BoxDecoration(
            color: Color(0xFF0C2F5C), // azul escuro Avalyst
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSearchBar(context),
                  const SizedBox(height: 24),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Wrap(
                        spacing: 24,
                        runSpacing: 24,
                        children: [
                          _MenuIconCard(
                            icon: Icons.person_outline,
                            label: 'Perfil',
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(
                                context,
                                ProfileScreen.routeName,
                              );
                            },
                          ),
                          _MenuIconCard(
                            icon: Icons.credit_card_outlined,
                            label: 'Dados de cartão',
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(
                                context,
                                CardDataScreen.routeName,
                              );
                            },
                          ),
                          _MenuIconCard(
                            icon: Icons.description_outlined,
                            label: 'Documentos',
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(
                                context,
                                DocumentsScreen.routeName,
                              );
                            },
                          ),
                          _MenuIconCard(
                            icon: Icons.local_offer_outlined,
                            label: 'Clube de vantagens',
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(
                                context,
                                ClubScreen.routeName,
                              );
                            },
                          ),
                          _MenuIconCard(
                            icon: Icons.notifications_none,
                            label: 'Notificações',
                            onTap: () {
                              // TODO: criar tela de notificações, se necessário
                            },
                          ),
                          _MenuIconCard(
                            icon: Icons.headset_mic_outlined,
                            label: 'Suporte',
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(
                                context,
                                SupportScreen.routeName,
                              );
                            },
                          ),
                          _MenuIconCard(
                            icon: Icons.chat_outlined,
                            label: 'Contato',
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(
                                context,
                                ContactScreen.routeName,
                              );
                            },
                          ),
                          _MenuIconCard(
                            icon: Icons.exit_to_app,
                            label: 'Sair',
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                LoginScreen.routeName,
                                (route) => false,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF1C4474),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: const [
                Icon(
                  Icons.search,
                  color: AppColors.avalystGreen,
                  size: 18,
                ),
                SizedBox(width: 8),
                Text(
                  'O que você procura?',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.white,
            size: 22,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

class _MenuIconCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _MenuIconCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 72,
            width: 72,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(
              icon,
              size: 34,
              color: AppColors.avalystGreen,
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: 80,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.white,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
