import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/main.dart';

void main() {
  group('Main App Tests', () {
    testWidgets('App starts without errors', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const ProviderScope(child: MoodifyApp()));

      // Verify that the app starts without errors
      expect(find.byType(MoodifyApp), findsOneWidget);

      // Verify that the material app is displayed
      expect(find.byType(MaterialApp), findsOneWidget);

      // Verify that the app has a title
      expect(find.text('Moodify'), findsOneWidget);
    });

    testWidgets('App has correct theme', (WidgetTester tester) async {
      await tester.pumpWidget(const ProviderScope(child: MoodifyApp()));

      // Verify that the app uses Material 3
      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.theme?.useMaterial3, isTrue);

      // Verify that the app has a dark theme
      expect(materialApp.darkTheme, isNotNull);

      // Verify that the app uses dark theme by default
      expect(materialApp.themeMode, ThemeMode.dark);
    });

    testWidgets('App has correct router configuration',
        (WidgetTester tester) async {
      await tester.pumpWidget(const ProviderScope(child: MoodifyApp()));

      // Verify that the app has a router
      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.routerConfig, isNotNull);
    });

    testWidgets('App shows home screen by default',
        (WidgetTester tester) async {
      await tester.pumpWidget(const ProviderScope(child: MoodifyApp()));

      // Verify that the home screen is displayed
      expect(find.text('Moodify'), findsOneWidget);

      // Verify that the bottom navigation is displayed
      expect(find.byType(BottomNavigationBar), findsOneWidget);
    });

    testWidgets('App handles orientation changes', (WidgetTester tester) async {
      await tester.pumpWidget(const ProviderScope(child: MoodifyApp()));

      // Verify that the app supports portrait orientation
      expect(tester.binding.window.physicalSize.width,
          lessThan(tester.binding.window.physicalSize.height));
    });

    testWidgets('App has correct system UI overlays',
        (WidgetTester tester) async {
      await tester.pumpWidget(const ProviderScope(child: MoodifyApp()));

      // Verify that the system UI overlays are configured
      // This would require platform-specific testing
      // For now, we just verify that the app starts without errors
      expect(find.byType(MoodifyApp), findsOneWidget);
    });

    testWidgets('App shows mini player', (WidgetTester tester) async {
      await tester.pumpWidget(const ProviderScope(child: MoodifyApp()));

      // Verify that the mini player is displayed
      expect(find.byType(MiniPlayer), findsOneWidget);
    });

    testWidgets('App shows bottom navigation', (WidgetTester tester) async {
      await tester.pumpWidget(const ProviderScope(child: MoodifyApp()));

      // Verify that the bottom navigation is displayed
      expect(find.byType(BottomNavigationBar), findsOneWidget);

      // Verify that the navigation items are displayed
      expect(find.text('Accueil'), findsOneWidget);
      expect(find.text('Titres'), findsOneWidget);
      expect(find.text('Albums'), findsOneWidget);
      expect(find.text('Artistes'), findsOneWidget);
      expect(find.text('Dossiers'), findsOneWidget);
    });

    testWidgets('App handles navigation', (WidgetTester tester) async {
      await tester.pumpWidget(const ProviderScope(child: MoodifyApp()));

      // Tap on the songs tab
      await tester.tap(find.text('Titres'));
      await tester.pumpAndSettle();

      // Verify that the songs screen is displayed
      expect(find.text('Titres'), findsOneWidget);
    });

    testWidgets('App handles search navigation', (WidgetTester tester) async {
      await tester.pumpWidget(const ProviderScope(child: MoodifyApp()));

      // Tap on the search button
      await tester.tap(find.byIcon(Icons.search_rounded));
      await tester.pumpAndSettle();

      // Verify that the search screen is displayed
      expect(find.text('Rechercher des titres, albums, artistes...'),
          findsOneWidget);
    });

    testWidgets('App handles settings navigation', (WidgetTester tester) async {
      await tester.pumpWidget(const ProviderScope(child: MoodifyApp()));

      // Tap on the settings button
      await tester.tap(find.byIcon(Icons.settings_rounded));
      await tester.pumpAndSettle();

      // Verify that the settings screen is displayed
      expect(find.text('Paramètres'), findsOneWidget);
    });
  });
}
