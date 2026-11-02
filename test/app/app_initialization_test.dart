import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/core/providers/app_providers.dart';

void main() {
  group('App Initialization Tests', () {
    test('App initialization provider exists', () {
      final container = ProviderContainer();

      // Verify that the initialization provider is accessible
      expect(container.read(appInitializationProvider), isNotNull);
    });

    test('App service provider exists', () {
      final container = ProviderContainer();

      // Verify that the app service provider is accessible
      expect(container.read(appServiceProvider), isNotNull);
    });

    test('Database provider exists', () {
      final container = ProviderContainer();

      // Verify that the database provider is accessible
      expect(container.read(databaseProvider), isNotNull);
    });

    test('Song repository provider exists', () {
      final container = ProviderContainer();

      // Verify that the song repository provider is accessible
      expect(container.read(songRepositoryProvider), isNotNull);
    });

    test('Local song data source provider exists', () {
      final container = ProviderContainer();

      // Verify that the local song data source provider is accessible
      expect(container.read(localSongDataSourceProvider), isNotNull);
    });

    test('All songs provider exists', () {
      final container = ProviderContainer();

      // Verify that the all songs provider is accessible
      expect(container.read(allSongsProvider), isNotNull);
    });

    test('Search songs provider exists', () {
      final container = ProviderContainer();

      // Verify that the search songs provider is accessible
      expect(container.read(searchSongsProvider('test')), isNotNull);
    });

    test('App initialization completes successfully', () async {
      final container = ProviderContainer();

      // Wait for the initialization to complete
      await container.read(appInitializationProvider.future);

      // Verify that the initialization completed without errors
      expect(true, isTrue);
    });

    test('App service initializes correctly', () {
      final container = ProviderContainer();
      final appService = container.read(appServiceProvider);

      // Verify that the app service is initialized
      expect(appService, isNotNull);

      // Verify that the app service has the expected methods
      expect(appService.initialize, isNotNull);
      expect(appService.database, isNotNull);
      expect(appService.audioService, isNotNull);
      expect(appService.musicScanner, isNotNull);
    });

    test('Database is initialized', () {
      final container = ProviderContainer();
      final db = container.read(databaseProvider);

      // Verify that the database is initialized
      expect(db, isNotNull);

      // Verify that the database has the expected properties
      expect(db.schemaVersion, 1);
    });

    test('Audio service is initialized', () {
      final container = ProviderContainer();
      final audioService = container.read(audioServiceProvider);

      // Verify that the audio service is initialized
      expect(audioService, isNotNull);

      // Verify that the audio service has the expected methods
      expect(audioService.play, isNotNull);
      expect(audioService.pause, isNotNull);
      expect(audioService.togglePlayPause, isNotNull);
      expect(audioService.seekTo, isNotNull);
      expect(audioService.next, isNotNull);
      expect(audioService.previous, isNotNull);
    });

    test('Music scanner is initialized', () {
      final container = ProviderContainer();
      final scanner = container.read(musicScannerProvider);

      // Verify that the music scanner is initialized
      expect(scanner, isNotNull);

      // Verify that the music scanner has the expected methods
      expect(scanner.requestPermission, isNotNull);
      expect(scanner.scanMusic, isNotNull);
      expect(scanner.scanAlbums, isNotNull);
      expect(scanner.scanArtists, isNotNull);
      expect(scanner.scanFolders, isNotNull);
    });
  });
}
