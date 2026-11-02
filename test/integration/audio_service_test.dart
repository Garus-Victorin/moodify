import 'package:flutter_test/flutter_test.dart';
import 'package:moodify/core/services/audio_service.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  group('AudioService Tests', () {
    late AudioPlayerNotifier audioService;

    setUp(() {
      audioService = AudioPlayerNotifier();
    });

    tearDown(() {
      audioService.dispose();
    });

    test('Initial state is correct', () {
      final state = audioService.state;
      expect(state.songs, isEmpty);
      expect(state.currentIndex, 0);
      expect(state.playerState, PlayerState.idle);
      expect(state.isLoading, isFalse);
    });

    test('Play and pause functionality', () async {
      // Create a test audio source
      final source = AudioSource.uri(Uri.parse('file://test.mp3'), tag: 'test');

      // Set playlist
      await audioService.setPlaylist([source]);

      // Play
      await audioService.play();
      expect(audioService.state.playerState, PlayerState.playing);

      // Pause
      await audioService.pause();
      expect(audioService.state.playerState, PlayerState.paused);
    });

    test('Toggle play/pause', () async {
      final source = AudioSource.uri(Uri.parse('file://test.mp3'), tag: 'test');

      await audioService.setPlaylist([source]);

      // Initial state should be idle
      expect(audioService.state.playerState, PlayerState.idle);

      // Toggle to play
      await audioService.togglePlayPause();
      expect(audioService.state.playerState, PlayerState.playing);

      // Toggle to pause
      await audioService.togglePlayPause();
      expect(audioService.state.playerState, PlayerState.paused);
    });

    test('Next and previous functionality', () async {
      final source1 = AudioSource.uri(
        Uri.parse('file://test1.mp3'),
        tag: 'test1',
      );
      final source2 = AudioSource.uri(
        Uri.parse('file://test2.mp3'),
        tag: 'test2',
      );

      await audioService.setPlaylist([source1, source2]);

      // Initial index should be 0
      expect(audioService.state.currentIndex, 0);

      // Next should increase index
      await audioService.next();
      expect(audioService.state.currentIndex, 1);

      // Previous should decrease index
      await audioService.previous();
      expect(audioService.state.currentIndex, 0);
    });

    test('Shuffle functionality', () {
      audioService.enableShuffle(true);
      expect(audioService.state.isShuffleEnabled, isTrue);

      audioService.enableShuffle(false);
      expect(audioService.state.isShuffleEnabled, isFalse);
    });

    test('Repeat functionality', () {
      audioService.enableRepeat(LoopMode.all);
      expect(audioService.state.repeatMode, LoopMode.all);

      audioService.enableRepeat(LoopMode.one);
      expect(audioService.state.repeatMode, LoopMode.one);

      audioService.enableRepeat(LoopMode.off);
      expect(audioService.state.repeatMode, LoopMode.off);
    });
  });
}
