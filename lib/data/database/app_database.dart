import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

part 'app_database.g.dart';

// Tables
class Songs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get artist => text().withDefault(const Constant('Unknown'))();
  TextColumn get album => text().withDefault(const Constant('Unknown Album'))();
  TextColumn get uri => text()();
  IntColumn get duration => integer()();
  IntColumn get albumId =>
      integer().references(Albums, #id).withDefault(const Constant(0))();
  IntColumn get artistId =>
      integer().references(Artists, #id).withDefault(const Constant(0))();
  TextColumn get coverPath => text().nullable()();
  IntColumn get year => integer().withDefault(const Constant(0))();
  TextColumn get genre => text().withDefault(const Constant('Unknown'))();
  IntColumn get size => integer().withDefault(const Constant(0))();
  IntColumn get dateAdded => integer()();
}

class Albums extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get artist => text().withDefault(const Constant('Unknown'))();
  IntColumn get artistId =>
      integer().references(Artists, #id).withDefault(const Constant(0))();
  TextColumn get coverPath => text().nullable()();
  IntColumn get releaseDate => integer().withDefault(const Constant(0))();
  IntColumn get songCount => integer().withDefault(const Constant(0))();
  IntColumn get totalDuration => integer().withDefault(const Constant(0))();
}

class Artists extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get coverPath => text().nullable()();
  IntColumn get albumCount => integer().withDefault(const Constant(0))();
  IntColumn get songCount => integer().withDefault(const Constant(0))();
  IntColumn get totalDuration => integer().withDefault(const Constant(0))();
}

class Playlists extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get coverPath => text().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
}

class PlaylistSongs extends Table {
  IntColumn get playlistId => integer().references(Playlists, #id)();
  IntColumn get songId => integer().references(Songs, #id)();
  IntColumn get orderIndex => integer()();

  @override
  Set<Column> get primaryKey => {playlistId, songId};
}

class Favorites extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get songId => integer().references(Songs, #id)();
  IntColumn get addedAt => integer()();
}

class History extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get songId => integer().references(Songs, #id)();
  IntColumn get playedAt => integer()();
  IntColumn get playDuration => integer().withDefault(const Constant(0))();
}

class Lyrics extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get songId => integer().references(Songs, #id)();
  TextColumn get source => text().withDefault(const Constant('embedded'))();
  TextColumn get content => text()();
}

class Settings extends Table {
  IntColumn get key => integer()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};
}

@DriftDatabase(
  tables: [
    Songs,
    Albums,
    Artists,
    Playlists,
    PlaylistSongs,
    Favorites,
    History,
    Lyrics,
    Settings,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          // Add migration logic here
        }
      },
    );
  }

  // Song queries
  Future<int> insertSong(SongsCompanion companion) =>
      into(songs).insert(companion);
  Future<int> updateSong(int id, SongsCompanion companion) =>
      (update(songs)..where((t) => t.id.equals(id))).write(companion);
  Future<int> deleteSong(int id) =>
      (delete(songs)..where((t) => t.id.equals(id))).go();
  Future<List<Song>> getAllSongs() =>
      (select(songs)..orderBy([(t) => OrderingTerm.desc(t.dateAdded)])).get();
  Future<List<Song>> searchSongs(String query) async {
    final q = '%$query%';
    return (select(songs)
          ..where((s) => s.title.like(q) | s.artist.like(q) | s.album.like(q))
          ..orderBy([(t) => OrderingTerm.asc(t.title)]))
        .get();
  }

  Future<Song?> getSongById(int id) =>
      (select(songs)..where((s) => s.id.equals(id))).getSingleOrNull();

  // Album queries
  Future<List<Album>> getAllAlbums() =>
      (select(albums)..orderBy([(t) => OrderingTerm.asc(t.name)])).get();

  // Artist queries
  Future<List<Artist>> getAllArtists() =>
      (select(artists)..orderBy([(t) => OrderingTerm.asc(t.name)])).get();

  // Playlist queries
  Future<int> insertPlaylist(PlaylistsCompanion companion) =>
      into(playlists).insert(companion);
  Future<int> deletePlaylist(int id) =>
      (delete(playlists)..where((t) => t.id.equals(id))).go();
  Future<List<Playlist>> getAllPlaylists() =>
      (select(playlists)..orderBy([(t) => OrderingTerm.desc(t.updatedAt)]))
          .get();

  Future<int> addSongToPlaylist(int playlistId, int songId, int order) {
    return into(playlistSongs).insert(
      PlaylistSongsCompanion.insert(
        playlistId: playlistId,
        songId: songId,
        orderIndex: order,
      ),
    );
  }

  Future<int> removeSongFromPlaylist(int playlistId, int songId) =>
      (delete(playlistSongs)
            ..where(
              (ps) =>
                  ps.playlistId.equals(playlistId) & ps.songId.equals(songId),
            ))
          .go();
  Future<List<Song>> getSongsInPlaylist(int playlistId) async {
    final links = await (select(playlistSongs)
          ..where((ps) => ps.playlistId.equals(playlistId))
          ..orderBy([(ps) => OrderingTerm.asc(ps.orderIndex)]))
        .get();
    if (links.isEmpty) return [];
    final ids = links.map((l) => l.songId).toList();
    return (select(songs)..where((s) => s.id.isIn(ids))).get();
  }

  // Favorite queries
  Future<int> addFavorite(int songId) => into(favorites).insert(
        FavoritesCompanion.insert(
          songId: songId,
          addedAt: DateTime.now().millisecondsSinceEpoch,
        ),
      );
  Future<int> removeFavorite(int songId) =>
      (delete(favorites)..where((f) => f.songId.equals(songId))).go();
  Future<List<Song>> getFavorites() async {
    final favs = await (select(favorites)).get();
    if (favs.isEmpty) return [];
    final ids = favs.map((f) => f.songId).toList();
    return (select(songs)..where((s) => s.id.isIn(ids))).get();
  }

  Future<bool> isFavorited(int songId) async {
    final q = select(favorites)..where((f) => f.songId.equals(songId));
    return q.getSingleOrNull() != null;
  }

  // History queries
  Future<int> addToHistory(int songId, Duration duration) =>
      into(history).insert(
        HistoryCompanion.insert(
          songId: songId,
          playedAt: DateTime.now().millisecondsSinceEpoch,
          playDuration: Value(duration.inMilliseconds),
        ),
      );
  Future<List<Song>> getRecentPlayed({int limit = 20}) async {
    final hist = await (select(history)
          ..orderBy([(h) => OrderingTerm.desc(h.playedAt)])
          ..limit(limit))
        .get();
    if (hist.isEmpty) return [];
    final ids = hist.map((h) => h.songId).toList();
    return (select(songs)..where((s) => s.id.isIn(ids))).get();
  }

  // Lyrics queries
  Future<int> saveLyrics(
    int songId,
    String content, {
    String source = 'embedded',
  }) =>
      into(lyrics).insert(
        LyricsCompanion.insert(
          songId: songId,
          source: Value(source),
          content: content,
        ),
      );
  Future<List<Lyric>> getLyricsForSong(int songId) =>
      (select(lyrics)..where((l) => l.songId.equals(songId))).get();

  // Settings queries
  Future<int> saveSetting(int key, String value) => into(settings).insert(
        SettingsCompanion.insert(
          key: Value(key),
          value: value,
        ),
        mode: InsertMode.insertOrReplace,
      );
  Future<Setting?> getSetting(int key) =>
      (select(settings)..where((s) => s.key.equals(key))).getSingleOrNull();
}
