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
  });
}
