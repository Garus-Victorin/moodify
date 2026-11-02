import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/core/services/app_service.dart';

void main() {
  group('AppService Tests', () {
    test('AppService can be created', () {
      final container = ProviderContainer();
      final appService = AppService(container);

      expect(appService, isNotNull);
      expect(appService.ref, isNotNull);
    });

    test('AppService has expected methods', () {
      final container = ProviderContainer();
      final appService = AppService(container);

      expect(appService.initialize, isNotNull);
      expect(appService.database, isNotNull);
      expect(appService.audioService, isNotNull);
      expect(appService.musicScanner, isNotNull);
    });

    test('AppService provider exists', () {
      final container = ProviderContainer();

      expect(container.read(appServiceProvider), isNotNull);
    });

    test('Database provider exists', () {
      final container = ProviderContainer();

      expect(container.read(databaseProvider), isNotNull);
    });

    test('AppService can access database', () {
      final container = ProviderContainer();
      final appService = container.read(appServiceProvider);

      expect(appService.database, isNotNull);
    });

    test('AppService can access audio service', () {
      final container = ProviderContainer();
      final appService = container.read(appServiceProvider);

      expect(appService.audioService, isNotNull);
    });

    test('AppService can access music scanner', () {
      final container = ProviderContainer();
      final appService = container.read(appServiceProvider);

      expect(appService.musicScanner, isNotNull);
    });

    test('AppService initialize method exists', () {
      final container = ProviderContainer();
      final appService = container.read(appServiceProvider);

      expect(appService.initialize, isNotNull);
    });

    test('AppService database property exists', () {
      final container = ProviderContainer();
      final appService = container.read(appServiceProvider);

      expect(appService.database, isNotNull);
    });

    test('AppService audioService property exists', () {
      final container = ProviderContainer();
      final appService = container.read(appServiceProvider);

      expect(appService.audioService, isNotNull);
    });

    test('AppService musicScanner property exists', () {
      final container = ProviderContainer();
      final appService = container.read(appServiceProvider);

      expect(appService.musicScanner, isNotNull);
    });
  });
}
