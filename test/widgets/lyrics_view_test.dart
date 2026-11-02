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
  });
}
