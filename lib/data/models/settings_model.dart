/// Modle pour les paramtres utilisateur
class SettingsModel {
  final int themeMode;
  final bool autoScan;
  final bool shuffleDefault;
  final bool repeatDefault;
  final bool crossfadeEnabled;
  final int crossfadeDuration;
  final String language;
  final bool showLyricsInPlayer;
  final String equalizerPreset;
  final double bassBoost;
  final double virtualizer;

  const SettingsModel({
    this.themeMode = 1,
    this.autoScan = true,
    this.shuffleDefault = false,
    this.repeatDefault = false,
    this.crossfadeEnabled = false,
    this.crossfadeDuration = 0,
    this.language = 'fr',
    this.showLyricsInPlayer = false,
    this.equalizerPreset = 'normal',
    this.bassBoost = 0.0,
    this.virtualizer = 0.0,
  });

  int get themeIndex => themeMode;
}
