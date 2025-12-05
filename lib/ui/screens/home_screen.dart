// lib/ui/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../widgets/app_menu_drawer.dart';
import 'rent_management_screen.dart';
import 'debt_negotiation_screen.dart';

enum GuaranteeStatus {
  upToDate,
  overdue,
}

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  final GuaranteeStatus status;

  const HomeScreen({
    super.key,
    this.status = GuaranteeStatus.overdue, // Por padrão mostra em atraso conforme imagem
  });

  bool get _isOverdue => status == GuaranteeStatus.overdue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppMenuDrawer(),
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    _buildGuaranteeCard(context),
                    const SizedBox(height: 16),
                    _buildClubeAvalystCard(),
                    const SizedBox(height: 16),
                    _buildAcertoFacilCard(context),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- HEADER ----------------
  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF003A70),
            Color(0xFF005C9E),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'app do inquilino',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Text(
                'Avalyst',
                style: TextStyle(
                  color: Color(0xFFFFC928),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.white,
            ),
            onPressed: () {
              // TODO: navegar para notificações
            },
          ),
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ],
      ),
    );
  }

  // ---------------- CARD GARANTIA ----------------
  Widget _buildGuaranteeCard(BuildContext context) {
    if (_isOverdue) {
      // Versão "Sua Garantia locatícia em atraso" (card amarelo)
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFFFC928),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ícone de escudo azul com cifrão
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFF1A3057),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.attach_money,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sua Garantia locatícia em atraso',
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.avalystGreen,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RentManagementScreen.routeName,
                        );
                      },
                      child: const Text(
                        'Realizar o pagamento',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Para manter a sua locação.',
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      // Versão "Sua Garantia locatícia está em dia" (card azul claro)
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF00AEEF),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Sua Garantia locatícia\nestá em dia',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Aproveite as vantagens Avalyst',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      );
    }
  }

  // ---------------- CARD CLUBE AVALYST ----------------
  Widget _buildClubeAvalystCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF00A58C),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo Clube Avalyst
          Row(
            children: [
              const Text(
                'Clube',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 4),
              // Ícone de setas duplas
              const Icon(
                Icons.double_arrow,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: 4),
              const Text(
                'Avalyst',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          RichText(
            text: const TextSpan(
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                height: 1.3,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(text: 'Aproveite agora os descontos\ne cashback em mais de '),
                TextSpan(
                  text: '3 mil',
                  style: TextStyle(
                    color: Color(0xFFFFC928),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(text: ' marcas parceiras.'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Imagem dos punhos e texto "#do seu lado"
          Row(
            children: [
              // Imagem dos punhos fazendo fist bump
              Image.asset(
                'assets/images/fist_bump.png',
                width: 60,
                height: 60,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.handshake,
                      color: Colors.white,
                      size: 32,
                    ),
                  );
                },
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '#do',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'seu lado',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------- CARD ACERTO FÁCIL ----------------
  Widget _buildAcertoFacilCard(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.pushNamed(context, DebtNegotiationScreen.routeName);
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Logo Acerto Fácil
              Image.asset(
                'assets/images/logo_acerto_facil.png',
                width: 56,
                height: 56,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A3057),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        const Center(
                          child: Text(
                            'acerto\nfácil',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Positioned(
                          top: -4,
                          right: -4,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                              color: AppColors.avalystGreen,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.check,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Negocie suas pendências',
                      style: TextStyle(
                        color: Color(0xFF003A70),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'sem',
                      style: TextStyle(
                        color: Color(0xFF003A70),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
