import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moodify/features/home/ui/home_screen.dart';
import 'package:moodify/features/songs/ui/songs_screen.dart';
import 'package:moodify/features/albums/ui/albums_screen.dart';
import 'package:moodify/features/artists/ui/artists_screen.dart';
import 'package:moodify/features/folders/ui/folders_screen.dart';
import 'package:moodify/features/player/ui/now_playing_screen.dart';
import 'package:moodify/features/search/ui/search_screen.dart';
import 'package:moodify/features/playlist/ui/playlist_screen.dart';
import 'package:moodify/features/settings/ui/settings_screen.dart';
import 'package:moodify/features/favorites/ui/favorites_screen.dart';
import 'package:moodify/features/equalizer/ui/equalizer_screen.dart';
import 'package:moodify/widgets/app_scaffold.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static const _homePath = '/';
  static const _songsPath = '/songs';
  static const _albumsPath = '/albums';
  static const _artistsPath = '/artists';
  static const _foldersPath = '/folders';
  static const _searchPath = '/search';
  static const _playerPath = '/player';
  static const _playlistPath = '/playlist';
  static const _settingsPath = '/settings';

  static GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: _homePath,
    debugLogDiagnostics: false,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => AppScaffold(child: child),
        routes: [
          GoRoute(
            path: _homePath,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: HomeScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            path: _songsPath,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: SongsScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            path: _albumsPath,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: AlbumsScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            path: _artistsPath,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: ArtistsScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            path: _foldersPath,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: FoldersScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
            ),
          ),
        ],
      ),
      GoRoute(
        path: _searchPath,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: SearchScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position:
                Tween<Offset>(begin: Offset(0, -1), end: Offset.zero).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              ),
            ),
            child: child,
          ),
        ),
      ),
      GoRoute(
        path: _playerPath,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: NowPlayingScreen(
            songUri: state.uri.queryParameters['uri'] ?? '',
          ),
        ),
      ),
      GoRoute(
        path: '$_playlistPath/:id',
        pageBuilder: (context, state) {
          final playlistId = state.pathParameters['id'];
          return CustomTransitionPage(
            key: state.pageKey,
            child: PlaylistScreen(
              playlistId: int.tryParse(playlistId ?? '0') ?? 0,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0, 1),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOutCubic,
                ),
              ),
              child: child,
            ),
          );
        },
      ),
      GoRoute(
        path: _settingsPath,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: SettingsScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position:
                Tween<Offset>(begin: Offset(0, 1), end: Offset.zero).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              ),
            ),
            child: child,
          ),
        ),
      ),
      GoRoute(
        path: '/favorites',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: FavoritesScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position:
                Tween<Offset>(begin: Offset(0, 1), end: Offset.zero).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              ),
            ),
            child: child,
          ),
        ),
      ),
      GoRoute(
        path: '/equalizer',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: EqualizerScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position:
                Tween<Offset>(begin: Offset(0, 1), end: Offset.zero).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              ),
            ),
            child: child,
          ),
        ),
      ),
    ],
  );

  // Navigate to now playing screen
  static void navigateToPlayer(BuildContext context, String songUri) {
    GoRouter.of(context).push('$_playerPath?uri=$songUri');
  }

  static void navigateToSettings(BuildContext context) {
    GoRouter.of(context).push('/settings');
  }

  // Navigate to favorites screen
  static void navigateToFavorites(BuildContext context) {
    GoRouter.of(context).push('/favorites');
  }

  // Navigate to equalizer screen
  static void navigateToEqualizer(BuildContext context) {
    GoRouter.of(context).push('/equalizer');
  }
}
