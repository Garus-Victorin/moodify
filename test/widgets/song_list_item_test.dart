import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:moodify/data/models/song_model.dart';
import 'package:moodify/widgets/song_list_item.dart';

void main() {
  group('SongListItem Tests', () {
    testWidgets('SongListItem displays correctly', (WidgetTester tester) async {
      final song = SongModel(
        id: 1,
        title: 'Test Song',
        artist: 'Test Artist',
        album: 'Test Album',
        uri: 'file://test.mp3',
        duration: 180000,
        albumId: 1,
        artistId: 1,
        dateAdded: DateTime.now(),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SongListItem(song: song, onTap: () {}, onMore: () {}),
          ),
        ),
      );

      // Verify that the song list item is displayed
      expect(find.byType(SongListItem), findsOneWidget);

      // Verify that the song title is displayed
      expect(find.text('Test Song'), findsOneWidget);

      // Verify that the artist name is displayed
      expect(find.text('Test Artist'), findsOneWidget);

      // Verify that the duration is displayed
      expect(find.text('03:00'), findsOneWidget);

      // Verify that the cover art is displayed
      expect(find.byType(ClipRRect), findsOneWidget);

      // Verify that the more button is displayed
      expect(find.byIcon(Icons.more_vert_rounded), findsOneWidget);
    });

    testWidgets('SongListItem handles tap', (WidgetTester tester) async {
      bool tapped = false;
      final song = SongModel(
        id: 1,
        title: 'Test Song',
        artist: 'Test Artist',
        album: 'Test Album',
        uri: 'file://test.mp3',
        duration: 180000,
        albumId: 1,
        artistId: 1,
        dateAdded: DateTime.now(),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SongListItem(
              song: song,
              onTap: () => tapped = true,
              onMore: () {},
            ),
          ),
        ),
      );

      // Tap on the song list item
      await tester.tap(find.byType(SongListItem));

      // Verify that the onTap callback was called
      expect(tapped, isTrue);
    });

    testWidgets('SongListItem handles more button tap', (
      WidgetTester tester,
    ) async {
      bool moreTapped = false;
      final song = SongModel(
        id: 1,
        title: 'Test Song',
        artist: 'Test Artist',
        album: 'Test Album',
        uri: 'file://test.mp3',
        duration: 180000,
        albumId: 1,
        artistId: 1,
        dateAdded: DateTime.now(),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SongListItem(
              song: song,
              onTap: () {},
              onMore: () => moreTapped = true,
            ),
          ),
        ),
      );

      // Tap on the more button
      await tester.tap(find.byIcon(Icons.more_vert_rounded));

      // Verify that the onMore callback was called
      expect(moreTapped, isTrue);
    });
  });
}
