import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/features/artists/ui/artists_screen.dart';

void main() {
  group('ArtistsScreen Tests', () {
    testWidgets('ArtistsScreen displays correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: ArtistsScreen(),
          ),
        ),
      );

      // Verify that the artists screen is displayed
      expect(find.byType(ArtistsScreen), findsOneWidget);

      // Verify that the app bar is displayed
      expect(find.text('Artistes'), findsOneWidget);

      // Verify that the search button is displayed
      expect(find.byIcon(Icons.search_rounded), findsOneWidget);
    });

    testWidgets('ArtistsScreen shows loading state',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: ArtistsScreen(),
          ),
        ),
      );

      // Verify that the loading indicator is displayed
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('ArtistsScreen displays list view',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: ArtistsScreen(),
          ),
        ),
      );

      // Verify that the list view is displayed
      expect(find.byType(ListView), findsOneWidget);
    });
  });
}
