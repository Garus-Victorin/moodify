import 'package:flutter_test/flutter_test.dart';
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

    test('formatDuration formats correctly', () {
      expect(AppTheme.formatDuration(Duration(seconds: 60)), '01:00');
      expect(AppTheme.formatDuration(Duration(seconds: 125)), '02:05');
      expect(AppTheme.formatDuration(Duration(seconds: 3661)), '61:01');
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
  });
}
