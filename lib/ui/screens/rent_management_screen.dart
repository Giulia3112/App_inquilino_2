import 'package:flutter/material.dart';

import '../widgets/app_header.dart';
import '../widgets/app_menu_drawer.dart';

import 'contract_details_screen.dart';
import 'inform_move_out_screen.dart';
import 'rent_payment_screen.dart';
import 'debt_negotiation_screen.dart';

class RentManagementScreen extends StatelessWidget {
  static const routeName = '/rent-management';

  const RentManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppMenuDrawer(),
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Column(
          children: [
            const AppHeader(title: 'Gestão do Aluguel'),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const SizedBox(height: 8),

                    // ---------------- LINHA 1 ----------------
                    Row(
                      children: [
                        Expanded(
                          child: _RentOption(
                            icon: Icons.shield_outlined,
                            label: 'Garantia\nlocatícia',
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                ContractDetailsScreen.routeName,
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _RentOption(
                            icon: Icons.receipt_long_outlined,
                            label: 'Pagamento\ndo aluguel',
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RentPaymentScreen.routeName,
                              );
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // ---------------- LINHA 2 ----------------
                    Row(
                      children: [
                        Expanded(
                          child: _RentOption(
                            icon: Icons.check_circle_outline,
                            label: 'Negociação\nde débito',
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                DebtNegotiationScreen.routeName,
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _RentOption(
                            icon: Icons.logout,
                            label: 'Informar\ndesocupação',
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                InformMoveOutScreen.routeName,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RentOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _RentOption({
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
            height: 96,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Icon(
                icon,
                size: 40,
                color: const Color(0xFF6CC24A), // verde Avalyst
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF4F5B6C),
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
