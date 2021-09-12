import 'package:dotup_dart_logger/dotup_dart_logger.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('A group of tests', () {
    test('isLevel Test', () {
      final l = LogLevel.Error | LogLevel.Debug;
      expect(l.isLevel(LogLevel.Error), isTrue);
      expect(l.isLevel(LogLevel.Debug), isTrue);
      expect(l.isLevel(LogLevel.Error | LogLevel.Debug), isTrue);
      expect(l.isLevel(LogLevel.Warn), isFalse);
      expect(l.isLevel(LogLevel.None), isFalse);
      expect(l.isLevel(LogLevel.Info), isFalse);
      expect(l.isLevel(LogLevel.Exception), isFalse);
    });
  });
}
