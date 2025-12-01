import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Por enquanto, dados mockados. Depois podemos buscar da API.
    final bool garantiaEmDia = true; // troque para false para ver o outro card

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Card de status da Garantia
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: garantiaEmDia
                    ? const Color(0xFF00AEEF) // azul quando em dia
                    : const Color(0xFFFDC300), // amarelo quando em atraso
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.verified_user,
                    color: garantiaEmDia ? Colors.white : Colors.black87,
                    size: 32,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    garantiaEmDia
                        ? 'Sua Garantia locatícia está em dia'
                        : 'Sua Garantia locatícia em atraso',
                    style: TextStyle(
                      color: garantiaEmDia ? Colors.white : Colors.black87,
                      fontFamily: 'GothamRounded',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    garantiaEmDia
                        ? 'Aproveite as vantagens Avalyst'
                        : 'Realizar o pagamento para manter a sua locação.',
                    style: TextStyle(
                      color: garantiaEmDia
                          ? Colors.white.withOpacity(0.9)
                          : Colors.black87,
                      fontFamily: 'SegoeUI',
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (!garantiaEmDia)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF96C83C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        // TODO: navegar para tela de garantia locatícia
                      },
                      child: const Text(
                        'Realizar o pagamento',
                        style: TextStyle(
                          fontFamily: 'SegoeUI',
                          fontSize: 14,
                        ),
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Card Clube Avalyst
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF009483), // verde turquesa do clube
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Clube Avalyst',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'GothamRounded',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Aproveite agora os descontos e cashback\nem mais de 3 mil marcas parceiras.',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SegoeUI',
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Card Acerto Fácil
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Acerto Fácil Avalyst',
                    style: TextStyle(
                      color: Color(0xFF1A3057),
                      fontFamily: 'GothamRounded',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Negocie suas pendências sem stress.',
                    style: TextStyle(
                      color: Color(0xFF1A3057),
                      fontFamily: 'SegoeUI',
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
