import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/features/search/ui/search_screen.dart';

void main() {
  group('SearchScreen Tests', () {
    testWidgets('SearchScreen displays correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: SearchScreen(),
          ),
        ),
      );

      // Verify that the search screen is displayed
      expect(find.byType(SearchScreen), findsOneWidget);

      // Verify that the search field is displayed
      expect(find.byType(TextField), findsOneWidget);

      // Verify that the search hint is displayed
      expect(find.text('Rechercher des titres, albums, artistes...'),
          findsOneWidget);
    });

    testWidgets('SearchScreen shows empty state', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: SearchScreen(),
          ),
        ),
      );

      // Verify that the empty state is displayed
      expect(find.text('Rechercher dans votre bibliothèque'), findsOneWidget);
      expect(find.byIcon(Icons.search_rounded), findsOneWidget);
    });

    testWidgets('SearchScreen handles search input',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: SearchScreen(),
          ),
        ),
      );

      // Enter text in the search field
      await tester.enterText(find.byType(TextField), 'test');
      await tester.pump();

      // Verify that the search query is updated
      // This would require checking the internal state
    });

    testWidgets('SearchScreen handles clear button',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: SearchScreen(),
          ),
        ),
      );

      // Enter text in the search field
      await tester.enterText(find.byType(TextField), 'test');
      await tester.pump();

      // Tap on the clear button
      await tester.tap(find.byIcon(Icons.clear_rounded));
      await tester.pump();

      // Verify that the search field is cleared
      // This would require checking the internal state
    });
  });
}
