import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/features/lyrics/ui/lyrics_view.dart';

void main() {
  group('LyricsView Tests', () {
    testWidgets('LyricsView displays correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: LyricsView(),
            ),
          ),
        ),
      );

      // Verify that the lyrics view is displayed
      expect(find.byType(LyricsView), findsOneWidget);

      // Verify that the default message is displayed
      expect(find.text('Aucune parole disponible'), findsOneWidget);

      // Verify that the icon is displayed
      expect(find.byIcon(Icons.music_note_rounded), findsOneWidget);
    });

    testWidgets('LyricsView shows correct layout', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: LyricsView(),
            ),
          ),
        ),
      );

      // Verify that the layout is centered
      expect(find.byType(Center), findsOneWidget);

      // Verify that the column is displayed
      expect(find.byType(Column), findsOneWidget);

      // Verify that the icon is displayed
      expect(find.byIcon(Icons.music_note_rounded), findsOneWidget);

      // Verify that the text is displayed
      expect(find.text('Aucune parole disponible'), findsOneWidget);
    });

    testWidgets('LyricsView handles different screen sizes',
        (WidgetTester tester) async {
      // Test on a small screen
      tester.binding.window.physicalSizeTestValue = const Size(320, 640);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
      addTearDown(tester.binding.window.clearDevicePixelRatioTestValue);

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: LyricsView(),
            ),
          ),
        ),
      );

      // Verify that the layout adapts to small screens
      expect(find.byType(LyricsView), findsOneWidget);
    });
  });
}
