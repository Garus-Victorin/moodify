import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:on_audio_query/on_audio_query.dart'
    hide SongModel, AlbumModel, ArtistModel, FolderModel;
import 'package:permission_handler/permission_handler.dart';
import 'package:moodify/data/models/song_model.dart';
import 'package:moodify/data/models/album_model.dart';
import 'package:moodify/data/models/artist_model.dart';
import 'package:moodify/data/models/folder_model.dart';

class MusicScannerService {
  final OnAudioQuery _audioQuery = OnAudioQuery();

  Future<bool> requestPermission() async {
    if (Platform.isAndroid &&
        int.tryParse(Platform.version.split(' ').first ?? '0') != null) {
      final androidSdk = int.parse(Platform.version.split(' ').first);
      if (androidSdk >= 33) {
        var status = await Permission.audio.request();
        if (!status.isGranted) {
          status = await Permission.mediaLibrary.request();
        }
        return status.isGranted;
      } else {
        var status = await Permission.storage.request();
        return status.isGranted;
      }
    }
    return true;
  }

  Future<List<SongModel>> scanMusic() async {
    final hasPermission = await requestPermission();
    if (!hasPermission) return [];

    try {
      final songs = await _audioQuery.querySongs(
        sortType: SongSortType.TITLE,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
      );

      return songs.map((song) {
        String artist = song.artist ?? 'Unknown';
        String album = song.album ?? 'Unknown Album';

        return SongModel(
          id: song.id ?? 0,
          title: song.title ?? 'Unknown',
          artist: artist,
          album: album,
          uri: song.uri ?? '',
          duration: song.duration ?? 0,
          albumId: song.albumId ?? 0,
          artistId: song.artistId ?? 0,
          coverPath: song.data,
          year: 0,
          genre: song.genre ?? 'Unknown',
          size: song.size ?? 0,
          dateAdded: DateTime.fromMillisecondsSinceEpoch(song.dateAdded ?? 0),
        );
      }).toList();
    } catch (e) {
      print('Error scanning music: $e');
      return [];
    }
  }

  Future<List<AlbumModel>> scanAlbums() async {
    try {
      final albums = await _audioQuery.queryAlbums(
        sortType: AlbumSortType.ALBUM,
        orderType: OrderType.ASC_OR_SMALLER,
      );

      return albums.map((album) {
        return AlbumModel(
          id: album.id ?? 0,
          name: album.album ?? 'Unknown Album',
          artist: album.artist ?? 'Unknown',
          artistId: album.artistId ?? 0,
          coverPath: null,
          releaseDate: DateTime.now(),
          songCount: album.numOfSongs ?? 0,
          totalDuration: 0,
        );
      }).toList();
    } catch (e) {
      print('Error scanning albums: $e');
      return [];
    }
  }

  Future<List<ArtistModel>> scanArtists() async {
    try {
      final artists = await _audioQuery.queryArtists(
        sortType: ArtistSortType.ARTIST,
        orderType: OrderType.ASC_OR_SMALLER,
      );

      return artists.map((artist) {
        return ArtistModel(
          id: artist.id ?? 0,
          name: artist.artist ?? 'Unknown',
          coverPath: null,
          albumCount: artist.numberOfAlbums ?? 0,
          songCount: artist.numberOfTracks ?? 0,
          totalDuration: 0,
        );
      }).toList();
    } catch (e) {
      print('Error scanning artists: $e');
      return [];
    }
  }

  Future<List<FolderModel>> scanFolders() async {
    try {
      final songs = await _audioQuery.querySongs(
        sortType: SongSortType.TITLE,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
      );
      Map<String, FolderModel> folderMap = {};

      for (final song in songs) {
        final path = song.data;
        if (path == null) continue;
        final name = Directory(path).parent.absolute.path.split('/').last;

        if (!folderMap.containsKey(name)) {
          folderMap[name] = FolderModel(
            id: path.hashCode,
            name: name,
            path: path,
            songCount: 0,
          );
        }
      }

      return folderMap.values.toList();
    } catch (e) {
      print('Error scanning folders: $e');
      return [];
    }
  }
}

class MusicScannerNotifier extends StateNotifier<MusicScannerService> {
  MusicScannerNotifier() : super(MusicScannerService());
}

final musicScannerProvider =
    StateNotifierProvider<MusicScannerNotifier, MusicScannerService>((ref) {
  return MusicScannerNotifier();
});
