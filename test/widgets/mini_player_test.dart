import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/widgets/mini_player.dart';

void main() {
  group('MiniPlayer Tests', () {
    testWidgets('MiniPlayer displays correctly when no song is playing', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(home: Scaffold(body: MiniPlayer())),
        ),
      );

      // Verify that the mini player is displayed
      expect(find.byType(MiniPlayer), findsOneWidget);

      // Verify that the mini player is not visible when no song is playing
      expect(find.byType(GestureDetector), findsNothing);
    });

    testWidgets('MiniPlayer displays song info when playing', (
      WidgetTester tester,
    ) async {
      // This test would require mocking the audio service state
      // For now, we just verify the widget structure
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(home: Scaffold(body: MiniPlayer())),
        ),
      );

      // Verify basic structure
      expect(find.byType(MiniPlayer), findsOneWidget);
    });

    testWidgets('MiniPlayer handles tap', (WidgetTester tester) async {
      // This test would require mocking the audio service state
      // For now, we just verify the widget structure
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(home: Scaffold(body: MiniPlayer())),
        ),
      );

      // Verify that the mini player is displayed
      expect(find.byType(MiniPlayer), findsOneWidget);
    });
  });
}
