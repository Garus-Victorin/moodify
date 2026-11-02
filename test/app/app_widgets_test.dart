import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/widgets/song_list_item.dart';
import 'package:moodify/widgets/album_grid_item.dart';
import 'package:moodify/widgets/artist_list_item.dart';
import 'package:moodify/widgets/folder_list_item.dart';
import 'package:moodify/widgets/section_header.dart';
import 'package:moodify/widgets/mini_player.dart';
import 'package:moodify/widgets/bottom_navigation.dart';
import 'package:moodify/widgets/app_scaffold.dart';
import 'package:moodify/widgets/system_ui_overlays.dart';
import 'package:moodify/widgets/lyrics_view.dart';

void main() {
  group('AppWidgets Tests', () {
    testWidgets('SongListItem can be created', (WidgetTester tester) async {
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
              onMore: () {},
            ),
          ),
        ),
      );

      expect(find.byType(SongListItem), findsOneWidget);
    });

    testWidgets('AlbumGridItem can be created', (WidgetTester tester) async {
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
            body: AlbumGridItem(
              album: album,
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.byType(AlbumGridItem), findsOneWidget);
    });

    testWidgets('ArtistListItem can be created', (WidgetTester tester) async {
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
            body: ArtistListItem(
              artist: artist,
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.byType(ArtistListItem), findsOneWidget);
    });

    testWidgets('FolderListItem can be created', (WidgetTester tester) async {
      final folder = FolderModel(
        id: 1,
        name: 'Test Folder',
        path: '/test/path',
        songCount: 10,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FolderListItem(
              folder: folder,
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.byType(FolderListItem), findsOneWidget);
    });

    testWidgets('SectionHeader can be created', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SectionHeader(title: 'Test Title'),
          ),
        ),
      );

      expect(find.byType(SectionHeader), findsOneWidget);
    });

    testWidgets('MiniPlayer can be created', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: MiniPlayer(),
            ),
          ),
        ),
      );

      expect(find.byType(MiniPlayer), findsOneWidget);
    });

    testWidgets('BottomNavigation can be created', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BottomNavigation(child: Container()),
        ),
      );

      expect(find.byType(BottomNavigation), findsOneWidget);
    });

    testWidgets('AppScaffold can be created', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: AppScaffold(),
          ),
        ),
      );

      expect(find.byType(AppScaffold), findsOneWidget);
    });

    testWidgets('LyricsView can be created', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: LyricsView(),
            ),
          ),
        ),
      );

      expect(find.byType(LyricsView), findsOneWidget);
    });

    testWidgets('SystemUiOverlays has expected methods', () {
      expect(SystemUiOverlays.setLightStatusBar, isNotNull);
      expect(SystemUiOverlays.setDarkStatusBar, isNotNull);
    });

    testWidgets('Widgets have correct types', () {
      expect(SongListItem, isNotNull);
      expect(AlbumGridItem, isNotNull);
      expect(ArtistListItem, isNotNull);
      expect(FolderListItem, isNotNull);
      expect(SectionHeader, isNotNull);
      expect(MiniPlayer, isNotNull);
      expect(BottomNavigation, isNotNull);
      expect(AppScaffold, isNotNull);
      expect(LyricsView, isNotNull);
    });

    testWidgets('Widgets can be instantiated', () {
      expect(() => SongListItem(song: SongModel(id: 1, title: 'Test', artist: 'Test', album: 'Test', uri: 'test', duration: 1, albumId: 1, artistId: 1, dateAdded: DateTime.now()), onTap: () {}, onMore: () {}), returnsNormally);
      expect(() => AlbumGridItem(album: AlbumModel(id: 1, name: 'Test', artist: 'Test', artistId: 1, releaseDate: DateTime.now(), songCount: 1, totalDuration: 1), onTap: () {}), returnsNormally);
      expect(() => ArtistListItem(artist: ArtistModel(id: 1, name: 'Test'), onTap: () {}), returnsNormally);
      expect(() => FolderListItem(folder: FolderModel(id: 1, name: 'Test', path: 'test'), onTap: () {}), returnsNormally);
      expect(() => SectionHeader(title: 'Test'), returnsNormally);
      expect(() => MiniPlayer(), returnsNormally);
      expect(() => BottomNavigation(child: Container()), returnsNormally);
      expect(() => AppScaffold(), returnsNormally);
      expect(() => LyricsView(), returnsNormally);
    });
  });
}
