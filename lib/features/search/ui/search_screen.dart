import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/data/models/song_model.dart';
import 'package:moodify/routes/app_router.dart';
import 'package:moodify/widgets/song_list_item.dart';
import 'package:moodify/core/providers/app_providers.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Rechercher des titres, albums, artistes...',
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.search_rounded),
            suffixIcon: IconButton(
              onPressed: () => _searchController.clear(),
              icon: const Icon(Icons.clear_rounded),
            ),
          ),
          onChanged: (query) => setState(() => _searchQuery = query),
        ),
      ),
      body: _searchQuery.isEmpty ? _buildEmptyState() : _buildResults(),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_rounded,
            size: 64,
            color: Theme.of(context).colorScheme.outline,
          ),
          const SizedBox(height: 16),
          Text(
            'Rechercher dans votre bibliothèque',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildResults() {
    final songsAsync = ref.watch(searchSongsProvider(_searchQuery));
    return FutureBuilder<List<SongModel>>(
      future: songsAsync.when(
        data: (songs) => Future.value(songs),
        loading: () => Future.value([]),
        error: (error, stack) => Future.value([]),
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Erreur: ${snapshot.error}'));
        }
        final songs = snapshot.data ?? [];
        if (songs.isEmpty) {
          return Center(
            child: Text(
              'Aucun résultat trouvé',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
        }

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
        ],
      ),
    );
  }
}
