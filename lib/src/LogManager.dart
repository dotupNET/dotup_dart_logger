import 'dart:developer';

import 'LogEntry.dart';
import 'LogLevel.dart';
import 'interfaces/ILogWriter.dart';
import 'writer/ConsoleLogWriter.dart';

class LoggerManager {
  static final List<ILogWriter> logWriters = [];

  LoggerManager._();

  static void console(LogLevel logLevel) {
    addLogWriter(ConsoleLogWriter(logLevel));
  }

  static void removeAllLogWriter(LogLevel logLevel) {
    logWriters.clear();
  }

  static void addLogWriter(ILogWriter logWriter) {
    logWriters.add(logWriter);
  }

  static void removeLogWriter(ILogWriter logWriter) {
    logWriters.remove(logWriter);
  }

  static void writeLogEntry(LogEntry logEntry) {
    final writers = logWriters.where(
      (writer) {
        return writer.logLevel.isLevel(logEntry.logLevel);
      },
    );
    for (var element in writers) {
      try {
        element.write(logEntry);
      } on Error catch (error) {
        log(error.toString());
      }
    }
  }

  // Frame? _getCallerFrame() {
  //   if (!level.includeCallerInfo) {
  //     return null;
  //   }

  //   // Expensive
  //   final frames = Trace.current(level.callerFrameDepthLevel).frames;
  //   return frames.isEmpty ? null : frames.first;
  // }
}
