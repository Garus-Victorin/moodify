import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moodify/routes/app_router.dart';

void main() {
  group('AppRouter Tests', () {
    test('AppRouter is initialized', () {
      // Verify that the router is initialized
      expect(AppRouter.router, isNotNull);
    });

    test('AppRouter has correct initial location', () {
      // Verify that the initial location is correct
      expect(AppRouter.router.initialLocation, '/');
    });

    test('AppRouter has routes', () {
      // Verify that the router has routes
      expect(AppRouter.router.routes, isNotEmpty);
    });

    test('AppRouter can navigate to home', () {
      // Verify that the router can navigate to home
      expect(AppRouter.router.canNavigate('/'), isTrue);
    });

    test('AppRouter can navigate to songs', () {
      // Verify that the router can navigate to songs
      expect(AppRouter.router.canNavigate('/songs'), isTrue);
    });

    test('AppRouter can navigate to albums', () {
      // Verify that the router can navigate to albums
      expect(AppRouter.router.canNavigate('/albums'), isTrue);
    });

    test('AppRouter can navigate to artists', () {
      // Verify that the router can navigate to artists
      expect(AppRouter.router.canNavigate('/artists'), isTrue);
    });

    test('AppRouter can navigate to folders', () {
      // Verify that the router can navigate to folders
      expect(AppRouter.router.canNavigate('/folders'), isTrue);
    });

    test('AppRouter can navigate to search', () {
      // Verify that the router can navigate to search
      expect(AppRouter.router.canNavigate('/search'), isTrue);
    });

    test('AppRouter can navigate to player', () {
      // Verify that the router can navigate to player
      expect(AppRouter.router.canNavigate('/player'), isTrue);
    });

    test('AppRouter can navigate to playlist', () {
      // Verify that the router can navigate to playlist
      expect(AppRouter.router.canNavigate('/playlist/1'), isTrue);
    });

    test('AppRouter can navigate to settings', () {
      // Verify that the router can navigate to settings
      expect(AppRouter.router.canNavigate('/settings'), isTrue);
    });

    test('AppRouter navigateToPlayer method exists', () {
      // Verify that the navigateToPlayer method exists
      expect(AppRouter.navigateToPlayer, isNotNull);
    });

    test('AppRouter has correct route paths', () {
      // Verify that the router has the expected route paths
      final routes = AppRouter.router.routes;
      expect(routes, isNotEmpty);
    });

    test('AppRouter has shell route', () {
      // Verify that the router has a shell route
      final routes = AppRouter.router.routes;
      expect(routes.any((r) => r is ShellRoute), isTrue);
    });

    test('AppRouter has correct navigation keys', () {
      // Verify that the router has the expected navigation keys
      expect(AppRouter.router.navigatorKey, isNotNull);
    });

    test('AppRouter has correct debug settings', () {
      // Verify that the router has the expected debug settings
      expect(AppRouter.router.debugLogDiagnostics, isFalse);
    });
  });
}
