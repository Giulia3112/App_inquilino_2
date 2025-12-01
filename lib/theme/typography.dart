import 'package:flutter/material.dart';
import 'colors.dart';

/// Estilos de tipografia do manual de design
class AppTypography {
  AppTypography._();

  // Font families
  static const String fontFamilyGothamRounded = 'Gotham Rounded';
  static const String fontFamilySegoeUI = 'Segoe UI';

  // Font sizes
  static const double fontSize10 = 10.0;
  static const double fontSize12 = 12.0;
  static const double fontSize13 = 13.0;
  static const double fontSize14 = 14.0;
  static const double fontSize18 = 18.0;
  static const double fontSize20 = 20.0;
  static const double fontSize24 = 24.0;
  static const double fontSize28 = 28.0;

  // Line heights
  static const double lineHeight20 = 20.0;
  static const double lineHeight25 = 25.0;
  static const double lineHeight28 = 28.0;
  static const double lineHeight30 = 30.0;

  // Letter spacing
  static const double letterSpacingNeg02 = -0.2;
  static const double letterSpacingNeg048 = -0.48;
  static const double letterSpacingNeg084 = -0.84;
  static const double letterSpacingNeg036 = -0.36;
  static const double letterSpacing025 = 0.25;
  static const double letterSpacing033 = 0.33;
  static const double letterSpacing035 = 0.35;
  static const double letterSpacing03 = 0.3;

  /// Character Style 1
  /// Segoe UI, normal, 10px, line-height 20px, letter-spacing 0.25px, color #1A3057
  static TextStyle characterStyle1 = TextStyle(
    fontFamily: fontFamilySegoeUI,
    fontWeight: FontWeight.normal,
    fontSize: fontSize10,
    height: lineHeight20 / fontSize10,
    letterSpacing: letterSpacing025,
    color: AppColors.unnamedColor1a3057,
  );

  /// Character Style 2
  /// Segoe UI, 600, 12px, line-height 20px, letter-spacing 0.3px, color #1A3057
  static TextStyle characterStyle2 = TextStyle(
    fontFamily: fontFamilySegoeUI,
    fontWeight: FontWeight.w600,
    fontSize: fontSize12,
    height: lineHeight20 / fontSize12,
    letterSpacing: letterSpacing03,
    color: AppColors.unnamedColor1a3057,
  );

  /// Character Style 3
  /// Segoe UI, normal, 13px, line-height 20px, letter-spacing 0.33px, color #1A3057
  static TextStyle characterStyle3 = TextStyle(
    fontFamily: fontFamilySegoeUI,
    fontWeight: FontWeight.normal,
    fontSize: fontSize13,
    height: lineHeight20 / fontSize13,
    letterSpacing: letterSpacing033,
    color: AppColors.unnamedColor1a3057,
  );

  /// Character Style 4
  /// Segoe UI, normal, 14px, line-height 20px, letter-spacing 0.35px, color #FFFFFF
  static TextStyle characterStyle4 = TextStyle(
    fontFamily: fontFamilySegoeUI,
    fontWeight: FontWeight.normal,
    fontSize: fontSize14,
    height: lineHeight20 / fontSize14,
    letterSpacing: letterSpacing035,
    color: AppColors.unnamedColorFfffff,
  );

  /// Character Style 5
  /// Gotham Rounded, normal, 18px, line-height 25px, letter-spacing -0.36px, color #FFFFFF
  static TextStyle characterStyle5 = TextStyle(
    fontFamily: fontFamilyGothamRounded,
    fontWeight: FontWeight.normal,
    fontSize: fontSize18,
    height: lineHeight25 / fontSize18,
    letterSpacing: letterSpacingNeg036,
    color: AppColors.unnamedColorFfffff,
  );

  /// Character Style 6
  /// Gotham Rounded, medium, 24px, line-height 25px, letter-spacing -0.48px, color #FFFFFF
  static TextStyle characterStyle6 = TextStyle(
    fontFamily: fontFamilyGothamRounded,
    fontWeight: FontWeight.w500,
    fontSize: fontSize24,
    height: lineHeight25 / fontSize24,
    letterSpacing: letterSpacingNeg048,
    color: AppColors.unnamedColorFfffff,
  );

  /// Character Style 7
  /// Gotham Rounded, medium, 20px, line-height 28px, letter-spacing -0.2px, color #96C83C
  static TextStyle characterStyle7 = TextStyle(
    fontFamily: fontFamilyGothamRounded,
    fontWeight: FontWeight.w500,
    fontSize: fontSize20,
    height: lineHeight28 / fontSize20,
    letterSpacing: letterSpacingNeg02,
    color: AppColors.unnamedColor96c83c,
  );

  /// Character Style 8
  /// Gotham Rounded, medium, 20px, line-height 28px, letter-spacing -0.2px, color #FFFFFF
  static TextStyle characterStyle8 = TextStyle(
    fontFamily: fontFamilyGothamRounded,
    fontWeight: FontWeight.w500,
    fontSize: fontSize20,
    height: lineHeight28 / fontSize20,
    letterSpacing: letterSpacingNeg02,
    color: AppColors.unnamedColorFfffff,
  );

  /// Character Style 9
  /// Gotham Rounded, medium, 28px, line-height 30px, letter-spacing -0.84px, color #96C83C
  static TextStyle characterStyle9 = TextStyle(
    fontFamily: fontFamilyGothamRounded,
    fontWeight: FontWeight.w500,
    fontSize: fontSize28,
    height: lineHeight30 / fontSize28,
    letterSpacing: letterSpacingNeg084,
    color: AppColors.unnamedColor96c83c,
  );
}

