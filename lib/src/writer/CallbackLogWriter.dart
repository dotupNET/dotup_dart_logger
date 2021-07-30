import 'package:dotup_dart_logger/dotup_dart_logger.dart';

import '../Utils.dart';

class CallbackLogWriter implements ILogWriter {
  LogHandler callback;
  
  CallbackLogWriter(this.logLevel, this.callback);

  @override
  LogLevel logLevel;

  @override
  void write(LogEntry logEntry) {
    callback(logEntry);
  }
}
