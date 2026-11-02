import 'package:flutter/material.dart';
import 'package:moodify/core/theme/app_theme.dart';
import 'package:moodify/data/models/song_model.dart';

class SongListItem extends StatelessWidget {
  final SongModel song;
  final VoidCallback onTap;
  final VoidCallback onMore;

  const SongListItem({
    super.key,
    required this.song,
    required this.onTap,
    required this.onMore,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          'assets/images/default_cover.png',
          width: 50,
          height: 50,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.music_note, size: 24),
          ),
        ),
      ),
      title: Text(
        song.title,
        style: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        '${song.artist} • ${AppTheme.formatDuration(Duration(milliseconds: song.duration))}',
        style: Theme.of(context).textTheme.bodySmall,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: IconButton(
        onPressed: onMore,
        icon: const Icon(Icons.more_vert_rounded),
      ),
      onTap: onTap,
    );
  }
}
