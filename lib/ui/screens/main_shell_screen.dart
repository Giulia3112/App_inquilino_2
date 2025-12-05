import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'rent_management_screen.dart';
import 'contact_screen.dart';
import 'profile_screen.dart';

class MainShellScreen extends StatefulWidget {
  static const routeName = '/main-shell';

  const MainShellScreen({super.key});

  @override
  State<MainShellScreen> createState() => _MainShellScreenState();
}

class _MainShellScreenState extends State<MainShellScreen> {
  int _currentIndex = 0;

  late final List<Widget> _screens = [
    const HomeScreen(),               // Início
    const RentManagementScreen(),     // Gestão do aluguel
    const ContactScreen(),            // Contato
    const ProfileScreen(),            // Perfil
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBottomBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      selectedItemColor: const Color(0xFF6CC24A),
      unselectedItemColor: const Color(0xFF7A869A),
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() => _currentIndex = index);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Início",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.real_estate_agent_outlined),
          label: "Gestão",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_outlined), // Contato
          label: "Contato",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: "Perfil",
        ),
      ],
    );
  }
}
