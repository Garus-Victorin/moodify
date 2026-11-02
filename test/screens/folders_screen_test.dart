import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/features/folders/ui/folders_screen.dart';

void main() {
  group('FoldersScreen Tests', () {
    testWidgets('FoldersScreen displays correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: FoldersScreen(),
          ),
        ),
      );

      // Verify that the folders screen is displayed
      expect(find.byType(FoldersScreen), findsOneWidget);

      // Verify that the app bar is displayed
      expect(find.text('Dossiers'), findsOneWidget);

      // Verify that the search button is displayed
      expect(find.byIcon(Icons.search_rounded), findsOneWidget);
    });

    testWidgets('FoldersScreen shows loading state',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: FoldersScreen(),
          ),
        ),
      );

      // Verify that the loading indicator is displayed
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('FoldersScreen displays list view',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: FoldersScreen(),
          ),
        ),
      );

      // Verify that the list view is displayed
      expect(find.byType(ListView), findsOneWidget);
    });
  });
}
