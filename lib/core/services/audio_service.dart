import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:just_audio/just_audio.dart' as ja;

enum PlayerState { idle, playing, paused }

class AudioPlayerNotifier extends StateNotifier<AudioPlayerState> {
  final AudioPlayer _player = AudioPlayer();

  AudioPlayerNotifier() : super(AudioPlayerState.initial) {
    _init();
  }

  void _init() {
    // Listen to playback state
    _player.playbackEventStream.listen(
      (event) {},
      onError: (Object e, StackTrace st) {
        print('Audio playback error: $e');
        state = state.copyWith(playerState: PlayerState.idle, isLoading: false);
      },
    );

    // Listen to position changes
    _player.positionStream.listen((position) {
      state = state.copyWith(currentPosition: position);
    });

    // Listen to duration changes
    _player.durationStream.listen((duration) {
      if (duration != null) {
        state = state.copyWith(duration: duration);
      }
    });

    // Listen to completion
    _player.processingStateStream.listen((processingState) {
      if (processingState == ProcessingState.completed) {
        _onSongCompleted();
      }
    });
  }

  Future<void> setPlaylist(
    List<ja.AudioSource> sources, {
    int initialIndex = 0,
  }) async {
    final sequence = sources.toList();
    if (sequence.isEmpty) return;

    state = state.copyWith(
      isLoading: true,
      songs: sequence,
      currentIndex: initialIndex,
    );

    try {
      await _player.setAudioSource(
        ja.ConcatenatingAudioSource(
          children: sequence,
        ),
        initialIndex: initialIndex,
      );
      state = state.copyWith(
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> play() async {
    await _player.play();
    state = state.copyWith(playerState: PlayerState.playing);
  }

  Future<void> pause() async {
    await _player.pause();
    state = state.copyWith(playerState: PlayerState.paused);
  }

  Future<void> togglePlayPause() async {
    if (state.playerState == PlayerState.playing) {
      await pause();
    } else {
      await play();
    }
  }

  Future<void> seekTo(Duration position) async {
    await _player.seek(position);
  }

  Future<void> next() async {
    if (state.currentIndex < state.songs.length - 1) {
      await _player.seekToNext();
      state = state.copyWith(currentIndex: state.currentIndex + 1);
    }
  }

  Future<void> previous() async {
    if (_player.position.inSeconds > 3) {
      await _player.seek(Duration.zero);
    } else if (state.currentIndex > 0) {
      await _player.seekToNext();
      state = state.copyWith(currentIndex: state.currentIndex - 1);
    }
  }

  void enableShuffle(bool enabled) {
    _player.setShuffleModeEnabled(enabled);
    state = state.copyWith(isShuffleEnabled: enabled);
  }

  void enableRepeat(ja.LoopMode mode) {
    _player.setLoopMode(mode);
    state = state.copyWith(repeatMode: mode);
  }

  Future<void> setVolume(double volume) async {
    await _player.setVolume(volume.clamp(0.0, 1.0));
    state = state.copyWith(volume: volume);
  }

  Future<void> setSpeed(double speed) async {
    await _player.setSpeed(speed);
    state = state.copyWith(speed: speed);
  }

  void _onSongCompleted() {
    if (state.repeatMode == LoopMode.all &&
        state.currentIndex < state.songs.length - 1) {
      next();
    } else if (state.currentIndex >= state.songs.length - 1) {
      state = state.copyWith(playerState: PlayerState.idle);
    } else {
      next();
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}

class AudioPlayerState {
  final List<ja.AudioSource> songs;
  final int currentIndex;
  final Duration currentPosition;
  final Duration duration;
  final PlayerState playerState;
  final bool isLoading;
  final bool isShuffleEnabled;
  final ja.LoopMode repeatMode;
  final double volume;
  final double speed;
  final String? error;

  const AudioPlayerState({
    this.songs = const [],
    this.currentIndex = 0,
    this.currentPosition = Duration.zero,
    this.duration = Duration.zero,
    this.playerState = PlayerState.idle,
    this.isLoading = false,
    this.isShuffleEnabled = false,
    this.repeatMode = ja.LoopMode.off,
    this.volume = 1.0,
    this.speed = 1.0,
    this.error,
  });

  ja.AudioSource get currentSong => songs.isNotEmpty
      ? songs[currentIndex]
      : ja.AudioSource.uri(Uri.parse(''));

  Map<String, dynamic>? get currentSongTag {
    if (songs.isEmpty) return null;
    final src = songs[currentIndex];
    if (src is ja.UriAudioSource) {
      final t = src.tag;
      if (t is Map<String, dynamic>) return t;
    }
    return null;
  }

  bool get isPlaying => playerState == PlayerState.playing;
  bool get hasSong => songs.isNotEmpty;

  static const AudioPlayerState initial = AudioPlayerState();

  AudioPlayerState copyWith({
    List<ja.AudioSource>? songs,
    int? currentIndex,
    Duration? currentPosition,
    Duration? duration,
    PlayerState? playerState,
    bool? isLoading,
    bool? isShuffleEnabled,
    ja.LoopMode? repeatMode,
    double? volume,
    double? speed,
    String? error,
  }) {
    return AudioPlayerState(
      songs: songs ?? this.songs,
      currentIndex: currentIndex ?? this.currentIndex,
      currentPosition: currentPosition ?? this.currentPosition,
      duration: duration ?? this.duration,
      playerState: playerState ?? this.playerState,
      isLoading: isLoading ?? this.isLoading,
      isShuffleEnabled: isShuffleEnabled ?? this.isShuffleEnabled,
      repeatMode: repeatMode ?? this.repeatMode,
      volume: volume ?? this.volume,
      speed: speed ?? this.speed,
      error: error ?? this.error,
    );
  }
}

final audioServiceProvider =
    StateNotifierProvider<AudioPlayerNotifier, AudioPlayerState>((ref) {
  final notifier = AudioPlayerNotifier();
  ref.onDispose(() => notifier.dispose());
  return notifier;
});

// Helper to create AudioSource from song URI
ja.AudioSource createSongSource(
  String uri,
  String title,
  String artist, {
  String? albumArt,
}) {
  return ja.AudioSource.uri(
    Uri.parse(uri),
    tag: <String, dynamic>{'uri': uri, 'title': title, 'artist': artist},
  );
}
