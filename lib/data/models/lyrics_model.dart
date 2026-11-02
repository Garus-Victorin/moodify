/// Modle pour les paroles synchronises
class LyricsLine {
  final Duration time;
  final String text;

  const LyricsLine({required this.time, required this.text});
}

class LyricsModel {
  final int songId;
  final List<LyricsLine> lines;
  final String source;

  const LyricsModel({
    required this.songId,
    required this.lines,
    this.source = 'embedded',
  });

  LyricsLine? getLineAt(Duration position) {
    if (lines.isEmpty) return null;
    LyricsLine? current;
    for (final line in lines) {
      if (position >= line.time) {
        current = line;
      } else {
        break;
      }
    }
    return current;
  }

  int getCurrentIndex(Duration position) {
    int index = 0;
    for (int i = 0; i < lines.length; i++) {
      if (position >= lines[i].time) {
        index = i;
      } else {
        break;
      }
    }
    return index;
  }
}
