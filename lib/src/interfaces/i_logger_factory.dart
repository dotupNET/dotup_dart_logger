import '../Utils.dart';
import 'ILogger.dart';

abstract class ILoggerFactory {
  ILogger create(String name, {LogHandler? logHandler});
}
