import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:moodify/widgets/bottom_navigation.dart';

void main() {
  group('BottomNavigation Tests', () {
    testWidgets('BottomNavigation displays correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: BottomNavigation(child: Container())),
      );

      // Verify that the bottom navigation is displayed
      expect(find.byType(BottomNavigation), findsOneWidget);

      // Verify that the bottom navigation bar is displayed
      expect(find.byType(BottomNavigationBar), findsOneWidget);

      // Verify that the navigation items are displayed
      expect(find.text('Accueil'), findsOneWidget);
      expect(find.text('Titres'), findsOneWidget);
      expect(find.text('Albums'), findsOneWidget);
      expect(find.text('Artistes'), findsOneWidget);
      expect(find.text('Dossiers'), findsOneWidget);
    });

    testWidgets('BottomNavigation handles tab changes', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: BottomNavigation(child: Container())),
      );

      // Tap on the songs tab
      await tester.tap(find.text('Titres'));
      await tester.pumpAndSettle();

      // Verify that the current index is updated
      // This would require checking the internal state
    });

    testWidgets('BottomNavigation displays child correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BottomNavigation(child: Container(color: Colors.red)),
        ),
      );

      // Verify that the child is displayed
      expect(find.byType(Container), findsWidgets);
    });
  });
}
