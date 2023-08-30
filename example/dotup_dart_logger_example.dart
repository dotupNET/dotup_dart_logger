import 'package:dotup_dart_logger/dotup_dart_logger.dart';

class Trouble extends Error {
  final String message;
  Trouble(this.message);

  @override
  String toString() {
    return message;
  }
}

class Problem implements Exception {
  final String? message;

  Problem([this.message]);

  @override
  String toString() {
    if (message == null) return 'Exception';
    return 'Exception: $message';
  }
}

void main() {
  runExample();
}

void runExample() {
  final consoleWriter = ConsoleLogWriter(LogLevel.Info | LogLevel.Error);
  LoggerManager.addLogWriter(consoleWriter);

  var logger = Logger('dotup');

  // Only info and error are printed
  logger.debug("Where's the bug?");
  logger.error(UnimplementedError());
  logger.info('Starting');
  logger.warn('warning');

  LoggerManager.removeLogWriter(consoleWriter);

  final c2 = ConsoleLogWriter(LogLevel.All, formater: PrettyFormater(showColors: true));
  LoggerManager.addLogWriter(c2);
  logger = Logger('PP');
  logger.debug('PrettyFormater with colors');
  logger.info('PrettyFormater with colors');
  logger.warn('PrettyFormater with colors');
  logger.error(Trouble('PrettyFormater with colors'));
  logger.exception(Problem('PrettyFormater with colors'));
}
