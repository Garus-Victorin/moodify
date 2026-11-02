import 'package:flutter_test/flutter_test.dart';
import 'package:moodify/core/errors/app_exceptions.dart';

void main() {
  group('AppExceptions Tests', () {
    test('AppException can be created', () {
      final exception = AppException('Test message');
      expect(exception.message, 'Test message');
      expect(exception.prefix, '');
      expect(exception.toString(), 'Test message');
    });

    test('AppException with prefix', () {
      final exception = AppException('Test message', 'Prefix: ');
      expect(exception.message, 'Test message');
      expect(exception.prefix, 'Prefix: ');
      expect(exception.toString(), 'Prefix: Test message');
    });

    test('DatabaseException can be created', () {
      final exception = DatabaseException('Database error');
      expect(exception.message, 'Database error');
      expect(exception.prefix, 'Database Error: ');
      expect(exception.toString(), 'Database Error: Database error');
    });

    test('AudioException can be created', () {
      final exception = AudioException('Audio error');
      expect(exception.message, 'Audio error');
      expect(exception.prefix, 'Audio Error: ');
      expect(exception.toString(), 'Audio Error: Audio error');
    });

    test('PermissionException can be created', () {
      final exception = PermissionException('Permission error');
      expect(exception.message, 'Permission error');
      expect(exception.prefix, 'Permission Error: ');
      expect(exception.toString(), 'Permission Error: Permission error');
    });

    test('FileException can be created', () {
      final exception = FileException('File error');
      expect(exception.message, 'File error');
      expect(exception.prefix, 'File Error: ');
      expect(exception.toString(), 'File Error: File error');
    });

    test('NetworkException can be created', () {
      final exception = NetworkException('Network error');
      expect(exception.message, 'Network error');
      expect(exception.prefix, 'Network Error: ');
      expect(exception.toString(), 'Network Error: Network error');
    });

    test('ValidationException can be created', () {
      final exception = ValidationException('Validation error');
      expect(exception.message, 'Validation error');
      expect(exception.prefix, 'Validation Error: ');
      expect(exception.toString(), 'Validation Error: Validation error');
    });
  });
}
