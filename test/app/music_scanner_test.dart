import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/core/services/music_scanner.dart';

void main() {
  group('MusicScanner Tests', () {
    test('MusicScanner provider exists', () {
      final container = ProviderContainer();

      expect(container.read(musicScannerProvider), isNotNull);
    });

    test('MusicScanner can be created', () {
      final scanner = MusicScannerService();

      expect(scanner, isNotNull);
    });

    test('MusicScanner has expected methods', () {
      final scanner = MusicScannerService();

      expect(scanner.requestPermission, isNotNull);
      expect(scanner.scanMusic, isNotNull);
      expect(scanner.scanAlbums, isNotNull);
      expect(scanner.scanArtists, isNotNull);
      expect(scanner.scanFolders, isNotNull);
    });

    test('MusicScanner requestPermission returns future', () {
      final scanner = MusicScannerService();

      final future = scanner.requestPermission();
      expect(future, isNotNull);
      expect(future, isA<Future<bool>>());
    });

    test('MusicScanner scanMusic returns future', () {
      final scanner = MusicScannerService();

      final future = scanner.scanMusic();
      expect(future, isNotNull);
      expect(future, isA<Future<List<SongModel>>>());
    });

    test('MusicScanner scanAlbums returns future', () {
      final scanner = MusicScannerService();

      final future = scanner.scanAlbums();
      expect(future, isNotNull);
      expect(future, isA<Future<List<AlbumModel>>>());
    });

    test('MusicScanner scanArtists returns future', () {
      final scanner = MusicScannerService();

      final future = scanner.scanArtists();
      expect(future, isNotNull);
      expect(future, isA<Future<List<ArtistModel>>>());
    });

    test('MusicScanner scanFolders returns future', () {
      final scanner = MusicScannerService();

      final future = scanner.scanFolders();
      expect(future, isNotNull);
      expect(future, isA<Future<List<FolderModel>>>());
    });

    test('MusicScanner provider is accessible', () {
      final container = ProviderContainer();
      final scanner = container.read(musicScannerProvider);

      expect(scanner, isNotNull);
      expect(scanner, isA<MusicScannerService>());
    });

    test('MusicScanner can be accessed from provider', () {
      final container = ProviderContainer();
      final scanner = container.read(musicScannerProvider);

      expect(scanner.requestPermission, isNotNull);
      expect(scanner.scanMusic, isNotNull);
      expect(scanner.scanAlbums, isNotNull);
      expect(scanner.scanArtists, isNotNull);
      expect(scanner.scanFolders, isNotNull);
    });
  });
}
