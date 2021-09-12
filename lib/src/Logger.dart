import 'dart:developer' as dev;

import 'LogManager.dart';
import 'formater/PipeSeparatedLogFormater.dart';
import 'interfaces/ILogger.dart';
import 'LogEntry.dart';
import 'LogLevel.dart';
import 'Utils.dart';

const _printFormater = PipeSeparatedLogFormater();

class Logger implements ILogger {
  late final String name;
  late final LogHandler logHandler;

  static final Set<Logger> _cache = {};

  Logger.create(this.name, this.logHandler);

  factory Logger(
    String? name, {
    LogHandler? logHandler,
  }) {
    name ??= 'APP';
    var logger = _cache.firstWhereOrNull((element) => element.name == name);
    logHandler ??= LoggerManager.writeLogEntry;
    logger ??= Logger.create(name, logHandler);
    return logger;
  }

  void log(
    LogLevel level,
    Object message, {
    Map<String, dynamic>? data,
    Object? error,
    StackTrace? stackTrace,
    String? source,
  }) {
    final text = message is Function ? message() : message;
    final entry = LogEntry(
        logLevel: level,
        message: text.toString(),
        data: data,
        error: error,
        source: source,
        stackTrace: stackTrace,
        loggerName: name);
    logHandler(entry);
  }

  @override
  void debug(Object message, {Map<String, dynamic>? data, Object? error, StackTrace? stackTrace, String? source}) {
    log(LogLevel.Debug, message, data: data);
  }

  @override
  void error(Object error, {Map<String, dynamic>? data, StackTrace? stackTrace, String? source}) {
    log(LogLevel.Error, error.toString(), error: error);
  }

  @override
  void exception(Exception error, {Map<String, dynamic>? data, StackTrace? stackTrace, String? source}) {
    log(LogLevel.Exception, error.toString(), error: error);
  }

  @override
  void info(Object message, {Map<String, dynamic>? data, Object? error, StackTrace? stackTrace, String? source}) {
    log(LogLevel.Info, message, data: data);
  }

  @override
  void console(Object message, {Map<String, dynamic>? data, Object? error, StackTrace? stackTrace, String? source}) {
    final text = message is Function ? message() : message;

    final entry = LogEntry(
        logLevel: LogLevel.None,
        message: text,
        data: data,
        error: error,
        source: source,
        stackTrace: stackTrace,
        loggerName: name);
    print(_printFormater.format(entry));
  }

  @override
  void warn(Object message, {Map<String, dynamic>? data, Object? error, StackTrace? stackTrace, String? source}) {
    log(LogLevel.Warn, message, data: data);
  }

  static void startTrace(String name) {
    dev.Timeline.startSync(name);
  }

  static void stopTrace() {
    dev.Timeline.finishSync();
  }
}
