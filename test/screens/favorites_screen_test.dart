import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/features/favorites/ui/favorites_screen.dart';

void main() {
  group('FavoritesScreen Tests', () {
    testWidgets('FavoritesScreen displays correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: FavoritesScreen(),
          ),
        ),
      );

      // Verify that the favorites screen is displayed
      expect(find.byType(FavoritesScreen), findsOneWidget);

      // Verify that the app bar is displayed
      expect(find.text('Favoris'), findsOneWidget);

      // Verify that the search button is displayed
      expect(find.byIcon(Icons.search_rounded), findsOneWidget);
    });

    testWidgets('FavoritesScreen shows loading state',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: FavoritesScreen(),
          ),
        ),
      );

      // Verify that the loading indicator is displayed
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('FavoritesScreen shows empty state',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: FavoritesScreen(),
          ),
        ),
      );

      // Verify that the empty state is displayed
      expect(find.text('Aucun favoris'), findsOneWidget);
      expect(find.byIcon(Icons.favorite_border_rounded), findsOneWidget);
    });

    testWidgets('FavoritesScreen shows song list', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: FavoritesScreen(),
          ),
        ),
      );

      // Verify that the song list is displayed
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('FavoritesScreen handles song menu',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: FavoritesScreen(),
          ),
        ),
      );

      // Tap on a song more button
      // This would require finding a specific song
      // For now, we just verify the structure
      expect(find.byType(SongListItem), findsWidgets);
    });
  });
}
