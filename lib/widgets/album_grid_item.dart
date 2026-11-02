import 'package:flutter/material.dart';
import 'package:moodify/data/models/album_model.dart';

class AlbumGridItem extends StatelessWidget {
  final AlbumModel album;
  final VoidCallback onTap;

  const AlbumGridItem({super.key, required this.album, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/default_cover.png',
              width: double.infinity,
              height: 140,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: double.infinity,
                height: 140,
                color: Theme.of(context).colorScheme.primaryContainer,
                child: const Icon(Icons.album, size: 40),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            album.name,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            album.artist,
            style: Theme.of(context).textTheme.bodySmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
