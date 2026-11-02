import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/features/player/ui/now_playing_screen.dart';

void main() {
  group('NowPlayingScreen Tests', () {
    testWidgets('NowPlayingScreen displays correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: NowPlayingScreen(songUri: 'file://test.mp3'),
          ),
        ),
      );

      // Verify that the player screen is displayed
      expect(find.byType(NowPlayingScreen), findsOneWidget);

      // Verify that the app bar is displayed
      expect(find.byType(AppBar), findsOneWidget);

      // Verify that the back button is displayed
      expect(find.byIcon(Icons.arrow_back_rounded), findsOneWidget);

      // Verify that the more button is displayed
      expect(find.byIcon(Icons.more_vert_rounded), findsOneWidget);
    });

    testWidgets('NowPlayingScreen shows default cover art',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: NowPlayingScreen(songUri: 'file://test.mp3'),
          ),
        ),
      );

      // Verify that the cover art is displayed
      expect(find.byType(Hero), findsOneWidget);
      expect(find.byType(ClipRRect), findsOneWidget);
    });

    testWidgets('NowPlayingScreen shows playback controls',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: NowPlayingScreen(songUri: 'file://test.mp3'),
          ),
        ),
      );

      // Verify that the playback controls are displayed
      expect(find.byIcon(Icons.skip_previous_rounded), findsOneWidget);
      expect(find.byIcon(Icons.play_arrow_rounded), findsOneWidget);
      expect(find.byIcon(Icons.skip_next_rounded), findsOneWidget);
      expect(find.byIcon(Icons.shuffle_rounded), findsOneWidget);
      expect(find.byIcon(Icons.repeat_rounded), findsOneWidget);
    });

    testWidgets('NowPlayingScreen handles back navigation',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: NowPlayingScreen(songUri: 'file://test.mp3'),
          ),
        ),
      );

      // Tap on the back button
      await tester.tap(find.byIcon(Icons.arrow_back_rounded));
      await tester.pumpAndSettle();

      // Verify that the navigation works
      // This would require checking the navigation
    });
  });
}
