import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/core/providers/app_providers.dart';

void main() {
  group('AppProviders Tests', () {
    test('App providers can be accessed', () {
      final container = ProviderContainer();

      // Verify that providers are accessible
      expect(container.read(appServiceProvider), isNotNull);
      expect(container.read(databaseProvider), isNotNull);
      expect(container.read(songRepositoryProvider), isNotNull);
      expect(container.read(localSongDataSourceProvider), isNotNull);
    });

    test('App initialization provider exists', () {
      final container = ProviderContainer();
      expect(container.read(appInitializationProvider), isNotNull);
    });

    test('All songs provider exists', () {
      final container = ProviderContainer();
      expect(container.read(allSongsProvider), isNotNull);
    });

    test('Search songs provider exists', () {
      final container = ProviderContainer();
      expect(container.read(searchSongsProvider('test')), isNotNull);
    });

    test('App service provider returns correct type', () {
      final container = ProviderContainer();
      final appService = container.read(appServiceProvider);

      expect(appService, isA<AppService>());
    });

    test('Database provider returns correct type', () {
      final container = ProviderContainer();
      final db = container.read(databaseProvider);

      expect(db, isA<AppDatabase>());
    });

    test('Song repository provider returns correct type', () {
      final container = ProviderContainer();
      final repository = container.read(songRepositoryProvider);

      expect(repository, isA<SongRepository>());
    });

    test('Local song data source provider returns correct type', () {
      final container = ProviderContainer();
      final datasource = container.read(localSongDataSourceProvider);

      expect(datasource, isA<LocalSongDataSource>());
    });

    test('All songs provider returns correct type', () {
      final container = ProviderContainer();
      final songs = container.read(allSongsProvider);

      expect(songs, isA<AsyncValue<List<SongModel>>>());
    });

    test('Search songs provider returns correct type', () {
      final container = ProviderContainer();
      final songs = container.read(searchSongsProvider('test'));

      expect(songs, isA<AsyncValue<List<SongModel>>>());
    });

    test('Providers can be refreshed', () {
      final container = ProviderContainer();

      // Verify that providers can be refreshed
      expect(() => container.refresh(appInitializationProvider), returnsNormally);
      expect(() => container.refresh(allSongsProvider), returnsNormally);
      expect(() => container.refresh(searchSongsProvider('test')), returnsNormally);
    });

    test('Providers can be disposed', () {
      final container = ProviderContainer();

      // Verify that providers can be disposed
      expect(() => container.dispose(), returnsNormally);
    });

    test('Providers can be accessed multiple times', () {
      final container = ProviderContainer();

      // Verify that providers can be accessed multiple times
      expect(container.read(appServiceProvider), isNotNull);
      expect(container.read(appServiceProvider), isNotNull);
      expect(container.read(databaseProvider), isNotNull);
      expect(container.read(databaseProvider), isNotNull);
    });
  });
}
