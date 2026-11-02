import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:moodify/widgets/section_header.dart';

void main() {
  group('SectionHeader Tests', () {
    testWidgets('SectionHeader displays title correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: SectionHeader(title: 'Test Title')),
        ),
      );

      // Verify that the section header is displayed
      expect(find.byType(SectionHeader), findsOneWidget);

      // Verify that the title is displayed
      expect(find.text('Test Title'), findsOneWidget);
    });

    testWidgets('SectionHeader displays action button when provided', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SectionHeader(
              title: 'Test Title',
              actionText: 'View All',
              onAction: () {},
            ),
          ),
        ),
      );

      // Verify that the action button is displayed
      expect(find.text('View All'), findsOneWidget);
      expect(find.byType(TextButton), findsOneWidget);
    });

    testWidgets('SectionHeader handles action tap', (
      WidgetTester tester,
    ) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SectionHeader(
              title: 'Test Title',
              actionText: 'View All',
              onAction: () => tapped = true,
            ),
          ),
        ),
      );

      // Tap on the action button
      await tester.tap(find.text('View All'));

      // Verify that the onAction callback was called
      expect(tapped, isTrue);
    });

    testWidgets(
      'SectionHeader does not display action button when not provided',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: SectionHeader(title: 'Test Title')),
          ),
        );

        // Verify that the action button is not displayed
        expect(find.byType(TextButton), findsNothing);
      },
    );
  });
}
