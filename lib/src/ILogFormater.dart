import 'LogEntry.dart';

abstract class ILogFormater {
  String format(LogEntry logEntry);
}
