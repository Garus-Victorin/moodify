import 'package:flutter/material.dart';
import 'package:moodify/features/favorites/ui/favorites_screen.dart';
import 'package:moodify/features/equalizer/ui/equalizer_screen.dart';

class AppRoutes {
  static const favorites = '/favorites';
  static const equalizer = '/equalizer';

  static Map<String, WidgetBuilder> get routes => {
    favorites: (context) => const FavoritesScreen(),
    equalizer: (context) => const EqualizerScreen(),
  };
}
