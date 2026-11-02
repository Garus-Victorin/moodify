import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/features/albums/ui/albums_screen.dart';

void main() {
  group('AlbumsScreen Tests', () {
    testWidgets('AlbumsScreen displays correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: AlbumsScreen(),
          ),
        ),
      );

      // Verify that the albums screen is displayed
      expect(find.byType(AlbumsScreen), findsOneWidget);

      // Verify that the app bar is displayed
      expect(find.text('Albums'), findsOneWidget);

      // Verify that the search button is displayed
      expect(find.byIcon(Icons.search_rounded), findsOneWidget);
    });

    testWidgets('AlbumsScreen shows loading state',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: AlbumsScreen(),
          ),
        ),
      );

      // Verify that the loading indicator is displayed
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('AlbumsScreen displays grid view', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: AlbumsScreen(),
          ),
        ),
      );

      // Verify that the grid view is displayed
      expect(find.byType(GridView), findsOneWidget);
    });
  });
}
