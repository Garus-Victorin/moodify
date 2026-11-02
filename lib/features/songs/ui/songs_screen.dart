import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/data/models/song_model.dart';
import 'package:moodify/routes/app_router.dart';
import 'package:moodify/widgets/song_list_item.dart';
import 'package:moodify/core/providers/app_providers.dart';

class SongsScreen extends ConsumerWidget {
  const SongsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songsFuture = ref.watch(allSongsProvider(false).future);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Titres'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed('/search'),
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: FutureBuilder<List<SongModel>>(
        future: songsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          }
          final songs = snapshot.data ?? [];
          return _buildList(context, songs);
        },
      ),
    );
  }

  Widget _buildList(BuildContext context, List<SongModel> songs) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: songs.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final song = songs[index];
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
            leading: const Icon(Icons.playlist_add_rounded),
            title: const Text('Ajouter à une playlist'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.favorite_border_rounded),
            title: const Text('Ajouter aux favoris'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.share_rounded),
            title: const Text('Partager'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info_outline_rounded),
            title: const Text('Détails'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
