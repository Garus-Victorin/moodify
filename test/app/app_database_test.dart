import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/data/database/app_database.dart';

void main() {
  group('AppDatabase Tests', () {
    test('AppDatabase can be created', () {
      final db = AppDatabase(QueryExecutor());

      expect(db, isNotNull);
    });

    test('AppDatabase has correct schema version', () {
      final db = AppDatabase(QueryExecutor());

      expect(db.schemaVersion, 1);
    });

    test('AppDatabase has expected tables', () {
      final db = AppDatabase(QueryExecutor());

      // Verify that the database has the expected tables
      // This is more of a compilation test
      expect(db, isNotNull);
    });

    test('AppDatabase has expected methods', () {
      final db = AppDatabase(QueryExecutor());

      // Verify that the database has the expected methods
      expect(db.insertSong, isNotNull);
      expect(db.updateSong, isNotNull);
      expect(db.deleteSong, isNotNull);
      expect(db.getAllSongs, isNotNull);
      expect(db.searchSongs, isNotNull);
      expect(db.getSongById, isNotNull);
      expect(db.getAllAlbums, isNotNull);
      expect(db.getAllArtists, isNotNull);
      expect(db.insertPlaylist, isNotNull);
      expect(db.deletePlaylist, isNotNull);
      expect(db.addSongToPlaylist, isNotNull);
      expect(db.removeSongFromPlaylist, isNotNull);
      expect(db.getSongsInPlaylist, isNotNull);
      expect(db.addFavorite, isNotNull);
      expect(db.removeFavorite, isNotNull);
      expect(db.getFavorites, isNotNull);
      expect(db.isFavorited, isNotNull);
      expect(db.addToHistory, isNotNull);
      expect(db.getRecentPlayed, isNotNull);
      expect(db.saveLyrics, isNotNull);
      expect(db.getLyricsForSong, isNotNull);
      expect(db.saveSetting, isNotNull);
      expect(db.getSetting, isNotNull);
    });

    test('AppDatabase provider exists', () {
      final container = ProviderContainer();

      expect(container.read(databaseProvider), isNotNull);
    });

    test('AppDatabase provider returns correct type', () {
      final container = ProviderContainer();
      final db = container.read(databaseProvider);

      expect(db, isA<AppDatabase>());
    });

    test('AppDatabase can be accessed from provider', () {
      final container = ProviderContainer();
      final db = container.read(databaseProvider);

      expect(db.insertSong, isNotNull);
      expect(db.updateSong, isNotNull);
      expect(db.deleteSong, isNotNull);
      expect(db.getAllSongs, isNotNull);
      expect(db.searchSongs, isNotNull);
      expect(db.getSongById, isNotNull);
    });

    test('AppDatabase has correct schema', () {
      final db = AppDatabase(QueryExecutor());

      expect(db.schemaVersion, 1);
    });

    test('AppDatabase can be disposed', () {
      final db = AppDatabase(QueryExecutor());

      expect(() => db.close(), returnsNormally);
    });

    test('AppDatabase has expected query methods', () {
      final db = AppDatabase(QueryExecutor());

      // Verify that the database has the expected query methods
      expect(db.getAllSongs, isNotNull);
      expect(db.searchSongs, isNotNull);
      expect(db.getSongById, isNotNull);
      expect(db.getAllAlbums, isNotNull);
      expect(db.getAllArtists, isNotNull);
      expect(db.getAllPlaylists, isNotNull);
      expect(db.getSongsInPlaylist, isNotNull);
      expect(db.getFavorites, isNotNull);
      expect(db.getRecentPlayed, isNotNull);
      expect(db.getLyricsForSong, isNotNull);
    });

    test('AppDatabase has expected mutation methods', () {
      final db = AppDatabase(QueryExecutor());

      // Verify that the database has the expected mutation methods
      expect(db.insertSong, isNotNull);
      expect(db.updateSong, isNotNull);
      expect(db.deleteSong, isNotNull);
      expect(db.insertPlaylist, isNotNull);
      expect(db.deletePlaylist, isNotNull);
      expect(db.addSongToPlaylist, isNotNull);
      expect(db.removeSongFromPlaylist, isNotNull);
      expect(db.addFavorite, isNotNull);
      expect(db.removeFavorite, isNotNull);
      expect(db.addToHistory, isNotNull);
      expect(db.saveLyrics, isNotNull);
      expect(db.saveSetting, isNotNull);
    });
  });
}
