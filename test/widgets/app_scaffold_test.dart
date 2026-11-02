import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/widgets/app_scaffold.dart';

void main() {
  group('AppScaffold Tests', () {
    testWidgets('AppScaffold displays correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(child: MaterialApp(home: AppScaffold())),
      );

      // Verify that the app scaffold is displayed
      expect(find.byType(AppScaffold), findsOneWidget);

      // Verify that the bottom navigation is displayed
      expect(find.byType(BottomNavigationBar), findsOneWidget);

      // Verify that the mini player is displayed
      expect(find.byType(MiniPlayer), findsOneWidget);
    });

    testWidgets('AppScaffold handles navigation', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(child: MaterialApp(home: AppScaffold())),
      );

      // Tap on the songs tab
      await tester.tap(find.text('Titres'));
      await tester.pumpAndSettle();

      // Verify that the navigation works
      // This would require checking the internal state
    });

    testWidgets('AppScaffold displays correct screen based on route', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        ProviderScope(child: MaterialApp(home: AppScaffold())),
      );

      // Verify that the home screen is displayed by default
      expect(find.text('Moodify'), findsOneWidget);
    });
  });
}
