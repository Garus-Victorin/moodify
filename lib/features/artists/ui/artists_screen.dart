import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/data/models/artist_model.dart';
import 'package:moodify/widgets/artist_list_item.dart';
import 'package:moodify/data/database/app_database.dart';
import 'package:moodify/core/providers/app_providers.dart';

class ArtistsScreen extends ConsumerWidget {
  const ArtistsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artistsFuture = ref.watch(artistsProvider.future);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Artistes'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed('/search'),
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: FutureBuilder<List<Artist>>(
        future: artistsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          }
          final artists = snapshot.data ?? [];
          return _buildList(context, artists.map(_artistFromDrift).toList());
        },
      ),
    );
  }

  ArtistModel _artistFromDrift(Artist artist) {
    return ArtistModel(
      id: artist.id,
      name: artist.name,
      coverPath: artist.coverPath,
      albumCount: artist.albumCount,
      songCount: artist.songCount,
      totalDuration: artist.totalDuration,
    );
  }

  Widget _buildList(BuildContext context, List<ArtistModel> artists) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: artists.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final artist = artists[index];
        return ArtistListItem(
          artist: artist,
          onTap: () => _navigateToArtistDetail(context, artist),
        );
      },
    );
  }

  void _navigateToArtistDetail(BuildContext context, ArtistModel artist) {
    Navigator.of(context).pushNamed('/artist/${artist.id}');
  }
}

final artistsProvider = FutureProvider<List<Artist>>((ref) async {
  final db = ref.watch(databaseProvider);
  return db.getAllArtists();
});
