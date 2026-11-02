import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/core/services/audio_service.dart';
import 'package:moodify/core/services/music_scanner.dart';
import 'package:moodify/data/database/app_database.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:moodify/core/errors/app_exceptions.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class AppService {
  final Ref ref;

  AppService(this.ref);

  // Initialize all services
  Future<void> initialize() async {
    await _initializeDatabase();
    await _initializeAudio();
    await _initializeScanner();
  }

  Future<void> _initializeDatabase() async {
    try {
      final db = AppDatabase(_openConnection());
      ref.read(databaseProvider.notifier).state = db;
    } catch (e) {
      throw DatabaseException('Failed to initialize database: $e');
    }
  }

  Future<void> _initializeAudio() async {
    try {
      ref.read(audioServiceProvider.notifier);
    } catch (e) {
      throw AudioException('Failed to initialize audio service: $e');
    }
  }

  Future<void> _initializeScanner() async {
    try {
      final scanner = MusicScannerService();
      ref.read(musicScannerProvider.notifier).state = scanner;
    } catch (e) {
      throw PermissionException('Failed to initialize scanner: $e');
    }
  }

  // Get database
  AppDatabase get database => ref.read(databaseProvider);

  // Get audio service
  AudioPlayerNotifier get audioService => ref.read(audioServiceProvider.notifier);

  // Get music scanner
  MusicScannerService get musicScanner => ref.read(musicScannerProvider);
}

final appServiceProvider = Provider<AppService>((ref) {
  return AppService(ref);
});

final databaseProvider =
    StateNotifierProvider<AppDatabaseNotifier, AppDatabase>((ref) {
  return AppDatabaseNotifier();
});

class AppDatabaseNotifier extends StateNotifier<AppDatabase> {
  AppDatabaseNotifier() : super(AppDatabase(_openConnection()));
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'moodify.db'));
    return NativeDatabase(file);
  });
}
