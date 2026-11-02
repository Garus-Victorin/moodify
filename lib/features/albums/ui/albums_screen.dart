import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/data/models/album_model.dart';
import 'package:moodify/widgets/album_grid_item.dart';
import 'package:moodify/data/database/app_database.dart';
import 'package:moodify/core/providers/app_providers.dart';

class AlbumsScreen extends ConsumerWidget {
  const AlbumsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albumsFuture = ref.watch(albumsProvider.future);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed('/search'),
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: FutureBuilder<List<Album>>(
        future: albumsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          }
          final albums = snapshot.data ?? [];
          return _buildGrid(context, albums.map(_albumFromDrift).toList());
        },
      ),
    );
  }

  AlbumModel _albumFromDrift(Album album) {
    return AlbumModel(
      id: album.id,
      name: album.name,
      artist: album.artist,
      artistId: album.artistId,
      coverPath: album.coverPath,
      releaseDate: DateTime.fromMillisecondsSinceEpoch(album.releaseDate),
      songCount: album.songCount,
      totalDuration: album.totalDuration,
    );
  }

  Widget _buildGrid(BuildContext context, List<AlbumModel> albums) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: albums.length,
      itemBuilder: (context, index) {
        final album = albums[index];
        return AlbumGridItem(
          album: album,
          onTap: () => _navigateToAlbumDetail(context, album),
        );
      },
    );
  }

  void _navigateToAlbumDetail(BuildContext context, AlbumModel album) {
    Navigator.of(context).pushNamed('/album/${album.id}');
  }
}

final albumsProvider = FutureProvider<List<Album>>((ref) async {
  final db = ref.watch(databaseProvider);
  return db.getAllAlbums();
});
