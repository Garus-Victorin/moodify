import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/data/models/song_model.dart';
import 'package:moodify/routes/app_router.dart';
import 'package:moodify/widgets/song_list_item.dart';
import 'package:moodify/data/database/app_database.dart';
import 'package:moodify/core/providers/app_providers.dart';
import 'package:drift/drift.dart' as drift;

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesFuture = ref.watch(favoritesProvider.future);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoris'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed('/search'),
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: FutureBuilder<List<Song>>(
        future: favoritesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          }
          final favorites = snapshot.data ?? [];
          return _buildList(context, favorites.map(_songFromDrift).toList());
        },
      ),
    );
  }

  SongModel _songFromDrift(Song song) {
    return SongModel(
      id: song.id,
      title: song.title,
      artist: song.artist,
      album: song.album,
      uri: song.uri,
      duration: song.duration,
      albumId: song.albumId,
      artistId: song.artistId,
      coverPath: song.coverPath,
      year: song.year,
      genre: song.genre,
      size: song.size,
      dateAdded: DateTime.fromMillisecondsSinceEpoch(song.dateAdded),
    );
  }

  Widget _buildList(BuildContext context, List<SongModel> favorites) {
    if (favorites.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border_rounded,
              size: 64,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              'Aucun favoris',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: favorites.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final song = favorites[index];
        return SongListItem(
          song: song,
          onTap: () => AppRouter.navigateToPlayer(context, song.uri),
          onMore: () => _showSongMenu(context, song),
        );
      },
    );
  }

  void _showSongMenu(BuildContext context, SongModel song) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.favorite_rounded),
            title: const Text('Retirer des favoris'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.playlist_add_rounded),
            title: const Text('Ajouter à une playlist'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.share_rounded),
            title: const Text('Partager'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

final favoritesProvider = FutureProvider<List<Song>>((ref) async {
  final db = ref.watch(databaseProvider);
  return db.getFavorites();
});
