/// Modle pour les favoris
class FavouriteModel {
  final int id;
  final int songId;
  final DateTime addedAt;

  const FavouriteModel({
    required this.id,
    required this.songId,
    required this.addedAt,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'song_id': songId,
    'added_at': addedAt.millisecondsSinceEpoch,
  };

  factory FavouriteModel.fromMap(Map<String, dynamic> map) => FavouriteModel(
    id: map['id'] as int,
    songId: map['song_id'] as int,
    addedAt: DateTime.fromMillisecondsSinceEpoch(map['added_at'] as int),
  );
}
