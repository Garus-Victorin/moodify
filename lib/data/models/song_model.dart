/// Modèle représentant une chanson/morceau musical
class SongModel {
  final int id;
  final String title;
  final String artist;
  final String album;
  final String uri;
  final int duration;
  final int albumId;
  final int artistId;
  final String? coverPath;
  final int year;
  final String genre;
  final int size;
  final DateTime dateAdded;

  const SongModel({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.uri,
    required this.duration,
    required this.albumId,
    required this.artistId,
    this.coverPath,
    this.year = 0,
    this.genre = 'Unknown',
    this.size = 0,
    required this.dateAdded,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'artist': artist,
      'album': album,
      'uri': uri,
      'duration': duration,
      'album_id': albumId,
      'artist_id': artistId,
      'cover_path': coverPath,
      'year': year,
      'genre': genre,
      'size': size,
      'date_added': dateAdded.millisecondsSinceEpoch,
    };
  }

  factory SongModel.fromMap(Map<String, dynamic> map) {
    return SongModel(
      id: map['id'] as int,
      title: map['title'] as String,
      artist: map['artist'] as String,
      album: map['album'] as String,
      uri: map['uri'] as String,
      duration: map['duration'] as int,
      albumId: map['album_id'] as int,
      artistId: map['artist_id'] as int,
      coverPath: map['cover_path'] as String?,
      year: map['year'] as int? ?? 0,
      genre: map['genre'] as String? ?? 'Unknown',
      size: map['size'] as int? ?? 0,
      dateAdded: DateTime.fromMillisecondsSinceEpoch(
        map['date_added'] as int? ?? DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  SongModel copyWith({
    String? title,
    String? artist,
    String? album,
    String? uri,
    int? duration,
    int? albumId,
    int? artistId,
    String? coverPath,
    int? year,
    String? genre,
    int? size,
    DateTime? dateAdded,
  }) {
    return SongModel(
      id: id,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      album: album ?? this.album,
      uri: uri ?? this.uri,
      duration: duration ?? this.duration,
      albumId: albumId ?? this.albumId,
      artistId: artistId ?? this.artistId,
      coverPath: coverPath ?? this.coverPath,
      year: year ?? this.year,
      genre: genre ?? this.genre,
      size: size ?? this.size,
      dateAdded: dateAdded ?? this.dateAdded,
    );
  }

  @override
  String toString() => 'SongModel($title by $artist)';
}
