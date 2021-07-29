import 'package:dotup_dart_logger/src/LogEntry.dart';

import '../ILogFormater.dart';
import '../LogLevel.dart';
import 'AnsiColor.dart';

class PrettyFormater implements ILogFormater{
   PrettyFormater({
    this.showColors,
  }) ;

  final bool? showColors;

  bool get _colorize => showColors ?? false;

  static final _levelColors = {
    LogLevel.Debug: AnsiColor(foregroundColor: AnsiColor.grey(0.5), italic: true),
    LogLevel.Info: AnsiColor(foregroundColor: 35),
    LogLevel.Warn: AnsiColor(foregroundColor: 214),
    LogLevel.Error: AnsiColor(foregroundColor: 196),
  };

  static final _levelPrefixes = {
    LogLevel.Debug: '🐛 ',
    LogLevel.Info: '👻 ',
    LogLevel.Warn: '⚠️ ',
    LogLevel.Error: '‼️ ',
  };

  static const _defaultPrefix = '🤔 ';



  String? levelPrefix(LogLevel level) {
    return _levelPrefixes[level];
  }

  AnsiColor? levelColor(LogLevel level) {
    return _levelColors[level];
  }

  @override
  String format(LogEntry record) {
    final _time = record.timeStamp.toIso8601String().split('T')[1];
    final _logLevel = record.logLevel;

    final _color = _colorize ? levelColor(record.logLevel) ?? AnsiColor() : AnsiColor();
    final _prefix = levelPrefix(record.logLevel) ?? _defaultPrefix;

    return _color('$_prefix $_time ${record.loggerName} ${record.message} $_logLevel');

  }
}