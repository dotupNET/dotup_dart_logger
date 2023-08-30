import 'dart:developer' as dev;

import 'LogEntry.dart';
import 'LogLevel.dart';
import 'LogManager.dart';
import 'Utils.dart';
import 'interfaces/ILogger.dart';

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
  void error(Object? message, {Object? error, Map<String, dynamic>? data, StackTrace? stackTrace, String? source}) {
    assert(message != null || error != null);
    log(LogLevel.Error, message ?? error!.toString(), error: error);
  }

  @override
  void exception(Object? message,
      {Exception? error, Map<String, dynamic>? data, StackTrace? stackTrace, String? source}) {
    assert(message != null || error != null);
    log(LogLevel.Exception, message ?? error!.toString(), error: error);
  }

  @override
  void info(Object message, {Map<String, dynamic>? data, Object? error, StackTrace? stackTrace, String? source}) {
    log(LogLevel.Info, message, data: data);
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
