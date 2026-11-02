import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/data/models/song_model.dart';
import 'package:moodify/data/repositories/song_repository.dart';

class LocalSongDataSource {
  final SongRepository repository;

  LocalSongDataSource(this.repository);

  // Get all songs from local storage
  Future<List<SongModel>> getAllSongs() {
    return repository.getAllSongs();
  }

  // Get song by ID
  Future<SongModel?> getSongById(int id) {
    return repository.getSongById(id);
  }

  // Search songs
  Future<List<SongModel>> searchSongs(String query) {
    return repository.searchSongs(query);
  }

  // Add song to database
  Future<int> addSong(SongModel song) {
    return repository.addSong(song);
  }

  // Update song in database
  Future<void> updateSong(SongModel song) {
    return repository.updateSong(song);
  }

  // Delete song from database
  Future<void> deleteSong(int id) {
    return repository.deleteSong(id);
  }
}

final localSongDataSourceProvider = Provider<LocalSongDataSource>((ref) {
  final repository = ref.watch(songRepositoryProvider);
  return LocalSongDataSource(repository);
});
