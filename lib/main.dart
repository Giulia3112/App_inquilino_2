import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'theme/app_theme.dart';

import 'ui/screens/splash_screen.dart';
import 'ui/screens/welcome_screen.dart';
import 'ui/screens/login_screen.dart';
import 'ui/screens/main_shell_screen.dart';
import 'ui/screens/home_screen.dart';
import 'ui/screens/support_screen.dart';
import 'ui/screens/club_screen.dart';
import 'ui/screens/profile_screen.dart';
import 'ui/screens/signup_screen.dart';
import 'ui/screens/no_proposal_screen.dart';
import 'ui/screens/rent_management_screen.dart';
import 'ui/screens/contract_details_screen.dart';
import 'ui/screens/inform_move_out_screen.dart';
import 'ui/screens/move_out_confirmed_screen.dart';
import 'ui/screens/send_request_screen.dart';
import 'ui/screens/send_request_success_screen.dart';
import 'ui/screens/documents_screen.dart';
import 'ui/screens/card_data_screen.dart';
import 'ui/screens/rent_payment_screen.dart';
import 'ui/screens/debt_negotiation_screen.dart';
import 'ui/screens/contact_screen.dart';
import 'ui/screens/edit_profile_screen.dart';

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
        WelcomeScreen.routeName: (_) => const WelcomeScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        SignupScreen.routeName: (_) => const SignupScreen(),
        NoProposalScreen.routeName: (_) => const NoProposalScreen(),

        MainShellScreen.routeName: (_) => const MainShellScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),

        SupportScreen.routeName: (_) => const SupportScreen(),
        ClubScreen.routeName: (_) => const ClubScreen(),
        ProfileScreen.routeName: (_) => const ProfileScreen(),

        SendRequestScreen.routeName: (_) => const SendRequestScreen(),
        SendRequestSuccessScreen.routeName: (_) =>
            const SendRequestSuccessScreen(),

        DocumentsScreen.routeName: (_) => const DocumentsScreen(),
        CardDataScreen.routeName: (_) => const CardDataScreen(),

        RentManagementScreen.routeName: (_) => const RentManagementScreen(),
        ContractDetailsScreen.routeName: (_) =>
            const ContractDetailsScreen(),
        InformMoveOutScreen.routeName: (_) =>
            const InformMoveOutScreen(),
        MoveOutConfirmedScreen.routeName: (_) =>
            const MoveOutConfirmedScreen(),

        RentPaymentScreen.routeName: (_) => const RentPaymentScreen(),
        DebtNegotiationScreen.routeName: (_) =>
            const DebtNegotiationScreen(),

        ContactScreen.routeName: (_) => const ContactScreen(),

        EditProfileScreen.routeName: (_) => const EditProfileScreen(),
      },

      locale: const Locale('pt', 'BR'),
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
