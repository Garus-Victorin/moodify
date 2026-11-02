import 'package:flutter_test/flutter_test.dart';
import 'package:moodify/core/utils/app_utils.dart';

void main() {
  group('AppUtils Tests', () {
    test('formatDuration formats correctly', () {
      expect(AppUtils.formatDuration(Duration(seconds: 60)), '01:00');
      expect(AppUtils.formatDuration(Duration(seconds: 125)), '02:05');
      expect(AppUtils.formatDuration(Duration(seconds: 3661)), '61:01');
    });

    test('formatFileSize formats correctly', () {
      expect(AppUtils.formatFileSize(0), '0 B');
      expect(AppUtils.formatFileSize(1024), '1.00 KB');
      expect(AppUtils.formatFileSize(1048576), '1.00 MB');
      expect(AppUtils.formatFileSize(1073741824), '1.00 GB');
    });

    test('formatDate formats correctly', () {
      final date = DateTime(2023, 7, 15);
      expect(AppUtils.formatDate(date), '15/07/2023');
      expect(AppUtils.formatDate(date, format: 'yyyy-MM-dd'), '2023-07-15');
    });

    test('getFileExtension returns correct extension', () {
      expect(AppUtils.getFileExtension('test.mp3'), 'mp3');
      expect(AppUtils.getFileExtension('test.flac'), 'flac');
      expect(AppUtils.getFileExtension('test.wav'), 'wav');
    });

    test('isAudioFile returns correct result', () {
      expect(AppUtils.isAudioFile('test.mp3'), isTrue);
      expect(AppUtils.isAudioFile('test.flac'), isTrue);
      expect(AppUtils.isAudioFile('test.txt'), isFalse);
      expect(AppUtils.isAudioFile('test.jpg'), isFalse);
    });

    test('getInitials returns correct initials', () {
      expect(AppUtils.getInitials('John Doe'), 'JD');
      expect(AppUtils.getInitials('Jane Smith'), 'JS');
      expect(AppUtils.getInitials('Single'), 'S');
      expect(AppUtils.getInitials(''), '?');
    });

    test('capitalize capitalizes correctly', () {
      expect(AppUtils.capitalize('test'), 'Test');
      expect(AppUtils.capitalize('TEST'), 'TEST');
      expect(AppUtils.capitalize(''), '');
    });

    test('truncate truncates correctly', () {
      expect(AppUtils.truncate('Hello World', 5), 'Hello...');
      expect(AppUtils.truncate('Short', 10), 'Short');
      expect(AppUtils.truncate('', 5), '');
    });

    test('isValidEmail validates correctly', () {
      expect(AppUtils.isValidEmail('test@example.com'), isTrue);
      expect(AppUtils.isValidEmail('invalid-email'), isFalse);
      expect(AppUtils.isValidEmail(''), isFalse);
    });
  });
}
