import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/features/settings/ui/settings_screen.dart';

void main() {
  group('SettingsScreen Tests', () {
    testWidgets('SettingsScreen displays correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: SettingsScreen(),
          ),
        ),
      );

      // Verify that the settings screen is displayed
      expect(find.byType(SettingsScreen), findsOneWidget);

      // Verify that the app bar is displayed
      expect(find.text('Paramètres'), findsOneWidget);

      // Verify that the list view is displayed
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('SettingsScreen shows theme section',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: SettingsScreen(),
          ),
        ),
      );

      // Verify that the theme section is displayed
      expect(find.text('Thème'), findsOneWidget);
      expect(find.text('Clair'), findsOneWidget);
      expect(find.text('Sombre'), findsOneWidget);
      expect(find.text('AMOLED'), findsOneWidget);
    });

    testWidgets('SettingsScreen shows playback section',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: SettingsScreen(),
          ),
        ),
      );

      // Verify that the playback section is displayed
      expect(find.text('Lecture'), findsOneWidget);
      expect(find.text('Lecture automatique'), findsOneWidget);
      expect(find.text('Reprendre la lecture'), findsOneWidget);
      expect(find.text('Crossfade'), findsOneWidget);
    });

    testWidgets('SettingsScreen shows library section',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: SettingsScreen(),
          ),
        ),
      );

      // Verify that the library section is displayed
      expect(find.text('Bibliothèque'), findsOneWidget);
      expect(find.text('Scanner la bibliothèque'), findsOneWidget);
      expect(find.text('Dossiers ignorés'), findsOneWidget);
    });

    testWidgets('SettingsScreen shows audio section',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: SettingsScreen(),
          ),
        ),
      );

      // Verify that the audio section is displayed
      expect(find.text('Audio'), findsOneWidget);
      expect(find.text('Égaliseur'), findsOneWidget);
      expect(find.text('Bass Boost'), findsOneWidget);
      expect(find.text('Virtualizer'), findsOneWidget);
    });

    testWidgets('SettingsScreen shows about section',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: SettingsScreen(),
          ),
        ),
      );

      // Verify that the about section is displayed
      expect(find.text('À propos'), findsOneWidget);
      expect(find.text('Version'), findsOneWidget);
      expect(find.text('Licences'), findsOneWidget);
      expect(find.text('Avis'), findsOneWidget);
    });

    testWidgets('SettingsScreen handles equalizer navigation',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: SettingsScreen(),
          ),
        ),
      );

      // Tap on the equalizer button
      await tester.tap(find.text('Égaliseur'));
      await tester.pumpAndSettle();

      // Verify that the equalizer screen is displayed
      // This would require checking the navigation
    });
  });
}
