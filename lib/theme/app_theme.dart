import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final base = ThemeData.light();

    return base.copyWith(
      useMaterial3: false,
      primaryColor: AppColors.primaryPurple,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.textPrimary),
        titleTextStyle: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      colorScheme: base.colorScheme.copyWith(
        primary: AppColors.primaryPurple,
        secondary: AppColors.accentGreen,
        background: AppColors.backgroundLight,
      ),
      textTheme: base.textTheme.apply(
        bodyColor: AppColors.textPrimary,
        displayColor: AppColors.textPrimary,
        fontFamily: 'Roboto',
      ),
      cardTheme: CardTheme(
        color: AppColors.cardBackground,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.borderColor),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primaryPurple,
        unselectedItemColor: AppColors.textSecondary,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryPurple,
        foregroundColor: Colors.white,
      ),
    );
  }

  static ThemeData get darkTheme {
    final base = ThemeData.dark();

    return base.copyWith(
      useMaterial3: false,
      primaryColor: AppColors.primaryPurple,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundDark,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      colorScheme: base.colorScheme.copyWith(
        primary: AppColors.primaryPurple,
        secondary: AppColors.accentGreen,
        background: AppColors.backgroundDark,
      ),
      cardTheme: CardTheme(
        color: const Color(0xFF202033),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.white.withOpacity(0.05)),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF15151F),
        selectedItemColor: AppColors.primaryPurple,
        unselectedItemColor: AppColors.textSecondary,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryPurple,
        foregroundColor: Colors.white,
      ),
    );
  }
}
