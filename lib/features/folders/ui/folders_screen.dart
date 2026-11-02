import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/core/services/music_scanner.dart';
import 'package:moodify/data/models/folder_model.dart';
import 'package:moodify/widgets/folder_list_item.dart';

class FoldersScreen extends ConsumerWidget {
  const FoldersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foldersAsync = ref.watch(foldersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dossiers'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed('/search'),
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: foldersAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Erreur: $error')),
        data: (folders) => _buildList(context, folders),
      ),
    );
  }

  Widget _buildList(BuildContext context, List<FolderModel> folders) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: folders.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final folder = folders[index];
        return FolderListItem(
          folder: folder,
          onTap: () => _navigateToFolderDetail(context, folder),
        );
      },
    );
  }

  void _navigateToFolderDetail(BuildContext context, FolderModel folder) {
    Navigator.of(context).pushNamed('/folder/${folder.id}');
  }
}

final foldersProvider = FutureProvider<List<FolderModel>>((ref) async {
  final scanner = ref.watch(musicScannerProvider);
  return scanner.scanFolders();
});
