import 'package:dotup_dart_logger/src/LogEntry.dart';

import '../interfaces/ILogFormater.dart';
import '../LogLevel.dart';
import 'AnsiEscape.dart';

const _debugColor = AnsiEscape(foregroundColor: 15, italic: true);
const _infoColor = AnsiEscape(foregroundColor: 81);
const _warnColor = AnsiEscape(foregroundColor: 208);
const _errorColor = AnsiEscape(foregroundColor: 196);
const _exceptionColor = AnsiEscape(backgroundColor: 196, foregroundColor: 15);

class PrettyFormater implements ILogFormater {
  final bool showColors;
  final bool useSymbols;

  PrettyFormater({
    this.showColors = true,
    this.useSymbols = true,
  });

  static final _levelColors = {
    LogLevel.Debug: _debugColor,
    LogLevel.Info: _infoColor,
    LogLevel.Warn: _warnColor,
    LogLevel.Error: _errorColor,
    LogLevel.Exception: _exceptionColor,
  };

  static final _levelSymbols = {
    LogLevel.Debug: '🐞 ',
    LogLevel.Info: 'ℹ️ ',
    LogLevel.Warn: '🦺 ',
    LogLevel.Error: '😩 ',
    LogLevel.Exception: '💥 ',
  };

  static const _defaultPrefix = '🤔 ';

  String levelPrefix(LogLevel level) {
    return useSymbols == false ? level.name : (_levelSymbols[level] ?? _defaultPrefix);
  }

  AnsiEscape? levelColor(LogLevel level) {
    final result = _levelColors[level];
    return result;
  }

  @override
  String format(LogEntry record) {
    final _time = record.timeStamp.toIso8601String().split('T')[1];
    final _logLevel = record.logLevel;

    final _color = showColors ? levelColor(record.logLevel) ?? AnsiEscape() : AnsiEscape();
    final _prefix = levelPrefix(record.logLevel);

    return _color('$_prefix $_time ${record.loggerName} ${record.message} $_logLevel');
  }
}
