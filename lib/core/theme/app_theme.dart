import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Central theme for Barakah City. UI widgets read from here so the visual
/// identity (peaceful, green/gold, soft) stays consistent across screens.
class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.cream,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.green,
          primary: AppColors.green,
          secondary: AppColors.gold,
          surface: AppColors.cream,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.green,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        textTheme: const TextTheme().apply(
          bodyColor: AppColors.textDark,
          displayColor: AppColors.textDark,
        ),
      );
}
