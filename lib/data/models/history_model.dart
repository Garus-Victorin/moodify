/// Modle pour l'historique d'coute
class HistoryModel {
  final int id;
  final int songId;
  final DateTime playedAt;
  final int playDuration;

  const HistoryModel({
    required this.id,
    required this.songId,
    required this.playedAt,
    this.playDuration = 0,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'song_id': songId,
    'played_at': playedAt.millisecondsSinceEpoch,
    'play_duration': playDuration,
  };

  factory HistoryModel.fromMap(Map<String, dynamic> map) => HistoryModel(
    id: map['id'] as int,
    songId: map['song_id'] as int,
    playedAt: DateTime.fromMillisecondsSinceEpoch(map['played_at'] as int),
    playDuration: map['play_duration'] as int? ?? 0,
  );
}
