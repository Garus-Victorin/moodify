/// Modèle représentant une playlist
class PlaylistModel {
  final int id;
  final String name;
  final String? description;
  final String? coverPath;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<int> songIds;

  const PlaylistModel({
    required this.id,
    required this.name,
    this.description,
    this.coverPath,
    required this.createdAt,
    required this.updatedAt,
    this.songIds = const [],
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'description': description,
    'cover_path': coverPath,
    'created_at': createdAt.millisecondsSinceEpoch,
    'updated_at': updatedAt.millisecondsSinceEpoch,
    'song_ids': songIds.join(','),
  };

  factory PlaylistModel.fromMap(Map<String, dynamic> map, List<int>? songIds) =>
      PlaylistModel(
        id: map['id'] as int,
        name: map['name'] as String,
        description: map['description'] as String?,
        coverPath: map['cover_path'] as String?,
        createdAt: DateTime.fromMillisecondsSinceEpoch(
          map['created_at'] as int? ?? DateTime.now().millisecondsSinceEpoch,
        ),
        updatedAt: DateTime.fromMillisecondsSinceEpoch(
          map['updated_at'] as int? ?? DateTime.now().millisecondsSinceEpoch,
        ),
        songIds: songIds ?? [],
      );

  PlaylistModel copyWith({
    int? id,
    String? name,
    String? description,
    String? coverPath,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<int>? songIds,
  }) {
    return PlaylistModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      coverPath: coverPath ?? this.coverPath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      songIds: songIds ?? this.songIds,
    );
  }
}
