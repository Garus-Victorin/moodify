import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/core/services/app_service.dart';
import 'package:moodify/core/services/music_scanner.dart';
import 'package:moodify/data/database/app_database.dart';
import 'package:moodify/data/datasources/local_song_datasource.dart';
import 'package:moodify/data/repositories/song_repository.dart';
import 'package:moodify/data/models/song_model.dart';

export 'package:moodify/core/services/app_service.dart';
export 'package:moodify/core/services/music_scanner.dart';

// Root provider for app initialization
final appInitializationProvider = FutureProvider<void>((ref) async {
  final appService = ref.read(appServiceProvider);
  await appService.initialize();
});

// Song repository provider
final songRepositoryProvider = Provider<SongRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return SongRepository(db);
});

// Local song data source provider
final localSongDataSourceProvider = Provider<LocalSongDataSource>((ref) {
  final repository = ref.watch(songRepositoryProvider);
  return LocalSongDataSource(repository);
});

// All songs provider
final allSongsProvider = FutureProvider.family<List<SongModel>, bool>((
  ref,
  forceRefresh,
) async {
  final scanner = ref.watch(musicScannerProvider);
  return scanner.scanMusic();
});

// Search songs provider
final searchSongsProvider = FutureProvider.family<List<SongModel>, String>((
  ref,
  query,
) async {
  final scanner = ref.watch(musicScannerProvider);
  final allSongs = await scanner.scanMusic();
  return allSongs.where((song) {
    final q = query.toLowerCase();
    return song.title.toLowerCase().contains(q) ||
        song.artist.toLowerCase().contains(q) ||
        song.album.toLowerCase().contains(q);
  }).toList();
});
