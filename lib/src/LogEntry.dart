import 'package:dotup_dart_logger/src/LogLevel.dart';

import 'LogLevel.dart';

class LogEntry {
  final LogLevel logLevel;
  final String message;
  late final DateTime timeStamp;
  final Object? error;
  final Map<String, dynamic>? data;
  final StackTrace? stackTrace;
  final String? source;
  final String? loggerName;
  LogEntry({
    required this.logLevel,
    required this.message,
    DateTime? timeStamp,
    this.data,
    this.error,
    this.stackTrace,
    this.source,
    this.loggerName,
  }) {
    this.timeStamp = timeStamp ?? DateTime.now();
  }
}
