import 'package:flutter_test/flutter_test.dart';
import 'package:moodify/main.dart';

void main() {
  testWidgets('Moodify App Smoke Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: MoodifyApp()));

    // Verify that the app starts without errors
    expect(find.byType(MoodifyApp), findsOneWidget);

    // Verify that the home screen is displayed
    expect(find.text('Moodify'), findsOneWidget);

    // Verify that the bottom navigation is present
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });

  testWidgets('Navigation Test', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MoodifyApp()));

    // Tap on the songs tab
    await tester.tap(find.text('Titres'));
    await tester.pumpAndSettle();

    // Verify that we navigated to the songs screen
    expect(find.text('Titres'), findsOneWidget);
  });

  testWidgets('Search Functionality Test', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MoodifyApp()));

    // Tap on the search button
    await tester.tap(find.byIcon(Icons.search_rounded));
    await tester.pumpAndSettle();

    // Verify that the search screen is displayed
    expect(
      find.text('Rechercher des titres, albums, artistes...'),
      findsOneWidget,
    );
  });
}
