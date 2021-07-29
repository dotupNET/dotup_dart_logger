import 'dart:developer' as dev;
import 'package:dotup_dart_logger/src/LogManager.dart';
import 'package:dotup_dart_logger/src/formater/PipeSeparatedLogFormater.dart';

import 'ILogger.dart';
import 'LogEntry.dart';
import 'LogLevel.dart';

///ignore: prefer_generic_function_type_aliases
typedef void LogHandler(LogEntry logEntry);
final _printFormater = PipeSeparatedLogFormater();

class Logger implements ILogger {
  String name;
  LogHandler logHandler;

  Logger(this.name, [this.logHandler = LoggerManager.writeLogEntry]);

  void log(LogLevel level, String message,
      {Map<String, dynamic>? data, Object? error, StackTrace? stackTrace, String? source}) {
    final entry = LogEntry(
        logLevel: level,
        message: message,
        data: data,
        error: error,
        source: source,
        stackTrace: stackTrace,
        loggerName: name);
    logHandler(entry);
  }

  @override
  void debug(String message, {Map<String, dynamic>? data, Object? error, StackTrace? stackTrace, String? source}) {
    log(LogLevel.Debug, message, data: data);
  }

  @override
  void error(Error error, {Map<String, dynamic>? data, StackTrace? stackTrace, String? source}) {
    log(LogLevel.Error, error.toString(), error: error);
  }

  @override
  void exception(Exception error, {Map<String, dynamic>? data, StackTrace? stackTrace, String? source}) {
    log(LogLevel.Exception, error.toString(), error: error);
  }

  @override
  void info(String message, {Map<String, dynamic>? data, Object? error, StackTrace? stackTrace, String? source}) {
    log(LogLevel.Info, message, data: data);
  }

  @override
  void console(Object message, {Map<String, dynamic>? data, Object? error, StackTrace? stackTrace, String? source}) {
    final text = message is Function ? message() : message;

    final entry = LogEntry(
        logLevel: LogLevel.None,
        message: message.toString(),
        data: data,
        error: error,
        source: source,
        stackTrace: stackTrace,
        loggerName: name);
    print(_printFormater.format(entry));
  }

  @override
  void warn(String message, {Map<String, dynamic>? data, Object? error, StackTrace? stackTrace, String? source}) {
    log(LogLevel.Warn, message, data: data);
  }

  static void startTrace(String name) {
    dev.Timeline.startSync(name);
  }

  static void stopTrace() {
    dev.Timeline.finishSync();
  }
}
