// lib/ui/widgets/main_scaffold.dart
import 'package:flutter/material.dart';
import '../../theme/app_text_styles.dart';
import '../../theme/app_colors.dart';
import '../screens/home_screen.dart';
import '../screens/documents_screen.dart';
import '../screens/support_screen.dart';
import '../screens/club_screen.dart';
import '../screens/profile_screen.dart';
import 'avalyst_drawer.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  static const routeName = '/main';

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;

  final _screens = const [
    HomeScreen(),
    DocumentsScreen(),
    SupportScreen(),
    ClubScreen(),
    ProfileScreen(),
  ];

  final _titles = const [
    'Resumo do Aluguel',
    'Documentos',
    'Suporte',
    'Clube Avalyst',
    'Meu Perfil',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AvalystDrawer(),
      appBar: AppBar(
        title: Text(
          _titles[_currentIndex],
          style: AppTextStyles.titleMedium,
        ),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _screens,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description_outlined),
            label: 'Docs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent_outlined),
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
      backgroundColor: AppColors.background,
    );
  }
}
