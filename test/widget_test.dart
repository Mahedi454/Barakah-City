// Smoke test for the Day 2 UI system gallery screen.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:barakah_city/core/theme/app_theme.dart';
import 'package:barakah_city/presentation/screens/design_gallery_screen.dart';

void main() {
  testWidgets('Design gallery renders the city name', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: AppTheme.light,
          home: const DesignGalleryScreen(),
        ),
      ),
    );

    expect(find.textContaining('Barakah City'), findsWidgets);
  });
}
