import 'package:dotup_dart_logger/src/interfaces/ILogFormater.dart';
import 'package:dotup_dart_logger/src/LogEntry.dart';

class PipeSeparatedLogFormater implements ILogFormater {
  const PipeSeparatedLogFormater();
  @override
  String format(LogEntry logEntry) {
    final source = logEntry.source == null ? '' : ' | source: ${logEntry.source}';
    return ('${logEntry.timeStamp} | logger: ${logEntry.loggerName} | text: ${logEntry.message} | level: ${logEntry.logLevel}$source');
  }
}
