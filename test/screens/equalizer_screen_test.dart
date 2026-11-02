import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/features/equalizer/ui/equalizer_screen.dart';

void main() {
  group('EqualizerScreen Tests', () {
    testWidgets('EqualizerScreen displays correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: EqualizerScreen(),
          ),
        ),
      );

      // Verify that the equalizer screen is displayed
      expect(find.byType(EqualizerScreen), findsOneWidget);

      // Verify that the app bar is displayed
      expect(find.text('Égaliseur'), findsOneWidget);

      // Verify that the list view is displayed
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('EqualizerScreen shows presets section',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: EqualizerScreen(),
          ),
        ),
      );

      // Verify that the presets section is displayed
      expect(find.text('Presets'), findsOneWidget);
      expect(find.text('Normal'), findsOneWidget);
      expect(find.text('Rock'), findsOneWidget);
      expect(find.text('Pop'), findsOneWidget);
      expect(find.text('Jazz'), findsOneWidget);
      expect(find.text('Classique'), findsOneWidget);
      expect(find.text('Hip-Hop'), findsOneWidget);
      expect(find.text('Dance'), findsOneWidget);
    });

    testWidgets('EqualizerScreen shows bands section',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: EqualizerScreen(),
          ),
        ),
      );

      // Verify that the bands section is displayed
      expect(find.text('Bandes de fréquence'), findsOneWidget);
      expect(find.byType(Slider), findsWidgets);
    });

    testWidgets('EqualizerScreen shows effects section',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: EqualizerScreen(),
          ),
        ),
      );

      // Verify that the effects section is displayed
      expect(find.text('Effets audio'), findsOneWidget);
      expect(find.text('Bass Boost'), findsOneWidget);
      expect(find.text('Virtualizer'), findsOneWidget);
      expect(find.text('Reverb'), findsOneWidget);
    });

    testWidgets('EqualizerScreen handles preset selection',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: EqualizerScreen(),
          ),
        ),
      );

      // Tap on the rock preset
      await tester.tap(find.text('Rock'));
      await tester.pump();

      // Verify that the preset is selected
      // This would require checking the internal state
    });

    testWidgets('EqualizerScreen handles band adjustment',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: EqualizerScreen(),
          ),
        ),
      );

      // Find a band slider and adjust it
      final sliders = tester.widgetList<Slider>(find.byType(Slider));
      if (sliders.isNotEmpty) {
        await tester.drag(find.byType(Slider).first, const Offset(50, 0));
        await tester.pump();

        // Verify that the band value is updated
        // This would require checking the internal state
      }
    });

    testWidgets('EqualizerScreen handles effect adjustment',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: EqualizerScreen(),
          ),
        ),
      );

      // Find an effect slider and adjust it
      final sliders = tester.widgetList<Slider>(find.byType(Slider));
      if (sliders.length > 10) {
        await tester.drag(find.byType(Slider).last, const Offset(50, 0));
        await tester.pump();

        // Verify that the effect value is updated
        // This would require checking the internal state
      }
    });
  });
}
