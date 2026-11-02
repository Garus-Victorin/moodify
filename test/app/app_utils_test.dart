import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:moodify/core/utils/app_utils.dart';

void main() {
  group('AppUtils Tests', () {
    test('formatDuration formats correctly', () {
      expect(AppUtils.formatDuration(Duration(seconds: 60)), '01:00');
      expect(AppUtils.formatDuration(Duration(seconds: 125)), '02:05');
      expect(AppUtils.formatDuration(Duration(seconds: 3661)), '61:01');
      expect(AppUtils.formatDuration(Duration.zero), '00:00');
    });

    test('formatFileSize formats correctly', () {
      expect(AppUtils.formatFileSize(0), '0 B');
      expect(AppUtils.formatFileSize(1024), '1.00 KB');
      expect(AppUtils.formatFileSize(1048576), '1.00 MB');
      expect(AppUtils.formatFileSize(1073741824), '1.00 GB');
      expect(AppUtils.formatFileSize(1099511627776), '1.00 TB');
    });

    test('formatDate formats correctly', () {
      final date = DateTime(2023, 7, 15);
      expect(AppUtils.formatDate(date), '15/07/2023');
      expect(AppUtils.formatDate(date, format: 'yyyy-MM-dd'), '2023-07-15');
      expect(AppUtils.formatDate(date, format: 'MM/dd/yyyy'), '07/15/2023');
    });

    test('getFileExtension returns correct extension', () {
      expect(AppUtils.getFileExtension('test.mp3'), 'mp3');
      expect(AppUtils.getFileExtension('test.flac'), 'flac');
      expect(AppUtils.getFileExtension('test.wav'), 'wav');
      expect(AppUtils.getFileExtension('test.aac'), 'aac');
      expect(AppUtils.getFileExtension('test.m4a'), 'm4a');
      expect(AppUtils.getFileExtension('test.ogg'), 'ogg');
    });

    test('isAudioFile returns correct result', () {
      expect(AppUtils.isAudioFile('test.mp3'), isTrue);
      expect(AppUtils.isAudioFile('test.flac'), isTrue);
      expect(AppUtils.isAudioFile('test.wav'), isTrue);
      expect(AppUtils.isAudioFile('test.aac'), isTrue);
      expect(AppUtils.isAudioFile('test.m4a'), isTrue);
      expect(AppUtils.isAudioFile('test.ogg'), isTrue);
      expect(AppUtils.isAudioFile('test.txt'), isFalse);
      expect(AppUtils.isAudioFile('test.jpg'), isFalse);
      expect(AppUtils.isAudioFile('test.png'), isFalse);
    });

    test('getInitials returns correct initials', () {
      expect(AppUtils.getInitials('John Doe'), 'JD');
      expect(AppUtils.getInitials('Jane Smith'), 'JS');
      expect(AppUtils.getInitials('Single'), 'S');
      expect(AppUtils.getInitials(''), '?');
      expect(AppUtils.getInitials('A'), 'A');
      expect(AppUtils.getInitials('AB'), 'AB');
    });

    test('capitalize capitalizes correctly', () {
      expect(AppUtils.capitalize('test'), 'Test');
      expect(AppUtils.capitalize('TEST'), 'TEST');
      expect(AppUtils.capitalize('Test'), 'Test');
      expect(AppUtils.capitalize(''), '');
      expect(AppUtils.capitalize('a'), 'A');
    });

    test('truncate truncates correctly', () {
      expect(AppUtils.truncate('Hello World', 5), 'Hello...');
      expect(AppUtils.truncate('Short', 10), 'Short');
      expect(AppUtils.truncate('', 5), '');
      expect(AppUtils.truncate('Test', 4), 'Test');
      expect(AppUtils.truncate('Test', 3), 'Tes...');
    });

    test('isValidEmail validates correctly', () {
      expect(AppUtils.isValidEmail('test@example.com'), isTrue);
      expect(AppUtils.isValidEmail('test@sub.example.com'), isTrue);
      expect(AppUtils.isValidEmail('invalid-email'), isFalse);
      expect(AppUtils.isValidEmail(''), isFalse);
      expect(AppUtils.isValidEmail('test@'), isFalse);
      expect(AppUtils.isValidEmail('@example.com'), isFalse);
    });

    test('getInitials handles edge cases', () {
      expect(AppUtils.getInitials('  '), '?');
      expect(AppUtils.getInitials('a'), 'A');
      expect(AppUtils.getInitials('a b c d'), 'AB');
      expect(AppUtils.getInitials('a-b'), 'AB');
      expect(AppUtils.getInitials('a_b'), 'AB');
    });

    test('capitalize handles edge cases', () {
      expect(AppUtils.capitalize(''), '');
      expect(AppUtils.capitalize('a'), 'A');
      expect(AppUtils.capitalize('A'), 'A');
      expect(AppUtils.capitalize('1'), '1');
      expect(AppUtils.capitalize(' test'), ' test');
    });

    test('truncate handles edge cases', () {
      expect(AppUtils.truncate('', 0), '');
      expect(AppUtils.truncate('Test', 0), '...');
      expect(AppUtils.truncate('Test', 1), 'T...');
      expect(AppUtils.truncate('Test', 100), 'Test');
    });
  });
}
