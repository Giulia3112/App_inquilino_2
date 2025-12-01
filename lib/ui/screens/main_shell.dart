import 'package:flutter/material.dart';
import 'package:app_inquilino_2/ui/screens/components/avalyst_top_bar.dart';
import 'package:app_inquilino_2/ui/screens/home_screen.dart';
import 'package:app_inquilino_2/ui/screens/rent_management_screen.dart';
import 'package:app_inquilino_2/ui/screens/support_screen.dart';
import 'package:app_inquilino_2/ui/screens/club_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  final _titles = const [
    'Início',
    'Gestão do Aluguel',
    'Suporte',
    'Clube Avalyst',
  ];

  late final List<Widget> _pages = const [
    HomeScreen(),
    RentManagementScreen(),
    SupportScreen(),
    ClubScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AvalystTopBar(
        title: _titles[_currentIndex],
        showMenu: true,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFF96C83C),
        unselectedItemColor: const Color(0xFF6F6F6F),
        type: BottomNavigationBarType.fixed,
        onTap: (i) => setState(() => _currentIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.vpn_key_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.headset_mic_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer_outlined), label: ''),
        ],
      ),
    );
  }
}
