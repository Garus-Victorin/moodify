import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/features/songs/ui/songs_screen.dart';

void main() {
  group('SongsScreen Tests', () {
    testWidgets('SongsScreen displays correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: SongsScreen(),
          ),
        ),
      );

      // Verify that the songs screen is displayed
      expect(find.byType(SongsScreen), findsOneWidget);

      // Verify that the app bar is displayed
      expect(find.text('Titres'), findsOneWidget);

      // Verify that the search button is displayed
      expect(find.byIcon(Icons.search_rounded), findsOneWidget);
    });

    testWidgets('SongsScreen shows loading state', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: SongsScreen(),
          ),
        ),
      );

      // Verify that the loading indicator is displayed
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('SongsScreen handles search navigation',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: SongsScreen(),
          ),
        ),
      );

      // Tap on the search button
      await tester.tap(find.byIcon(Icons.search_rounded));
      await tester.pumpAndSettle();

      // Verify that the search screen is displayed
      // This would require checking the navigation
    });
  });
}
