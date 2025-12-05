import 'package:flutter/material.dart';
import '../widgets/app_menu_drawer.dart';
import '../widgets/app_header.dart';

enum GuaranteeStatus {
  upToDate,
  overdue,
}

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  final GuaranteeStatus status;

  const HomeScreen({
    super.key,
    this.status = GuaranteeStatus.upToDate,
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
            AppHeader(title: 'Inquilino Avalyst'), // 👈 sem const aqui

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    _buildGuaranteeCard(),
                    const SizedBox(height: 16),
                    _buildClubeAvalystCard(),
                    const SizedBox(height: 16),
                    _buildAcertoFacilCard(),
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

  // ------------- CARD GARANTIA --------------

  Widget _buildGuaranteeCard() {
    if (_isOverdue) {
      // Versão "em atraso"
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFFFC928),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sua Garantia locatícia\nem atraso',
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6CC24A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  // TODO: ir para pagamento
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
              ),
            ),
          ],
        ),
      );
    } else {
      // Versão "está em dia"
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

  // ------------- CARD CLUBE AVALYST -------------

  Widget _buildClubeAvalystCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF00A58C),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Text(
        'Clube Avalyst\nAproveite agora os descontos e cashback em mais de 3 mil marcas parceiras.',
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          height: 1.3,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // ------------- CARD ACERTO FÁCIL -------------

  Widget _buildAcertoFacilCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFE7F3FF),
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: const Text(
              'AF',
              style: TextStyle(
                color: Color(0xFF003A70),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              'Negocie suas pendências\nsem stress',
              style: TextStyle(
                color: Color(0xFF003A70),
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
