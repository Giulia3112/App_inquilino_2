// lib/theme/app_text_styles.dart

import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const _fontFamily = 'Roboto'; // troque se usar outra fonte

  static const titleLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const titleMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const bodyRegular = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static const bodySecondary = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static const button = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextTheme get textTheme => const TextTheme(
        titleLarge: titleLarge,
        titleMedium: titleMedium,
        bodyMedium: bodyRegular,
        bodySmall: bodySecondary,
      );
}
