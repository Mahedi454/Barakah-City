import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Type system for Barakah City.
///
/// Pairing:
///  - **Baloo 2** — rounded, friendly display face. Titles, the city name, and
///    all big "game score" numbers.
///  - **Inter** — clean humanist sans for body, labels, and dense HUD data.
///
/// Rule of thumb: at most two weights visible per screen, never pure black.
/// HUD numbers use tabular figures so digits don't jitter as values tick up.
class AppTypography {
  AppTypography._();

  static TextStyle _display(double size, double height, FontWeight weight) =>
      GoogleFonts.baloo2(
        fontSize: size,
        height: height / size,
        fontWeight: weight,
        color: AppColors.textDark,
      );

  static TextStyle _body(double size, double height, FontWeight weight) =>
      GoogleFonts.inter(
        fontSize: size,
        height: height / size,
        fontWeight: weight,
        color: AppColors.textDark,
      );

  // Display / Headings (Baloo 2)
  static TextStyle get displayXL => _display(32, 40, FontWeight.w700);
  static TextStyle get displayL => _display(26, 32, FontWeight.w700);
  static TextStyle get titleM => _display(20, 26, FontWeight.w600);

  /// Big resource counters — tabular figures keep the width stable.
  static TextStyle get hudNumber => _display(18, 22, FontWeight.w700).copyWith(
        fontFeatures: const <FontFeature>[FontFeature.tabularFigures()],
      );

  // Body / UI / Data (Inter)
  static TextStyle get bodyL => _body(16, 24, FontWeight.w400);
  static TextStyle get bodyM => _body(14, 20, FontWeight.w400);
  static TextStyle get label => _body(13, 16, FontWeight.w600);
  static TextStyle get caption =>
      _body(12, 16, FontWeight.w400).copyWith(color: AppColors.textMuted);
  static TextStyle get overline => _body(11, 14, FontWeight.w700).copyWith(
        letterSpacing: 0.66,
        color: AppColors.textMuted,
      );

  /// Builds a Material [TextTheme] from the scale so framework widgets inherit
  /// the same identity.
  static TextTheme get textTheme => TextTheme(
        displayLarge: displayXL,
        displayMedium: displayL,
        titleLarge: titleM,
        titleMedium: titleM.copyWith(fontSize: 18),
        bodyLarge: bodyL,
        bodyMedium: bodyM,
        labelLarge: label,
        bodySmall: caption,
        labelSmall: overline,
      );
}
