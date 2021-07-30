import '../LogEntry.dart';
import '../LogLevel.dart';

abstract class ILogWriter {
  late LogLevel logLevel;
  void write(LogEntry logEntry);
}
