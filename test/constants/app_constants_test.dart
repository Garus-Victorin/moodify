import 'package:flutter_test/flutter_test.dart';
import 'package:moodify/core/constants/app_constants.dart';

void main() {
  group('AppConstants Tests', () {
    test('App constants are defined', () {
      expect(AppConstants.appName, 'Moodify');
      expect(AppConstants.appVersion, '1.0.0');
      expect(
        AppConstants.appDescription,
        'Un lecteur musical Android moderne, rapide et entièrement hors ligne',
      );
    });

    test('Database constants are defined', () {
      expect(AppConstants.dbName, 'moodify.db');
      expect(AppConstants.dbVersion, 1);
    });

    test('Supported audio formats are defined', () {
      expect(AppConstants.supportedAudioFormats, isNotEmpty);
      expect(AppConstants.supportedAudioFormats, contains('mp3'));
      expect(AppConstants.supportedAudioFormats, contains('flac'));
      expect(AppConstants.supportedAudioFormats, contains('wav'));
    });

    test('Equalizer presets are defined', () {
      expect(AppConstants.equalizerPresets, isNotEmpty);
      expect(AppConstants.equalizerPresets, containsKey('normal'));
      expect(AppConstants.equalizerPresets, containsKey('rock'));
      expect(AppConstants.equalizerPresets, containsKey('pop'));
    });

    test('Theme modes are defined', () {
      expect(AppConstants.themeModes, isNotEmpty);
      expect(AppConstants.themeModes, contains('light'));
      expect(AppConstants.themeModes, contains('dark'));
      expect(AppConstants.themeModes, contains('amoled'));
    });

    test('Repeat modes are defined', () {
      expect(AppConstants.repeatModes, isNotEmpty);
      expect(AppConstants.repeatModes, contains('off'));
      expect(AppConstants.repeatModes, contains('all'));
      expect(AppConstants.repeatModes, contains('one'));
    });

    test('Sleep timer options are defined', () {
      expect(AppConstants.sleepTimerOptions, isNotEmpty);
      expect(AppConstants.sleepTimerOptions, contains(5));
      expect(AppConstants.sleepTimerOptions, contains(15));
      expect(AppConstants.sleepTimerOptions, contains(30));
      expect(AppConstants.sleepTimerOptions, contains(60));
    });
  });
}
