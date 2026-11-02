import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/features/home/ui/home_screen.dart';
import 'package:moodify/features/songs/ui/songs_screen.dart';
import 'package:moodify/features/albums/ui/albums_screen.dart';
import 'package:moodify/features/artists/ui/artists_screen.dart';
import 'package:moodify/features/folders/ui/folders_screen.dart';
import 'package:moodify/features/player/ui/now_playing_screen.dart';
import 'package:moodify/features/search/ui/search_screen.dart';
import 'package:moodify/features/playlist/ui/playlist_screen.dart';
import 'package:moodify/features/favorites/ui/favorites_screen.dart';
import 'package:moodify/features/equalizer/ui/equalizer_screen.dart';
import 'package:moodify/features/lyrics/ui/lyrics_view.dart';
import 'package:moodify/features/settings/ui/settings_screen.dart';

void main() {
  group('AppScreens Tests', () {
    testWidgets('HomeScreen can be created', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: HomeScreen(),
          ),
        ),
      );

      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets('SongsScreen can be created', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: SongsScreen(),
          ),
        ),
      );

      expect(find.byType(SongsScreen), findsOneWidget);
    });

    testWidgets('AlbumsScreen can be created', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: AlbumsScreen(),
          ),
        ),
      );

      expect(find.byType(AlbumsScreen), findsOneWidget);
    });

    testWidgets('ArtistsScreen can be created', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: ArtistsScreen(),
          ),
        ),
      );

      expect(find.byType(ArtistsScreen), findsOneWidget);
    });

    testWidgets('FoldersScreen can be created', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: FoldersScreen(),
          ),
        ),
      );

      expect(find.byType(FoldersScreen), findsOneWidget);
    });

    testWidgets('NowPlayingScreen can be created', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: NowPlayingScreen(songUri: 'file://test.mp3'),
          ),
        ),
      );

      expect(find.byType(NowPlayingScreen), findsOneWidget);
    });

    testWidgets('SearchScreen can be created', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: SearchScreen(),
          ),
        ),
      );

      expect(find.byType(SearchScreen), findsOneWidget);
    });

    testWidgets('PlaylistScreen can be created', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: PlaylistScreen(playlistId: 1),
          ),
        ),
      );

      expect(find.byType(PlaylistScreen), findsOneWidget);
    });

    testWidgets('FavoritesScreen can be created', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: FavoritesScreen(),
          ),
        ),
      );

      expect(find.byType(FavoritesScreen), findsOneWidget);
    });

    testWidgets('EqualizerScreen can be created', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: EqualizerScreen(),
          ),
        ),
      );

      expect(find.byType(EqualizerScreen), findsOneWidget);
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

    testWidgets('SettingsScreen can be created', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: SettingsScreen(),
          ),
        ),
      );

      expect(find.byType(SettingsScreen), findsOneWidget);
    });

    testWidgets('Screens have correct types', () {
      expect(HomeScreen, isNotNull);
      expect(SongsScreen, isNotNull);
      expect(AlbumsScreen, isNotNull);
      expect(ArtistsScreen, isNotNull);
      expect(FoldersScreen, isNotNull);
      expect(NowPlayingScreen, isNotNull);
      expect(SearchScreen, isNotNull);
      expect(PlaylistScreen, isNotNull);
      expect(FavoritesScreen, isNotNull);
      expect(EqualizerScreen, isNotNull);
      expect(LyricsView, isNotNull);
      expect(SettingsScreen, isNotNull);
    });

    testWidgets('Screens can be instantiated', () {
      expect(() => HomeScreen(), returnsNormally);
      expect(() => SongsScreen(), returnsNormally);
      expect(() => AlbumsScreen(), returnsNormally);
      expect(() => ArtistsScreen(), returnsNormally);
      expect(() => FoldersScreen(), returnsNormally);
      expect(() => NowPlayingScreen(songUri: 'test'), returnsNormally);
      expect(() => SearchScreen(), returnsNormally);
      expect(() => PlaylistScreen(playlistId: 1), returnsNormally);
      expect(() => FavoritesScreen(), returnsNormally);
      expect(() => EqualizerScreen(), returnsNormally);
      expect(() => LyricsView(), returnsNormally);
      expect(() => SettingsScreen(), returnsNormally);
    });

    testWidgets('Screens have correct widget types', () {
      expect(HomeScreen, isA<ConsumerWidget>());
      expect(SongsScreen, isA<ConsumerWidget>());
      expect(AlbumsScreen, isA<ConsumerWidget>());
      expect(ArtistsScreen, isA<ConsumerWidget>());
      expect(FoldersScreen, isA<ConsumerWidget>());
      expect(NowPlayingScreen, isA<ConsumerStatefulWidget>());
      expect(SearchScreen, isA<ConsumerStatefulWidget>());
      expect(PlaylistScreen, isA<ConsumerWidget>());
      expect(FavoritesScreen, isA<ConsumerWidget>());
      expect(EqualizerScreen, isA<ConsumerWidget>());
      expect(LyricsView, isA<ConsumerWidget>());
      expect(SettingsScreen, isA<ConsumerWidget>());
    });
  });
}
