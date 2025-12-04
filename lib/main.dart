// lib/main.dart
import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'ui/screens/splash_screen.dart';
import 'ui/screens/login_screen.dart';
import 'ui/widgets/main_scaffold.dart';
import 'ui/screens/contract_details_screen.dart';
import 'ui/screens/documents_screen.dart';
import 'ui/screens/support_screen.dart';
import 'ui/screens/club_screen.dart';
import 'ui/screens/payment_data_screen.dart';
import 'ui/screens/profile_screen.dart';

void main() {
  runApp(const AvalystApp());
}

class AvalystApp extends StatelessWidget {
  const AvalystApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App do Inquilino Avalyst',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        MainScaffold.routeName: (_) => const MainScaffold(),
        ContractDetailsScreen.routeName: (_) => const ContractDetailsScreen(),
        DocumentsScreen.routeName: (_) => const DocumentsScreen(),
        SupportScreen.routeName: (_) => const SupportScreen(),
        ClubScreen.routeName: (_) => const ClubScreen(),
        PaymentDataScreen.routeName: (_) => const PaymentDataScreen(),
        ProfileScreen.routeName: (_) => const ProfileScreen(),
      },
    );
  }
}
