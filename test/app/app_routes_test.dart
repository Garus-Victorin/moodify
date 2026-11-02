import 'package:flutter_test/flutter_test.dart';
import 'package:moodify/routes/app_router.dart';
import 'package:moodify/routes/routes.dart';

void main() {
  group('AppRoutes Tests', () {
    test('AppRoutes has expected routes', () {
      expect(AppRoutes.favorites, '/favorites');
      expect(AppRoutes.equalizer, '/equalizer');
    });

    test('AppRoutes routes map is not empty', () {
      expect(AppRoutes.routes, isNotEmpty);
    });

    test('AppRoutes has favorites route', () {
      expect(AppRoutes.routes['/favorites'], isNotNull);
    });
  });
}
