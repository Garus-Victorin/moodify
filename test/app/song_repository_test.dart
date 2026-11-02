import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/data/repositories/song_repository.dart';

void main() {
  group('SongRepository Tests', () {
    test('SongRepository provider exists', () {
      final container = ProviderContainer();

      expect(container.read(songRepositoryProvider), isNotNull);
    });

    test('SongRepository can be created', () {
      final container = ProviderContainer();
      final db = container.read(databaseProvider);
      final repository = SongRepository(db);

      expect(repository, isNotNull);
      expect(repository.database, isNotNull);
    });

    test('SongRepository has expected methods', () {
      final container = ProviderContainer();
      final db = container.read(databaseProvider);
      final repository = SongRepository(db);

      expect(repository.getAllSongs, isNotNull);
      expect(repository.getSongById, isNotNull);
      expect(repository.searchSongs, isNotNull);
      expect(repository.addSong, isNotNull);
      expect(repository.updateSong, isNotNull);
      expect(repository.deleteSong, isNotNull);
    });

    test('SongRepository getAllSongs returns stream', () {
      final container = ProviderContainer();
      final db = container.read(databaseProvider);
      final repository = SongRepository(db);

      final stream = repository.getAllSongs();
      expect(stream, isNotNull);
      expect(stream, isA<Stream<List<SongModel>>>());
    });

    test('SongRepository getSongById returns future', () {
      final container = ProviderContainer();
      final db = container.read(databaseProvider);
      final repository = SongRepository(db);

      final future = repository.getSongById(1);
      expect(future, isNotNull);
      expect(future, isA<Future<SongModel?>>());
    });

    test('SongRepository searchSongs returns stream', () {
      final container = ProviderContainer();
      final db = container.read(databaseProvider);
      final repository = SongRepository(db);

      final stream = repository.searchSongs('test');
      expect(stream, isNotNull);
      expect(stream, isA<Stream<List<SongModel>>>());
    });

    test('SongRepository addSong returns future', () {
      final container = ProviderContainer();
      final db = container.read(databaseProvider);
      final repository = SongRepository(db);

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

      final future = repository.addSong(song);
      expect(future, isNotNull);
      expect(future, isA<Future<int>>());
    });

    test('SongRepository updateSong returns future', () {
      final container = ProviderContainer();
      final db = container.read(databaseProvider);
      final repository = SongRepository(db);

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

      final future = repository.updateSong(song);
      expect(future, isNotNull);
      expect(future, isA<Future<void>>());
    });

    test('SongRepository deleteSong returns future', () {
      final container = ProviderContainer();
      final db = container.read(databaseProvider);
      final repository = SongRepository(db);

      final future = repository.deleteSong(1);
      expect(future, isNotNull);
      expect(future, isA<Future<void>>());
    });
  });
}
