import 'package:flutter_test/flutter_test.dart';
import 'package:moodify/data/models/song_model.dart';

void main() {
  group('SongModel Tests', () {
    test('SongModel creation', () {
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

      expect(song.id, 1);
      expect(song.title, 'Test Song');
      expect(song.artist, 'Test Artist');
      expect(song.album, 'Test Album');
      expect(song.uri, 'file://test.mp3');
      expect(song.duration, 180000);
    });

    test('SongModel toMap and fromMap', () {
      final originalSong = SongModel(
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

      final map = originalSong.toMap();
      final reconstructedSong = SongModel.fromMap(map);

      expect(reconstructedSong.id, originalSong.id);
      expect(reconstructedSong.title, originalSong.title);
      expect(reconstructedSong.artist, originalSong.artist);
      expect(reconstructedSong.album, originalSong.album);
      expect(reconstructedSong.uri, originalSong.uri);
      expect(reconstructedSong.duration, originalSong.duration);
    });

    test('SongModel copyWith', () {
      final originalSong = SongModel(
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

      final modifiedSong = originalSong.copyWith(title: 'Modified Song');

      expect(modifiedSong.title, 'Modified Song');
      expect(modifiedSong.artist, originalSong.artist);
      expect(modifiedSong.album, originalSong.album);
    });
  });
}
