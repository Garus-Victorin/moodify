import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/data/datasources/local_song_datasource.dart';

void main() {
  group('LocalSongDataSource Tests', () {
    test('LocalSongDataSource provider exists', () {
      final container = ProviderContainer();

      expect(container.read(localSongDataSourceProvider), isNotNull);
    });

    test('LocalSongDataSource can be created', () {
      final container = ProviderContainer();
      final repository = container.read(songRepositoryProvider);
      final datasource = LocalSongDataSource(repository);

      expect(datasource, isNotNull);
      expect(datasource.repository, isNotNull);
    });

    test('LocalSongDataSource has expected methods', () {
      final container = ProviderContainer();
      final repository = container.read(songRepositoryProvider);
      final datasource = LocalSongDataSource(repository);

      expect(datasource.getAllSongs, isNotNull);
      expect(datasource.getSongById, isNotNull);
      expect(datasource.searchSongs, isNotNull);
      expect(datasource.addSong, isNotNull);
      expect(datasource.updateSong, isNotNull);
      expect(datasource.deleteSong, isNotNull);
    });

    test('LocalSongDataSource getAllSongs returns stream', () {
      final container = ProviderContainer();
      final repository = container.read(songRepositoryProvider);
      final datasource = LocalSongDataSource(repository);

      final stream = datasource.getAllSongs();
      expect(stream, isNotNull);
      expect(stream, isA<Stream<List<SongModel>>>());
    });

    test('LocalSongDataSource getSongById returns future', () {
      final container = ProviderContainer();
      final repository = container.read(songRepositoryProvider);
      final datasource = LocalSongDataSource(repository);

      final future = datasource.getSongById(1);
      expect(future, isNotNull);
      expect(future, isA<Future<SongModel?>>());
    });

    test('LocalSongDataSource searchSongs returns stream', () {
      final container = ProviderContainer();
      final repository = container.read(songRepositoryProvider);
      final datasource = LocalSongDataSource(repository);

      final stream = datasource.searchSongs('test');
      expect(stream, isNotNull);
      expect(stream, isA<Stream<List<SongModel>>>());
    });

    test('LocalSongDataSource addSong returns future', () {
      final container = ProviderContainer();
      final repository = container.read(songRepositoryProvider);
      final datasource = LocalSongDataSource(repository);

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

      final future = datasource.addSong(song);
      expect(future, isNotNull);
      expect(future, isA<Future<int>>());
    });

    test('LocalSongDataSource updateSong returns future', () {
      final container = ProviderContainer();
      final repository = container.read(songRepositoryProvider);
      final datasource = LocalSongDataSource(repository);

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

      final future = datasource.updateSong(song);
      expect(future, isNotNull);
      expect(future, isA<Future<void>>());
    });

    test('LocalSongDataSource deleteSong returns future', () {
      final container = ProviderContainer();
      final repository = container.read(songRepositoryProvider);
      final datasource = LocalSongDataSource(repository);

      final future = datasource.deleteSong(1);
      expect(future, isNotNull);
      expect(future, isA<Future<void>>());
    });
  });
}
