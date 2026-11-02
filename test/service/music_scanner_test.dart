import 'package:flutter_test/flutter_test.dart';
import 'package:moodify/core/services/music_scanner.dart';

void main() {
  group('MusicScanner Tests', () {
    late MusicScannerService scanner;

    setUp(() {
      scanner = MusicScannerService();
    });

    test('MusicScanner is initialized', () {
      expect(scanner, isNotNull);
    });

    test('Permission request returns boolean', () async {
      final result = await scanner.requestPermission();
      expect(result, isA<bool>());
    });

    test('Scan music returns list of songs', () async {
      final songs = await scanner.scanMusic();
      expect(songs, isA<List<SongModel>>());
    });

    test('Scan albums returns list of albums', () async {
      final albums = await scanner.scanAlbums();
      expect(albums, isA<List<AlbumModel>>());
    });

    test('Scan artists returns list of artists', () async {
      final artists = await scanner.scanArtists();
      expect(artists, isA<List<ArtistModel>>());
    });

    test('Scan folders returns list of folders', () async {
      final folders = await scanner.scanFolders();
      expect(folders, isA<List<FolderModel>>());
    });
  });
}
