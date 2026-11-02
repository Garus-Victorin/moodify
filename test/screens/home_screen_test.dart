import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/features/home/ui/home_screen.dart';

void main() {
  group('HomeScreen Tests', () {
    testWidgets('HomeScreen displays correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: HomeScreen(),
          ),
        ),
      );

      // Verify that the home screen is displayed
      expect(find.byType(HomeScreen), findsOneWidget);

      // Verify that the app bar is displayed
      expect(find.text('Moodify'), findsOneWidget);

      // Verify that the search button is displayed
      expect(find.byIcon(Icons.search_rounded), findsOneWidget);

      // Verify that the settings button is displayed
      expect(find.byIcon(Icons.settings_rounded), findsOneWidget);
    });

    testWidgets('HomeScreen shows loading state', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: HomeScreen(),
          ),
        ),
      );

      // Verify that the loading indicator is displayed
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('HomeScreen handles refresh', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: HomeScreen(),
          ),
        ),
      );

      // Verify that the refresh indicator is present
      expect(find.byType(RefreshIndicator), findsOneWidget);
    });
  });
}
