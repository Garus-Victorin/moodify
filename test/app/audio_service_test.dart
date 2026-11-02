import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/core/services/audio_service.dart';

void main() {
  group('AudioService Tests', () {
    test('AudioService provider exists', () {
      final container = ProviderContainer();

      expect(container.read(audioServiceProvider), isNotNull);
    });

    test('AudioService can be created', () {
      final audioService = AudioPlayerNotifier();

      expect(audioService, isNotNull);
    });

    test('AudioService has expected methods', () {
      final audioService = AudioPlayerNotifier();

      expect(audioService.setPlaylist, isNotNull);
      expect(audioService.play, isNotNull);
      expect(audioService.pause, isNotNull);
      expect(audioService.togglePlayPause, isNotNull);
      expect(audioService.seekTo, isNotNull);
      expect(audioService.next, isNotNull);
      expect(audioService.previous, isNotNull);
      expect(audioService.enableShuffle, isNotNull);
      expect(audioService.enableRepeat, isNotNull);
      expect(audioService.setVolume, isNotNull);
      expect(audioService.setSpeed, isNotNull);
      expect(audioService.dispose, isNotNull);
    });

    test('AudioService initial state is correct', () {
      final audioService = AudioPlayerNotifier();

      final state = audioService.state;
      expect(state.songs, isEmpty);
      expect(state.currentIndex, 0);
      expect(state.currentPosition, Duration.zero);
      expect(state.duration, Duration.zero);
      expect(state.playerState, PlayerState.idle);
      expect(state.isLoading, isFalse);
      expect(state.isShuffleEnabled, isFalse);
      expect(state.repeatMode, LoopMode.off);
      expect(state.volume, 1.0);
      expect(state.speed, 1.0);
      expect(state.error, isNull);
    });

    test('AudioService state has expected properties', () {
      final audioService = AudioPlayerNotifier();

      final state = audioService.state;
      expect(state.hasSong, isFalse);
      expect(state.isPlaying, isFalse);
      expect(state.currentSong, isA<AudioSource>());
    });

    test('AudioService state copyWith works correctly', () {
      final audioService = AudioPlayerNotifier();

      final state = audioService.state;
      final newState = state.copyWith(playerState: PlayerState.playing);

      expect(newState.playerState, PlayerState.playing);
      expect(newState.songs, state.songs);
      expect(newState.currentIndex, state.currentIndex);
    });

    test('AudioService provider is accessible', () {
      final container = ProviderContainer();
      final audioService = container.read(audioServiceProvider);

      expect(audioService, isNotNull);
      expect(audioService, isA<AudioPlayerNotifier>());
    });

    test('AudioService can be accessed from provider', () {
      final container = ProviderContainer();
      final audioService = container.read(audioServiceProvider);

      expect(audioService.setPlaylist, isNotNull);
      expect(audioService.play, isNotNull);
      expect(audioService.pause, isNotNull);
      expect(audioService.togglePlayPause, isNotNull);
      expect(audioService.seekTo, isNotNull);
      expect(audioService.next, isNotNull);
      expect(audioService.previous, isNotNull);
      expect(audioService.enableShuffle, isNotNull);
      expect(audioService.enableRepeat, isNotNull);
      expect(audioService.setVolume, isNotNull);
      expect(audioService.setSpeed, isNotNull);
      expect(audioService.dispose, isNotNull);
    });

    test('createSongSource creates correct audio source', () {
      final source = createSongSource(
        'file://test.mp3',
        'Test Song',
        'Test Artist',
        albumArt: 'file://test.jpg',
      );

      expect(source, isNotNull);
      expect(source, isA<AudioSource>());
    });

    test('createSongSource sets correct properties', () {
      final source = createSongSource(
        'file://test.mp3',
        'Test Song',
        'Test Artist',
        albumArt: 'file://test.jpg',
      );

      expect(source.tag, 'file://test.mp3');
    });
  });
}
