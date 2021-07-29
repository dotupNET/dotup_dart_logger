import 'package:dotup_dart_logger/src/LogLevel.dart';
import 'package:dotup_dart_logger/src/LogManager.dart';
import 'package:dotup_dart_logger/src/Logger.dart';
import 'package:dotup_dart_logger/src/formater/PrettyFormater.dart';
import 'package:dotup_dart_logger/src/writer/ConsoleLogWriter.dart';

void main() {
  doIt();
}

void doIt() {
  final conso = ConsoleLogWriter(LogLevel.Info | LogLevel.Error);

  LoggerManager.addLogWriter(conso);

  final logger = Logger('test');

  logger.debug('DEBBBUUUG');
  logger.error(UnimplementedError());
  logger.info('infooooo');
  logger.console(() => 'dfdsdf');
  // logger.log('');
  logger.warn('warning');


final c2 = ConsoleLogWriter(LogLevel.Debug,formater:  PrettyFormater(showColors:true));
  LoggerManager.addLogWriter(c2);
  logger.debug('DEBBBUUUG');
  
}
