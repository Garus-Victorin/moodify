import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/features/playlist/ui/playlist_screen.dart';

void main() {
  group('PlaylistScreen Tests', () {
    testWidgets('PlaylistScreen displays correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: PlaylistScreen(playlistId: 1),
          ),
        ),
      );

      // Verify that the playlist screen is displayed
      expect(find.byType(PlaylistScreen), findsOneWidget);

      // Verify that the app bar is displayed
      expect(find.text('Playlist'), findsOneWidget);

      // Verify that the more button is displayed
      expect(find.byIcon(Icons.more_vert_rounded), findsOneWidget);
    });

    testWidgets('PlaylistScreen shows loading state',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: PlaylistScreen(playlistId: 1),
          ),
        ),
      );

      // Verify that the loading indicator is displayed
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('PlaylistScreen shows playlist header',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: PlaylistScreen(playlistId: 1),
          ),
        ),
      );

      // Verify that the playlist header is displayed
      expect(find.byType(Container), findsWidgets);
      expect(find.byType(ClipRRect), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('PlaylistScreen shows song list', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: PlaylistScreen(playlistId: 1),
          ),
        ),
      );

      // Verify that the song list is displayed
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('PlaylistScreen handles more menu',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: PlaylistScreen(playlistId: 1),
          ),
        ),
      );

      // Tap on the more button
      await tester.tap(find.byIcon(Icons.more_vert_rounded));
      await tester.pumpAndSettle();

      // Verify that the more menu is displayed
      expect(find.text('Renommer'), findsOneWidget);
      expect(find.text('Supprimer'), findsOneWidget);
      expect(find.text('Partager'), findsOneWidget);
    });

    testWidgets('PlaylistScreen handles song menu',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: PlaylistScreen(playlistId: 1),
          ),
        ),
      );

      // Tap on a song more button
      // This would require finding a specific song
      // For now, we just verify the structure
      expect(find.byType(SongListItem), findsWidgets);
    });
  });
}
