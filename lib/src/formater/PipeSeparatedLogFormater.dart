import '../LogEntry.dart';
import '../interfaces/ILogFormater.dart';

class PipeSeparatedLogFormater implements ILogFormater {
  const PipeSeparatedLogFormater();
  @override
  String format(LogEntry logEntry) {
    final source = logEntry.source == null ? '' : ' | source: ${logEntry.source}';
    return ('${logEntry.timeStamp} | logger: ${logEntry.loggerName} | text: ${logEntry.message} | level: ${logEntry.logLevel}$source');
  }
}
