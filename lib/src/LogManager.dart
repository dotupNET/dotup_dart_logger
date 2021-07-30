import 'package:dotup_dart_logger/dotup_dart_logger.dart';
import 'package:dotup_dart_logger/src/interfaces/ILogWriter.dart';

import 'LogEntry.dart';

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
    writers.forEach(
      (element) {
        try {
          element.write(logEntry);
        } on Error catch (error) {
          print(error.toString());
        }
      },
    );
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
