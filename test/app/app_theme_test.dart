import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:moodify/core/theme/app_theme.dart';

void main() {
  group('AppTheme Tests', () {
    test('Light theme is defined', () {
      final theme = AppTheme.lightTheme;
      expect(theme, isNotNull);
      expect(theme.brightness, Brightness.light);
      expect(theme.useMaterial3, isTrue);
    });

    test('Dark theme is defined', () {
      final theme = AppTheme.darkTheme;
      expect(theme, isNotNull);
      expect(theme.brightness, Brightness.dark);
      expect(theme.useMaterial3, isTrue);
    });

    test('AMOLED theme is defined', () {
      final theme = AppTheme.amoledTheme;
      expect(theme, isNotNull);
      expect(theme.brightness, Brightness.dark);
      expect(theme.useMaterial3, isTrue);
    });

    test('Themes have consistent properties', () {
      final lightTheme = AppTheme.lightTheme;
      final darkTheme = AppTheme.darkTheme;
      final amoledTheme = AppTheme.amoledTheme;

      expect(lightTheme.useMaterial3, isTrue);
      expect(darkTheme.useMaterial3, isTrue);
      expect(amoledTheme.useMaterial3, isTrue);

      expect(lightTheme.fontFamily, 'Roboto');
      expect(darkTheme.fontFamily, 'Roboto');
      expect(amoledTheme.fontFamily, 'Roboto');
    });

    test('Light theme has correct colors', () {
      final theme = AppTheme.lightTheme;
      expect(theme.colorScheme.brightness, Brightness.light);
      expect(theme.scaffoldBackgroundColor, isNotNull);
      expect(theme.appBarTheme.backgroundColor, isNotNull);
      expect(theme.bottomNavigationBarTheme.backgroundColor, isNotNull);
    });

    test('Dark theme has correct colors', () {
      final theme = AppTheme.darkTheme;
      expect(theme.colorScheme.brightness, Brightness.dark);
      expect(theme.scaffoldBackgroundColor, isNotNull);
      expect(theme.appBarTheme.backgroundColor, isNotNull);
      expect(theme.bottomNavigationBarTheme.backgroundColor, isNotNull);
    });

    test('AMOLED theme has correct colors', () {
      final theme = AppTheme.amoledTheme;
      expect(theme.colorScheme.brightness, Brightness.dark);
      expect(theme.scaffoldBackgroundColor, Colors.black);
      expect(theme.appBarTheme.backgroundColor, Colors.black);
      expect(theme.bottomNavigationBarTheme.backgroundColor, Colors.black);
    });

    test('formatDuration formats correctly', () {
      expect(AppTheme.formatDuration(Duration(seconds: 60)), '01:00');
      expect(AppTheme.formatDuration(Duration(seconds: 125)), '02:05');
      expect(AppTheme.formatDuration(Duration(seconds: 3661)), '61:01');
      expect(AppTheme.formatDuration(Duration.zero), '00:00');
    });

    test('formatDuration handles edge cases', () {
      expect(AppTheme.formatDuration(Duration(seconds: 0)), '00:00');
      expect(AppTheme.formatDuration(Duration(seconds: 59)), '00:59');
      expect(AppTheme.formatDuration(Duration(seconds: 60)), '01:00');
      expect(AppTheme.formatDuration(Duration(seconds: 3599)), '59:59');
      expect(AppTheme.formatDuration(Duration(seconds: 3600)), '60:00');
    });

    test('Themes have consistent text themes', () {
      final lightTheme = AppTheme.lightTheme;
      final darkTheme = AppTheme.darkTheme;
      final amoledTheme = AppTheme.amoledTheme;

      expect(lightTheme.textTheme.headlineLarge, isNotNull);
      expect(lightTheme.textTheme.headlineMedium, isNotNull);
      expect(lightTheme.textTheme.headlineSmall, isNotNull);
      expect(lightTheme.textTheme.titleLarge, isNotNull);
      expect(lightTheme.textTheme.titleMedium, isNotNull);
      expect(lightTheme.textTheme.bodyLarge, isNotNull);
      expect(lightTheme.textTheme.bodyMedium, isNotNull);
      expect(lightTheme.textTheme.bodySmall, isNotNull);

      expect(darkTheme.textTheme.headlineLarge, isNotNull);
      expect(darkTheme.textTheme.headlineMedium, isNotNull);
      expect(darkTheme.textTheme.headlineSmall, isNotNull);
      expect(darkTheme.textTheme.titleLarge, isNotNull);
      expect(darkTheme.textTheme.titleMedium, isNotNull);
      expect(darkTheme.textTheme.bodyLarge, isNotNull);
      expect(darkTheme.textTheme.bodyMedium, isNotNull);
      expect(darkTheme.textTheme.bodySmall, isNotNull);

      expect(amoledTheme.textTheme.headlineLarge, isNotNull);
      expect(amoledTheme.textTheme.headlineMedium, isNotNull);
      expect(amoledTheme.textTheme.headlineSmall, isNotNull);
      expect(amoledTheme.textTheme.titleLarge, isNotNull);
      expect(amoledTheme.textTheme.titleMedium, isNotNull);
      expect(amoledTheme.textTheme.bodyLarge, isNotNull);
      expect(amoledTheme.textTheme.bodyMedium, isNotNull);
      expect(amoledTheme.textTheme.bodySmall, isNotNull);
    });

    test('Themes have consistent component themes', () {
      final lightTheme = AppTheme.lightTheme;
      final darkTheme = AppTheme.darkTheme;
      final amoledTheme = AppTheme.amoledTheme;

      expect(lightTheme.appBarTheme, isNotNull);
      expect(lightTheme.cardTheme, isNotNull);
      expect(lightTheme.bottomNavigationBarTheme, isNotNull);
      expect(lightTheme.tabsTheme, isNotNull);
      expect(lightTheme.floatingActionButtonTheme, isNotNull);

      expect(darkTheme.appBarTheme, isNotNull);
      expect(darkTheme.cardTheme, isNotNull);
      expect(darkTheme.bottomNavigationBarTheme, isNotNull);
      expect(darkTheme.tabsTheme, isNotNull);
      expect(darkTheme.floatingActionButtonTheme, isNotNull);

      expect(amoledTheme.appBarTheme, isNotNull);
      expect(amoledTheme.cardTheme, isNotNull);
      expect(amoledTheme.bottomNavigationBarTheme, isNotNull);
      expect(amoledTheme.tabsTheme, isNotNull);
      expect(amoledTheme.floatingActionButtonTheme, isNotNull);
    });
  });
}
