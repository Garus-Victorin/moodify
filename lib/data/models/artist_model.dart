/// Modèle représentant un artiste musical
class ArtistModel {
  final int id;
  final String name;
  final String? coverPath;
  final int albumCount;
  final int songCount;
  final int totalDuration;

  const ArtistModel({
    required this.id,
    required this.name,
    this.coverPath,
    this.albumCount = 0,
    this.songCount = 0,
    this.totalDuration = 0,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'cover_path': coverPath,
    'album_count': albumCount,
    'song_count': songCount,
    'total_duration': totalDuration,
  };

  factory ArtistModel.fromMap(Map<String, dynamic> map) => ArtistModel(
    id: map['id'] as int,
    name: map['name'] as String,
    coverPath: map['cover_path'] as String?,
    albumCount: map['album_count'] as int? ?? 0,
    songCount: map['song_count'] as int? ?? 0,
    totalDuration: map['total_duration'] as int? ?? 0,
  );

  ArtistModel copyWith({
    int? id,
    String? name,
    String? coverPath,
    int? albumCount,
    int? songCount,
    int? totalDuration,
  }) {
    return ArtistModel(
      id: id ?? this.id,
      name: name ?? this.name,
      coverPath: coverPath ?? this.coverPath,
      albumCount: albumCount ?? this.albumCount,
      songCount: songCount ?? this.songCount,
      totalDuration: totalDuration ?? this.totalDuration,
    );
  }
}
