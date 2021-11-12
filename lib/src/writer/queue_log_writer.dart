import 'dart:collection';

import '../LogEntry.dart';
import '../LogLevel.dart';
import '../interfaces/ILogWriter.dart';

class QueueLogWriter implements ILogWriter {
  final Queue<LogEntry> queue;

  QueueLogWriter(this.logLevel) : queue = Queue();

  @override
  LogLevel logLevel;

  @override
  void write(LogEntry logEntry) {
    queue.add(logEntry);
  }
}
