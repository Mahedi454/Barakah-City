import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/constants/app_constants.dart';
import 'core/theme/app_theme.dart';
import 'presentation/screens/foundation_screen.dart';

void main() {
  // Riverpod is the single, final state-management choice for the project.
  runApp(const ProviderScope(child: BarakahCityApp()));
}

class BarakahCityApp extends StatelessWidget {
  const BarakahCityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const FoundationScreen(),
    );
  }
}
