import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:moodify/data/models/folder_model.dart';
import 'package:moodify/widgets/folder_list_item.dart';

void main() {
  group('FolderListItem Tests', () {
    testWidgets('FolderListItem displays correctly', (
      WidgetTester tester,
    ) async {
      final folder = FolderModel(
        id: 1,
        name: 'Test Folder',
        path: '/test/path',
        songCount: 10,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FolderListItem(folder: folder, onTap: () {}),
          ),
        ),
      );

      // Verify that the folder list item is displayed
      expect(find.byType(FolderListItem), findsOneWidget);

      // Verify that the folder name is displayed
      expect(find.text('Test Folder'), findsOneWidget);

      // Verify that the song count is displayed
      expect(find.text('10 titres'), findsOneWidget);

      // Verify that the folder icon is displayed
      expect(find.byIcon(Icons.folder_rounded), findsOneWidget);
    });

    testWidgets('FolderListItem handles tap', (WidgetTester tester) async {
      bool tapped = false;
      final folder = FolderModel(
        id: 1,
        name: 'Test Folder',
        path: '/test/path',
        songCount: 10,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FolderListItem(folder: folder, onTap: () => tapped = true),
          ),
        ),
      );

      // Tap on the folder list item
      await tester.tap(find.byType(FolderListItem));

      // Verify that the onTap callback was called
      expect(tapped, isTrue);
    });
  });
}
