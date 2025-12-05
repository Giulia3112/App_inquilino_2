import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F9),
      body: Column(
        children: [
          _buildHeader(context),
          const SizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  // Card de "Contrato de garantia locatícia"
                  Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.home_outlined,
                            color: AppColors.avalystGreen,
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              '1\nContrato de garantia locatícia',
                              style: TextStyle(
                                color: Color(0xFF203555),
                                height: 1.4,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Configurações
                  Row(
                    children: const [
                      Text(
                        'Configurações',
                        style: TextStyle(
                          color: Color(0xFF203555),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.edit,
                        color: AppColors.avalystGreen,
                        size: 18,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const _ProfileOptionTile(
                    icon: Icons.person_outline,
                    label: 'Informações pessoais',
                  ),
                  const _ProfileOptionTile(
                    icon: Icons.lock_outline,
                    label: 'Login e segurança',
                  ),
                  const _ProfileOptionTile(
                    icon: Icons.mail_outline,
                    label: 'Email e telefone',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 48,
        left: 20,
        right: 20,
        bottom: 20,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            AppColors.avalystBlueLight,
            AppColors.avalystBlueMid,
            AppColors.avalystBlueDark,
          ],
          stops: [0.0, 0.773, 1.0],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Perfil',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  // TODO: abrir menu
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Avatar circular
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(
                  'assets/images/avatar_placeholder.png',
                ), // TODO: trocar pela foto real/origem de rede
              ),
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.avalystGreen,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(4),
                child: const Icon(
                  Icons.edit,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'JOÃO SANTOS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileOptionTile extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ProfileOptionTile({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      child: ListTile(
        leading: Icon(
          icon,
          color: AppColors.avalystGreen,
        ),
        title: Text(
          label,
          style: const TextStyle(
            color: Color(0xFF203555),
            fontSize: 14,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Color(0xFF203555),
        ),
        onTap: () {
          // TODO: navegação para detalhe de configuração
        },
      ),
    );
  }
}
