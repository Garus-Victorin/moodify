import 'package:flutter_test/flutter_test.dart';
import 'package:moodify/data/models/song_model.dart';
import 'package:moodify/data/models/album_model.dart';
import 'package:moodify/data/models/artist_model.dart';
import 'package:moodify/data/models/playlist_model.dart';
import 'package:moodify/data/models/favourite_model.dart';
import 'package:moodify/data/models/history_model.dart';
import 'package:moodify/data/models/lyrics_model.dart';
import 'package:moodify/data/models/settings_model.dart';
import 'package:moodify/data/models/folder_model.dart';

void main() {
  group('AppModels Tests', () {
    test('SongModel can be created', () {
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

      expect(song, isNotNull);
      expect(song.id, 1);
      expect(song.title, 'Test Song');
      expect(song.artist, 'Test Artist');
      expect(song.album, 'Test Album');
      expect(song.uri, 'file://test.mp3');
      expect(song.duration, 180000);
      expect(song.albumId, 1);
      expect(song.artistId, 1);
    });

    test('AlbumModel can be created', () {
      final album = AlbumModel(
        id: 1,
        name: 'Test Album',
        artist: 'Test Artist',
        artistId: 1,
        releaseDate: DateTime.now(),
        songCount: 10,
        totalDuration: 1800000,
      );

      expect(album, isNotNull);
      expect(album.id, 1);
      expect(album.name, 'Test Album');
      expect(album.artist, 'Test Artist');
      expect(album.artistId, 1);
      expect(album.songCount, 10);
      expect(album.totalDuration, 1800000);
    });

    test('ArtistModel can be created', () {
      final artist = ArtistModel(
        id: 1,
        name: 'Test Artist',
        songCount: 10,
        albumCount: 5,
        totalDuration: 1800000,
      );

      expect(artist, isNotNull);
      expect(artist.id, 1);
      expect(artist.name, 'Test Artist');
      expect(artist.songCount, 10);
      expect(artist.albumCount, 5);
      expect(artist.totalDuration, 1800000);
    });

    test('PlaylistModel can be created', () {
      final playlist = PlaylistModel(
        id: 1,
        name: 'Test Playlist',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        songIds: [1, 2, 3],
      );

      expect(playlist, isNotNull);
      expect(playlist.id, 1);
      expect(playlist.name, 'Test Playlist');
      expect(playlist.songIds, [1, 2, 3]);
    });

    test('FavouriteModel can be created', () {
      final favourite = FavouriteModel(
        id: 1,
        songId: 1,
        addedAt: DateTime.now(),
      );

      expect(favourite, isNotNull);
      expect(favourite.id, 1);
      expect(favourite.songId, 1);
    });

    test('HistoryModel can be created', () {
      final history = HistoryModel(
        id: 1,
        songId: 1,
        playedAt: DateTime.now(),
        playDuration: 180000,
      );

      expect(history, isNotNull);
      expect(history.id, 1);
      expect(history.songId, 1);
      expect(history.playDuration, 180000);
    });

    test('LyricsModel can be created', () {
      final lyrics = LyricsModel(
        songId: 1,
        lines: [
          LyricsLine(time: Duration.zero, text: 'Line 1'),
          LyricsLine(time: Duration(seconds: 1), text: 'Line 2'),
        ],
        source: 'embedded',
      );

      expect(lyrics, isNotNull);
      expect(lyrics.songId, 1);
      expect(lyrics.lines, hasLength(2));
      expect(lyrics.source, 'embedded');
    });

    test('SettingsModel can be created', () {
      final settings = SettingsModel();

      expect(settings, isNotNull);
      expect(settings.themeMode, 1);
      expect(settings.autoScan, isTrue);
      expect(settings.shuffleDefault, isFalse);
      expect(settings.repeatDefault, isFalse);
      expect(settings.crossfadeEnabled, isFalse);
      expect(settings.crossfadeDuration, 0);
      expect(settings.language, 'fr');
      expect(settings.showLyricsInPlayer, isFalse);
      expect(settings.equalizerPreset, 'normal');
      expect(settings.bassBoost, 0.0);
      expect(settings.virtualizer, 0.0);
    });

    test('FolderModel can be created', () {
      final folder = FolderModel(
        id: 1,
        name: 'Test Folder',
        path: '/test/path',
        songCount: 10,
      );

      expect(folder, isNotNull);
      expect(folder.id, 1);
      expect(folder.name, 'Test Folder');
      expect(folder.path, '/test/path');
      expect(folder.songCount, 10);
    });

    test('LyricsLine can be created', () {
      final line = LyricsLine(time: Duration.zero, text: 'Test Line');

      expect(line, isNotNull);
      expect(line.time, Duration.zero);
      expect(line.text, 'Test Line');
    });

    test('Models have copyWith methods', () {
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

      final copiedSong = song.copyWith(title: 'Copied Song');
      expect(copiedSong.title, 'Copied Song');
      expect(copiedSong.artist, song.artist);

      final album = AlbumModel(
        id: 1,
        name: 'Test Album',
        artist: 'Test Artist',
        artistId: 1,
        releaseDate: DateTime.now(),
        songCount: 10,
        totalDuration: 1800000,
      );

      final copiedAlbum = album.copyWith(name: 'Copied Album');
      expect(copiedAlbum.name, 'Copied Album');
      expect(copiedAlbum.artist, album.artist);

      final artist = ArtistModel(
        id: 1,
        name: 'Test Artist',
        songCount: 10,
        albumCount: 5,
        totalDuration: 1800000,
      );

      final copiedArtist = artist.copyWith(name: 'Copied Artist');
      expect(copiedArtist.name, 'Copied Artist');
      expect(copiedArtist.songCount, artist.songCount);

      final playlist = PlaylistModel(
        id: 1,
        name: 'Test Playlist',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        songIds: [1, 2, 3],
      );

      final copiedPlaylist = playlist.copyWith(name: 'Copied Playlist');
      expect(copiedPlaylist.name, 'Copied Playlist');
      expect(copiedPlaylist.songIds, playlist.songIds);

      final folder = FolderModel(
        id: 1,
        name: 'Test Folder',
        path: '/test/path',
        songCount: 10,
      );

      final copiedFolder = folder.copyWith(name: 'Copied Folder');
      expect(copiedFolder.name, 'Copied Folder');
      expect(copiedFolder.path, folder.path);
    });

    test('Models have toMap methods', () {
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

      final map = song.toMap();
      expect(map, isNotNull);
      expect(map, isA<Map<String, dynamic>>());

      final album = AlbumModel(
        id: 1,
        name: 'Test Album',
        artist: 'Test Artist',
        artistId: 1,
        releaseDate: DateTime.now(),
        songCount: 10,
        totalDuration: 1800000,
      );

      final albumMap = album.toMap();
      expect(albumMap, isNotNull);
      expect(albumMap, isA<Map<String, dynamic>>());

      final artist = ArtistModel(
        id: 1,
        name: 'Test Artist',
        songCount: 10,
        albumCount: 5,
        totalDuration: 1800000,
      );

      final artistMap = artist.toMap();
      expect(artistMap, isNotNull);
      expect(artistMap, isA<Map<String, dynamic>>());

      final playlist = PlaylistModel(
        id: 1,
        name: 'Test Playlist',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        songIds: [1, 2, 3],
      );

      final playlistMap = playlist.toMap();
      expect(playlistMap, isNotNull);
      expect(playlistMap, isA<Map<String, dynamic>>());

      final favourite = FavouriteModel(
        id: 1,
        songId: 1,
        addedAt: DateTime.now(),
      );

      final favouriteMap = favourite.toMap();
      expect(favouriteMap, isNotNull);
      expect(favouriteMap, isA<Map<String, dynamic>>());

      final history = HistoryModel(
        id: 1,
        songId: 1,
        playedAt: DateTime.now(),
        playDuration: 180000,
      );

      final historyMap = history.toMap();
      expect(historyMap, isNotNull);
      expect(historyMap, isA<Map<String, dynamic>>());

      final folder = FolderModel(
        id: 1,
        name: 'Test Folder',
        path: '/test/path',
        songCount: 10,
      );

      final folderMap = folder.toMap();
      expect(folderMap, isNotNull);
      expect(folderMap, isA<Map<String, dynamic>>());
    });

    test('Models have fromMap methods', () {
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

      final map = song.toMap();
      final reconstructedSong = SongModel.fromMap(map);
      expect(reconstructedSong.id, song.id);
      expect(reconstructedSong.title, song.title);

      final album = AlbumModel(
        id: 1,
        name: 'Test Album',
        artist: 'Test Artist',
        artistId: 1,
        releaseDate: DateTime.now(),
        songCount: 10,
        totalDuration: 1800000,
      );

      final albumMap = album.toMap();
      final reconstructedAlbum = AlbumModel.fromMap(albumMap);
      expect(reconstructedAlbum.id, album.id);
      expect(reconstructedAlbum.name, album.name);

      final artist = ArtistModel(
        id: 1,
        name: 'Test Artist',
        songCount: 10,
        albumCount: 5,
        totalDuration: 1800000,
      );

      final artistMap = artist.toMap();
      final reconstructedArtist = ArtistModel.fromMap(artistMap);
      expect(reconstructedArtist.id, artist.id);
      expect(reconstructedArtist.name, artist.name);

      final playlist = PlaylistModel(
        id: 1,
        name: 'Test Playlist',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        songIds: [1, 2, 3],
      );

      final playlistMap = playlist.toMap();
      final reconstructedPlaylist = PlaylistModel.fromMap(playlistMap, [1, 2, 3]);
      expect(reconstructedPlaylist.id, playlist.id);
      expect(reconstructedPlaylist.name, playlist.name);

      final favourite = FavouriteModel(
        id: 1,
        songId: 1,
        addedAt: DateTime.now(),
      );

      final favouriteMap = favourite.toMap();
      final reconstructedFavourite = FavouriteModel.fromMap(favouriteMap);
      expect(reconstructedFavourite.id, favourite.id);
      expect(reconstructedFavourite.songId, favourite.songId);

      final history = HistoryModel(
        id: 1,
        songId: 1,
        playedAt: DateTime.now(),
        playDuration: 180000,
      );

      final historyMap = history.toMap();
      final reconstructedHistory = HistoryModel.fromMap(historyMap);
      expect(reconstructedHistory.id, history.id);
      expect(reconstructedHistory.songId, history.songId);
    });

    test('LyricsModel has expected methods', () {
      final lyrics = LyricsModel(
        songId: 1,
        lines: [
          LyricsLine(time: Duration.zero, text: 'Line 1'),
          LyricsLine(time: Duration(seconds: 1), text: 'Line 2'),
          LyricsLine(time: Duration(seconds: 2), text: 'Line 3'),
        ],
        source: 'embedded',
      );

      expect(lyrics.getLineAt(Duration.zero), isNotNull);
      expect(lyrics.getLineAt(Duration(seconds: 1)), isNotNull);
      expect(lyrics.getLineAt(Duration(seconds: 2)), isNotNull);
      expect(lyrics.getLineAt(Duration(seconds: 3)), isNull);

      expect(lyrics.getCurrentIndex(Duration.zero), 0);
      expect(lyrics.getCurrentIndex(Duration(seconds: 1)), 1);
      expect(lyrics.getCurrentIndex(Duration(seconds: 2)), 2);
      expect(lyrics.getCurrentIndex(Duration(seconds: 3)), 2);
    });

    test('SettingsModel has expected properties', () {
      final settings = SettingsModel();

      expect(settings.themeIndex, 1);
      expect(settings.themeMode, 1);
    });
  });
}
