// ignore_for_file: constant_identifier_names

const LogLevel _None = LogLevel._('None', 0);
const LogLevel _Debug = LogLevel._('Debug', 1);
const LogLevel _Info = LogLevel._('Info', 2);
const LogLevel _Warn = LogLevel._('Warn', 4);
const LogLevel _Error = LogLevel._('Error', 8);
const LogLevel _Exception = LogLevel._('Exception', 16);
const LogLevel _All = LogLevel._('ALL', 0x1F);

class LogLevel implements Comparable {
  final int value;
  final String name;

  const LogLevel._(this.name, this.value);

  static const LogLevel None = _None;
  static const LogLevel Debug = _Debug;
  static const LogLevel Info = _Info;
  static const LogLevel Warn = _Warn;
  static const LogLevel Error = _Error;
  static const LogLevel Exception = _Exception;
  static const LogLevel All = _All;

  static LogLevel fromValue(int value) {
    switch (value) {
      case 1:
        return Debug;
      case 2:
        return Info;
      case 4:
        return Warn;
      case 8:
        return Error;
      case 16:
        return Exception;
      case 0x1F:
      case 0xFF:
        return All;

      default:
        return None;
    }
  }

  bool isLevel(LogLevel other) {
    if (value == 0 || other.value == 0) {
      return value == 0 && other.value == 0;
    } else {
      return (value & other.value) == other.value;
    }
  }

  static final List<LogLevel> values = [
    // None,
    Debug,
    Info,
    Warn,
    Error,
    Exception,
    // All,
  ];

  LogLevel operator |(LogLevel level) {
    final value = level.value | this.value;
    final name = '${this.name}|${level.name}';
    return LogLevel._(name, value);
  }

  // @override
  // bool operator ==(Object other) => other is LogLevel && value == other.value;

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

  // @override
  // int get hashCode => value;

  @override
  String toString() => name;
}
