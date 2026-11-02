import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/data/database/app_database.dart';
import 'package:moodify/data/models/song_model.dart';
import 'package:moodify/core/providers/app_providers.dart';
import 'package:drift/drift.dart' as drift;

class SongRepository {
  final AppDatabase database;

  SongRepository(this.database);

  // Get all songs
  Future<List<SongModel>> getAllSongs() async {
    final songs = await database.getAllSongs();
    return songs.map((s) => _songFromDrift(s)).toList();
  }

  // Get song by ID
  Future<SongModel?> getSongById(int id) async {
    final song = await database.getSongById(id);
    return song != null ? _songFromDrift(song) : null;
  }

  // Search songs
  Future<List<SongModel>> searchSongs(String query) async {
    final songs = await database.searchSongs(query);
    return songs.map((s) => _songFromDrift(s)).toList();
  }

  SongModel _songFromDrift(Song s) {
    return SongModel(
      id: s.id,
      title: s.title,
      artist: s.artist,
      album: s.album,
      uri: s.uri,
      duration: s.duration,
      albumId: s.albumId,
      artistId: s.artistId,
      coverPath: s.coverPath,
      year: s.year,
      genre: s.genre,
      size: s.size,
      dateAdded: DateTime.fromMillisecondsSinceEpoch(s.dateAdded),
    );
  }

  // Add song
  Future<int> addSong(SongModel song) async {
    return database.insertSong(
      SongsCompanion.insert(
        title: song.title,
        uri: song.uri,
        duration: song.duration,
        artist: drift.Value(song.artist),
        album: drift.Value(song.album),
        albumId: drift.Value(song.albumId),
        artistId: drift.Value(song.artistId),
        coverPath: drift.Value(song.coverPath),
        year: drift.Value(song.year),
        genre: drift.Value(song.genre),
        size: drift.Value(song.size),
        dateAdded: song.dateAdded.millisecondsSinceEpoch,
      ),
    );
  }

  // Update song
  Future<int> updateSong(SongModel song) async {
    return database.updateSong(
      song.id,
      SongsCompanion(
        title: drift.Value(song.title),
        artist: drift.Value(song.artist),
        album: drift.Value(song.album),
        uri: drift.Value(song.uri),
        duration: drift.Value(song.duration),
        albumId: drift.Value(song.albumId),
        artistId: drift.Value(song.artistId),
        coverPath: drift.Value(song.coverPath),
        year: drift.Value(song.year),
        genre: drift.Value(song.genre),
        size: drift.Value(song.size),
        dateAdded: drift.Value(song.dateAdded.millisecondsSinceEpoch),
      ),
    );
  }

  // Delete song
  Future<void> deleteSong(int id) async {
    await database.deleteSong(id);
  }
}

final songRepositoryProvider = Provider<SongRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return SongRepository(db);
});
