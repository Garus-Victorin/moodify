import 'package:flutter_test/flutter_test.dart';
import 'package:moodify/core/constants/app_constants.dart';

void main() {
  group('AppConstants Tests', () {
    test('App constants are defined', () {
      expect(AppConstants.appName, 'Moodify');
      expect(AppConstants.appVersion, '1.0.0');
      expect(AppConstants.appDescription,
          'Un lecteur musical Android moderne, rapide et entièrement hors ligne');
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
      expect(AppConstants.supportedAudioFormats, contains('aac'));
      expect(AppConstants.supportedAudioFormats, contains('m4a'));
      expect(AppConstants.supportedAudioFormats, contains('ogg'));
    });

    test('Equalizer presets are defined', () {
      expect(AppConstants.equalizerPresets, isNotEmpty);
      expect(AppConstants.equalizerPresets, containsKey('normal'));
      expect(AppConstants.equalizerPresets, containsKey('rock'));
      expect(AppConstants.equalizerPresets, containsKey('pop'));
      expect(AppConstants.equalizerPresets, containsKey('jazz'));
      expect(AppConstants.equalizerPresets, containsKey('classical'));
      expect(AppConstants.equalizerPresets, containsKey('hiphop'));
      expect(AppConstants.equalizerPresets, containsKey('dance'));
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

    test('Equalizer presets have correct values', () {
      expect(AppConstants.equalizerPresets['normal'], hasLength(10));
      expect(AppConstants.equalizerPresets['rock'], hasLength(10));
      expect(AppConstants.equalizerPresets['pop'], hasLength(10));
      expect(AppConstants.equalizerPresets['jazz'], hasLength(10));
      expect(AppConstants.equalizerPresets['classical'], hasLength(10));
      expect(AppConstants.equalizerPresets['hiphop'], hasLength(10));
      expect(AppConstants.equalizerPresets['dance'], hasLength(10));
    });

    test('Theme modes have correct values', () {
      expect(AppConstants.themeModes, hasLength(3));
      expect(AppConstants.themeModes[0], 'light');
      expect(AppConstants.themeModes[1], 'dark');
      expect(AppConstants.themeModes[2], 'amoled');
    });

    test('Repeat modes have correct values', () {
      expect(AppConstants.repeatModes, hasLength(3));
      expect(AppConstants.repeatModes[0], 'off');
      expect(AppConstants.repeatModes[1], 'all');
      expect(AppConstants.repeatModes[2], 'one');
    });

    test('Sleep timer options have correct values', () {
      expect(AppConstants.sleepTimerOptions, hasLength(4));
      expect(AppConstants.sleepTimerOptions[0], 5);
      expect(AppConstants.sleepTimerOptions[1], 15);
      expect(AppConstants.sleepTimerOptions[2], 30);
      expect(AppConstants.sleepTimerOptions[3], 60);
    });
  });
}
