import 'package:flutter/material.dart';
import 'package:moodify/data/models/folder_model.dart';

class FolderListItem extends StatelessWidget {
  final FolderModel folder;
  final VoidCallback onTap;

  const FolderListItem({super.key, required this.folder, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.folder_rounded, size: 36),
      title: Text(
        folder.name,
        style: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        '${folder.songCount} titres',
        style: Theme.of(context).textTheme.bodySmall,
      ),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: onTap,
    );
  }
}
