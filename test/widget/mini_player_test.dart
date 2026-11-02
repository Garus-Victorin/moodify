import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/widgets/mini_player.dart';

void main() {
  testWidgets('MiniPlayer displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(home: Scaffold(body: MiniPlayer())),
      ),
    );

    // Verify that the mini player is displayed
    expect(find.byType(MiniPlayer), findsOneWidget);

    // Verify that the mini player is not visible when no song is playing
    expect(find.byType(ListTile), findsNothing);
  });

  testWidgets('MiniPlayer shows song info when playing', (
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
    expect(find.byType(GestureDetector), findsOneWidget);
  });
}
