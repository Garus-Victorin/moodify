import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:moodify/data/models/album_model.dart';
import 'package:moodify/widgets/album_grid_item.dart';

void main() {
  group('AlbumGridItem Tests', () {
    testWidgets('AlbumGridItem displays correctly', (
      WidgetTester tester,
    ) async {
      final album = AlbumModel(
        id: 1,
        name: 'Test Album',
        artist: 'Test Artist',
        artistId: 1,
        releaseDate: DateTime.now(),
        songCount: 10,
        totalDuration: 1800000,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AlbumGridItem(album: album, onTap: () {}),
          ),
        ),
      );

      // Verify that the album grid item is displayed
      expect(find.byType(AlbumGridItem), findsOneWidget);

      // Verify that the album name is displayed
      expect(find.text('Test Album'), findsOneWidget);

      // Verify that the artist name is displayed
      expect(find.text('Test Artist'), findsOneWidget);

      // Verify that the cover art is displayed
      expect(find.byType(ClipRRect), findsOneWidget);
    });

    testWidgets('AlbumGridItem handles tap', (WidgetTester tester) async {
      bool tapped = false;
      final album = AlbumModel(
        id: 1,
        name: 'Test Album',
        artist: 'Test Artist',
        artistId: 1,
        releaseDate: DateTime.now(),
        songCount: 10,
        totalDuration: 1800000,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AlbumGridItem(album: album, onTap: () => tapped = true),
          ),
        ),
      );

      // Tap on the album grid item
      await tester.tap(find.byType(AlbumGridItem));

      // Verify that the onTap callback was called
      expect(tapped, isTrue);
    });
  });
}
