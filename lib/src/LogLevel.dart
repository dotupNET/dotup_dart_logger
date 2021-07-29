const LogLevel _None = LogLevel._('None', 0);
const LogLevel _Debug = LogLevel._('Debug', 1);
const LogLevel _Info = LogLevel._('Info', 2);
const LogLevel _Warn = LogLevel._('Warn', 4);
const LogLevel _Error = LogLevel._('Error', 8);
const LogLevel _Exception = LogLevel._('Exception', 16);

class LogLevel implements Comparable {
  final int value;
  final String name;

  const LogLevel._(this.name, this.value);

  static LogLevel None = _None;
  static LogLevel Debug = _Debug;
  static LogLevel Info = _Info;
  static LogLevel Warn = _Warn;
  static LogLevel Error = _Error;
  static LogLevel Exception = _Exception;

  bool isLevel(LogLevel other) {
    if (value == 0 || other.value == 0) {
      return value == 0 && other.value == 0;
    } else {
      return (value & other.value) == other.value;
    }
  }

  static final List<LogLevel> values = [
    None,
    Debug,
    Info,
    Warn,
    Error,
    Exception,
  ];

  LogLevel operator |(LogLevel level) {
    final value = level.value | this.value;
    final name = '${this.name}|${level.name}';
    return LogLevel._(name, value);
  }

  @override
  bool operator ==(Object other) => other is LogLevel && value == other.value;

  bool operator <(LogLevel other) => value < other.value;

  bool operator <=(LogLevel other) => value <= other.value;

  bool operator >(LogLevel other) => value > other.value;

  bool operator >=(LogLevel other) => value >= other.value;

  @override
  int compareTo(Object? other) {
    if (other is LogLevel) {
      return value < other.value ? -1 : 1;
    }
    return 0;
  }

  @override
  int get hashCode => value;

  @override
  String toString() => name;
}
