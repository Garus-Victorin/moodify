import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/data/models/playlist_model.dart';
import 'package:moodify/widgets/song_list_item.dart';
import 'package:moodify/data/models/song_model.dart';
import 'package:moodify/data/database/app_database.dart';
import 'package:moodify/core/providers/app_providers.dart';

class PlaylistScreen extends ConsumerWidget {
  final int playlistId;

  const PlaylistScreen({super.key, required this.playlistId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playlistAsync = ref.watch(playlistProvider(playlistId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Playlist'),
        actions: [
          IconButton(
            onPressed: () => _showPlaylistMenu(context),
            icon: const Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      body: playlistAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Erreur: $error')),
        data: (playlist) => _buildPlaylistContent(context, ref, playlist),
      ),
    );
  }


  Widget _buildPlaylistContent(BuildContext context, WidgetRef ref, PlaylistModel playlist) {
    return FutureBuilder<List<Song>>(
      future: ref.read(databaseProvider).getSongsInPlaylist(playlist.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Erreur: ${snapshot.error}'));
        }
        final songs = snapshot.data ?? [];

        return Column(
          children: [
            _buildPlaylistHeader(context, playlist),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: songs.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  return SongListItem(
                    song: _songFromDrift(songs[index]),
                    onTap: () {},
                    onMore: () => _showSongMenu(context),
                  );
                },
              ),
            ),
          ],
        );
      },
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

  Widget _buildPlaylistHeader(BuildContext context, PlaylistModel playlist) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).colorScheme.surface,
          ],
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/default_cover.png',
              width: 120,
              height: 120,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 120,
                height: 120,
                color: Theme.of(context).colorScheme.primaryContainer,
                child: const Icon(Icons.playlist_play, size: 60),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            playlist.name,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            '${playlist.songIds.length} titres',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  void _showPlaylistMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.edit_rounded),
            title: const Text('Renommer'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.delete_outline_rounded),
            title: const Text('Supprimer'),
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

  void _showSongMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.playlist_remove_rounded),
            title: const Text('Retirer de la playlist'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.favorite_border_rounded),
            title: const Text('Ajouter aux favoris'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

final playlistProvider = FutureProvider.family<PlaylistModel, int>((
  ref,
  playlistId,
) async {
  // TODO: Implement actual playlist fetching from database
  return PlaylistModel(
    id: playlistId,
    name: 'Ma Playlist',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    songIds: List.generate(10, (index) => index),
  );
});
