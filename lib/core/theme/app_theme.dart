import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_radii.dart';
import 'app_typography.dart';

/// Central theme for Barakah City. UI widgets read from here (and the token
/// classes) so the visual identity — peaceful, green/gold, soft, rounded —
/// stays consistent across every screen.
class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.cream,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.green,
          primary: AppColors.green,
          onPrimary: AppColors.textOnBrand,
          secondary: AppColors.gold,
          onSecondary: AppColors.textOnBrand,
          surface: AppColors.surfaceWhite,
          onSurface: AppColors.textDark,
          error: AppColors.critical,
        ),
        textTheme: AppTypography.textTheme,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.green,
          foregroundColor: AppColors.textOnBrand,
          centerTitle: true,
          elevation: 0,
          titleTextStyle:
              AppTypography.titleM.copyWith(color: AppColors.textOnBrand),
        ),
        dividerTheme: const DividerThemeData(
          color: AppColors.hairline,
          thickness: 1,
          space: 1,
        ),
        cardTheme: CardThemeData(
          color: AppColors.surfaceWhite,
          elevation: 0,
          shape: const RoundedRectangleBorder(borderRadius: AppRadii.card),
        ),
        dialogTheme: DialogThemeData(
          backgroundColor: AppColors.surfaceWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadii.xl),
          ),
        ),
      );
}
