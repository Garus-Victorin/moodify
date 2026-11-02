class AppException implements Exception {
  final String message;
  final String prefix;

  AppException([this.message = '', this.prefix = '']);

  @override
  String toString() => '$prefix$message';
}

class DatabaseException extends AppException {
  DatabaseException([String message = '']) : super(message, 'Database Error: ');
}

class AudioException extends AppException {
  AudioException([String message = '']) : super(message, 'Audio Error: ');
}

class PermissionException extends AppException {
  PermissionException([String message = ''])
    : super(message, 'Permission Error: ');
}

class FileException extends AppException {
  FileException([String message = '']) : super(message, 'File Error: ');
}

class NetworkException extends AppException {
  NetworkException([String message = '']) : super(message, 'Network Error: ');
}

class ValidationException extends AppException {
  ValidationException([String message = ''])
    : super(message, 'Validation Error: ');
}
