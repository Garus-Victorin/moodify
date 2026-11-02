/// Modèle représentant un album musical
class AlbumModel {
  final int id;
  final String name;
  final String artist;
  final int artistId;
  final String? coverPath;
  final DateTime releaseDate;
  final int songCount;
  final int totalDuration;

  const AlbumModel({
    required this.id,
    required this.name,
    required this.artist,
    required this.artistId,
    this.coverPath,
    required this.releaseDate,
    required this.songCount,
    required this.totalDuration,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'artist': artist,
    'artist_id': artistId,
    'cover_path': coverPath,
    'release_date': releaseDate.millisecondsSinceEpoch,
    'song_count': songCount,
    'total_duration': totalDuration,
  };

  factory AlbumModel.fromMap(Map<String, dynamic> map) => AlbumModel(
    id: map['id'] as int,
    name: map['name'] as String,
    artist: map['artist'] as String,
    artistId: map['artist_id'] as int,
    coverPath: map['cover_path'] as String?,
    releaseDate: DateTime.fromMillisecondsSinceEpoch(
      map['release_date'] as int? ?? DateTime.now().millisecondsSinceEpoch,
    ),
    songCount: map['song_count'] as int? ?? 0,
    totalDuration: map['total_duration'] as int? ?? 0,
  );

  AlbumModel copyWith({
    int? id,
    String? name,
    String? artist,
    int? artistId,
    String? coverPath,
    DateTime? releaseDate,
    int? songCount,
    int? totalDuration,
  }) {
    return AlbumModel(
      id: id ?? this.id,
      name: name ?? this.name,
      artist: artist ?? this.artist,
      artistId: artistId ?? this.artistId,
      coverPath: coverPath ?? this.coverPath,
      releaseDate: releaseDate ?? this.releaseDate,
      songCount: songCount ?? this.songCount,
      totalDuration: totalDuration ?? this.totalDuration,
    );
  }
}
