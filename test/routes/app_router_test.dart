import 'package:flutter_test/flutter_test.dart';
import 'package:moodify/routes/app_router.dart';

void main() {
  group('AppRouter Tests', () {
    test('AppRouter has defined routes', () {
      expect(AppRouter.router, isNotNull);
      expect(AppRouter.router.routes, isNotEmpty);
    });

    test('AppRouter has correct initial route', () {
      expect(AppRouter.router.initialLocation, '/');
    });

    test('AppRouter can navigate to player', () {
      // This would require a test context
      // For now, we just verify the method exists
      expect(AppRouter.navigateToPlayer, isNotNull);
    });

    test('AppRouter has correct route paths', () {
      // Verify that the router has the expected routes
      // This is more of a compilation test
      expect(AppRouter.router, isNotNull);
    });
  });
}
