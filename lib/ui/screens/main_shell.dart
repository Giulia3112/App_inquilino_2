import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import 'home_screen.dart';
import 'support_screen.dart';
import 'club_avalyst_screen.dart';
import 'profile_screen.dart';

class MainShellScreen extends StatefulWidget {
  const MainShellScreen({super.key});

  @override
  State<MainShellScreen> createState() => _MainShellScreenState();
}

class _MainShellScreenState extends State<MainShellScreen> {
  int _currentIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = const [
      HomeScreen(),
      // Aqui você pode trocar futuramente por uma tela específica de aluguel/pagamentos
      HomeScreen(), // placeholder para "Aluguel"
      SupportScreen(),
      ClubAvalystScreen(),
      ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            label: 'Aluguel',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.headset_mic_outlined),
            label: 'Suporte',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard_outlined),
            label: 'Clube',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
