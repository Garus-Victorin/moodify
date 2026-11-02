import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:just_audio/just_audio.dart';
import 'package:moodify/core/services/audio_service.dart';
import 'package:moodify/core/theme/app_theme.dart';
import 'package:moodify/features/lyrics/ui/lyrics_view.dart';

class NowPlayingScreen extends ConsumerStatefulWidget {
  final String songUri;

  const NowPlayingScreen({super.key, required this.songUri});

  @override
  ConsumerState<NowPlayingScreen> createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends ConsumerState<NowPlayingScreen> {
  bool showLyrics = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initPlayer();
    });
  }

  Future<void> _initPlayer() async {
    final player = ref.read(audioServiceProvider.notifier);
    final currentState = ref.read(audioServiceProvider);

    if (currentState.songs.isEmpty ||
        (currentState.currentSongTag?['uri']?.toString() ?? '') !=
            widget.songUri) {
      final source = createSongSource(
        widget.songUri,
        'Song Title',
        'Artist Name',
      );
      await player.setPlaylist([source]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final playerState = ref.watch(audioServiceProvider);
    final theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        actions: [
          IconButton(
            onPressed: () => setState(() => showLyrics = !showLyrics),
            icon: Icon(
              showLyrics ? Icons.music_note_rounded : Icons.text_fields_rounded,
            ),
          ),
          IconButton(
            onPressed: () => _showMoreMenu(context),
            icon: const Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  theme.colorScheme.primaryContainer,
                  theme.colorScheme.surface,
                ],
              ),
            ),
          ),

          // Main content
          Column(
            children: [
              const SizedBox(height: kToolbarHeight + 20),
              Expanded(
                child: showLyrics
                    ? _buildLyricsView()
                    : _buildPlayerView(playerState),
              ),
              _buildControls(playerState),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerView(AudioPlayerState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Cover art with rotation animation
        Hero(
          tag: 'cover_art_${state.currentSongTag?['uri'] ?? ''}',
          child: Container(
            width: 280,
            height: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/default_cover.png',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: const Icon(Icons.music_note, size: 100),
                ),
              ),
            ),
          )
              .animate(onComplete: (controller) => controller.repeat())
              .rotate(
                duration: 15.seconds,
                curve: Curves.linear,
                begin: 0,
                end: 2 * 3.14159,
              ),
        ),
        const SizedBox(height: 32),

        // Song info
        Text(
          'Song Title', // state.currentSong.title ?? 'Unknown',
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Artist Name', // state.currentSong.artist ?? 'Unknown Artist',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),

        // Progress bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 2,
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 6,
                  ),
                  overlayShape: const RoundSliderOverlayShape(
                    overlayRadius: 12,
                  ),
                ),
                child: Slider(
                  value: state.currentPosition.inMilliseconds.toDouble(),
                  min: 0,
                  max: state.duration.inMilliseconds.toDouble(),
                  onChanged: (value) => ref
                      .read(audioServiceProvider.notifier)
                      .seekTo(Duration(milliseconds: value.toInt())),
                  activeColor: Theme.of(context).colorScheme.primary,
                  inactiveColor: Theme.of(context).colorScheme.outlineVariant,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppTheme.formatDuration(state.currentPosition),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    AppTheme.formatDuration(state.duration),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLyricsView() {
    return const LyricsView();
  }

  Widget _buildControls(AudioPlayerState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => ref
                .read(audioServiceProvider.notifier)
                .enableShuffle(!state.isShuffleEnabled),
            icon: Icon(
              state.isShuffleEnabled
                  ? Icons.shuffle_on_rounded
                  : Icons.shuffle_rounded,
              size: 28,
            ),
            color: state.isShuffleEnabled
                ? Theme.of(context).colorScheme.primary
                : null,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () =>
                    ref.read(audioServiceProvider.notifier).previous(),
                icon: const Icon(Icons.skip_previous_rounded, size: 36),
              ),
              const SizedBox(width: 16),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primary,
                ),
                padding: const EdgeInsets.all(16),
                child: IconButton(
                  onPressed: () =>
                      ref.read(audioServiceProvider.notifier).togglePlayPause(),
                  icon: Icon(
                    state.isPlaying
                        ? Icons.pause_rounded
                        : Icons.play_arrow_rounded,
                    size: 32,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              IconButton(
                onPressed: () => ref.read(audioServiceProvider.notifier).next(),
                icon: const Icon(Icons.skip_next_rounded, size: 36),
              ),
            ],
          ),
          IconButton(
            onPressed: () => _showRepeatMenu(context),
            icon: Icon(
              state.repeatMode == LoopMode.one
                  ? Icons.repeat_one_rounded
                  : state.repeatMode == LoopMode.all
                      ? Icons.repeat_rounded
                      : Icons.repeat_rounded,
              size: 28,
            ),
            color: state.repeatMode != LoopMode.off
                ? Theme.of(context).colorScheme.primary
                : null,
          ),
        ],
      ),
    );
  }

  void _showMoreMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.favorite_border_rounded),
            title: const Text('Ajouter aux favoris'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.playlist_add_rounded),
            title: const Text('Ajouter à une playlist'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.share_rounded),
            title: const Text('Partager'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.equalizer_rounded),
            title: const Text('Égaliseur'),
            onTap: () => Navigator.of(context).pushNamed('/equalizer'),
          ),
          ListTile(
            leading: const Icon(Icons.timer_rounded),
            title: const Text('Sleep Timer'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  void _showRepeatMenu(BuildContext context) {
    final player = ref.read(audioServiceProvider.notifier);
    final currentMode = player.state.repeatMode;

    showModalBottomSheet(
      context: context,
      builder: (context) => Wrap(
        children: [
          ListTile(
            leading: Icon(
              Icons.repeat_rounded,
              color: currentMode == LoopMode.off
                  ? Theme.of(context).colorScheme.primary
                  : null,
            ),
            title: const Text('Désactivé'),
            onTap: () {
              player.enableRepeat(LoopMode.off);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(
              Icons.repeat_rounded,
              color: currentMode == LoopMode.all
                  ? Theme.of(context).colorScheme.primary
                  : null,
            ),
            title: const Text('Répéter la liste'),
            onTap: () {
              player.enableRepeat(LoopMode.all);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(
              Icons.repeat_one_rounded,
              color: currentMode == LoopMode.one
                  ? Theme.of(context).colorScheme.primary
                  : null,
            ),
            title: const Text('Répéter un morceau'),
            onTap: () {
              player.enableRepeat(LoopMode.one);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
