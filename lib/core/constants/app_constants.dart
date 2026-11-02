class AppConstants {
  static const String appName = 'Moodify';
  static const String appVersion = '1.0.0';
  static const String appDescription =
      'Un lecteur musical Android moderne, rapide et entièrement hors ligne';

  // Database constants
  static const String dbName = 'moodify.db';
  static const int dbVersion = 1;

  // Audio formats
  static const List<String> supportedAudioFormats = [
    'mp3',
    'flac',
    'wav',
    'aac',
    'm4a',
    'ogg',
  ];

  // Equalizer presets
  static const Map<String, List<double>> equalizerPresets = {
    'normal': [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
    'rock': [0.5, 0.3, 0.0, -0.2, -0.3, -0.2, 0.0, 0.2, 0.3, 0.4],
    'pop': [0.2, 0.1, 0.0, -0.1, -0.1, 0.0, 0.1, 0.2, 0.2, 0.2],
    'jazz': [-0.2, -0.1, 0.0, 0.1, 0.2, 0.3, 0.2, 0.1, 0.0, -0.1],
    'classical': [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
    'hiphop': [0.6, 0.4, 0.2, 0.0, -0.2, -0.3, -0.2, 0.0, 0.1, 0.2],
    'dance': [0.4, 0.3, 0.2, 0.1, 0.0, -0.1, -0.1, 0.0, 0.1, 0.2],
  };

  // Theme modes
  static const List<String> themeModes = ['light', 'dark', 'amoled'];

  // Repeat modes
  static const List<String> repeatModes = ['off', 'all', 'one'];

  // Sleep timer options
  static const List<int> sleepTimerOptions = [5, 15, 30, 60]; // in minutes
}
