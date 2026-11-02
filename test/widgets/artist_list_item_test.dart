import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:moodify/data/models/artist_model.dart';
import 'package:moodify/widgets/artist_list_item.dart';

void main() {
  group('ArtistListItem Tests', () {
    testWidgets('ArtistListItem displays correctly', (
      WidgetTester tester,
    ) async {
      final artist = ArtistModel(
        id: 1,
        name: 'Test Artist',
        songCount: 10,
        albumCount: 5,
        totalDuration: 1800000,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ArtistListItem(artist: artist, onTap: () {}),
          ),
        ),
      );

      // Verify that the artist list item is displayed
      expect(find.byType(ArtistListItem), findsOneWidget);

      // Verify that the artist name is displayed
      expect(find.text('Test Artist'), findsOneWidget);

      // Verify that the song count is displayed
      expect(find.text('10 titres • 5 albums'), findsOneWidget);

      // Verify that the initials are displayed
      expect(find.text('T'), findsOneWidget);
    });

    testWidgets('ArtistListItem handles tap', (WidgetTester tester) async {
      bool tapped = false;
      final artist = ArtistModel(
        id: 1,
        name: 'Test Artist',
        songCount: 10,
        albumCount: 5,
        totalDuration: 1800000,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ArtistListItem(artist: artist, onTap: () => tapped = true),
          ),
        ),
      );

      // Tap on the artist list item
      await tester.tap(find.byType(ArtistListItem));

      // Verify that the onTap callback was called
      expect(tapped, isTrue);
    });
  });
}
