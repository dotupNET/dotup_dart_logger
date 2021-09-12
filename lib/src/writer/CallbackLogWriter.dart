import '../LogEntry.dart';
import '../LogLevel.dart';
import '../Utils.dart';
import '../interfaces/ILogWriter.dart';

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
