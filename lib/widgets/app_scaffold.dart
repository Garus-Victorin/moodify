import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/core/services/audio_service.dart';
import 'package:moodify/widgets/mini_player.dart';
import 'package:go_router/go_router.dart';

/// Scaffold principal de l'application avec navigation et mini player
class AppScaffold extends ConsumerWidget {
  final Widget child;

  const AppScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: child),
          const MiniPlayer(),
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

/// Navigation du bas de l'écran
class BottomNavigation extends ConsumerWidget {
  const BottomNavigation({super.key});

  int _getCurrentIndex(String location) {
    final uri = Uri.parse(location);
    final path = uri.path;

    switch (path) {
      case '/songs':
        return 1;
      case '/albums':
        return 2;
      case '/artists':
        return 3;
      case '/folders':
        return 4;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = GoRouterState.of(context);
    final currentIndex = _getCurrentIndex(router.uri.toString());

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          final paths = ['/', '/songs', '/albums', '/artists', '/folders'];
          context.go(paths[index]);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.queue_music_outlined),
            activeIcon: Icon(Icons.queue_music_rounded),
            label: 'Titres',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.album_outlined),
            activeIcon: Icon(Icons.album_rounded),
            label: 'Albums',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person_rounded),
            label: 'Artistes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder_outlined),
            activeIcon: Icon(Icons.folder_rounded),
            label: 'Dossiers',
          ),
        ],
      ),
    );
  }
}

/// Navigation du bas de l'écran
class BottomNav extends StatelessWidget {
  final int currentIndex;

  const BottomNav({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          final paths = ['/ ', '/songs', '/albums', '/artists', '/folders'];
          Navigator.of(context).pushReplacementNamed(paths[index]);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.queue_music_outlined),
            activeIcon: Icon(Icons.queue_music_rounded),
            label: 'Titres',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.album_outlined),
            activeIcon: Icon(Icons.album_rounded),
            label: 'Albums',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person_rounded),
            label: 'Artistes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder_outlined),
            activeIcon: Icon(Icons.folder_rounded),
            label: 'Dossiers',
          ),
        ],
      ),
    );
  }
}
