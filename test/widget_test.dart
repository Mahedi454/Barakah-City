// Smoke test for the Day 1 foundation shell.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:barakah_city/presentation/screens/foundation_screen.dart';

void main() {
  testWidgets('Foundation screen renders app name', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(home: FoundationScreen()),
      ),
    );

    expect(find.textContaining('Barakah City'), findsWidgets);
  });
}
