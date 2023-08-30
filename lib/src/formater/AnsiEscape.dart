// Colors are 256-color mode
class AnsiEscape {
  const AnsiEscape({this.backgroundColor, this.foregroundColor, this.italic = false});

  /// Control Sequence Introducer
  static const ansiEsc = '\x1B[';

  /// Reset to terminal defaults.
  static const ansiDefault = '${ansiEsc}0m';

  final int? foregroundColor;
  final int? backgroundColor;
  final bool italic;

  bool get hasColor => foregroundColor != null || backgroundColor != null;

  /// Colors and styles are taken from:
  /// https://en.wikipedia.org/wiki/ANSI_escape_code
  @override
  String toString() {
    final sb = StringBuffer();

    if (italic) {
      sb.write('${ansiEsc}3;m');
    }

    if (foregroundColor != null) {
      sb.write('${ansiEsc}38;5;${foregroundColor}m');
    }
    if (backgroundColor != null) {
      sb.write('${ansiEsc}48;5;${backgroundColor}m');
    }

    if (sb.length == ansiEsc.length) {
      return '';
    } else {
      return sb.toString();
    }
  }

  String call(String msg) {
    if (hasColor) {
      return '$this$msg$ansiDefault';
    } else {
      return msg;
    }
  }

  /// Defaults the foreground color
  String get resetForeground => hasColor ? '${ansiEsc}39m' : '';

  /// Defaults the background color
  String get resetBackground => hasColor ? '${ansiEsc}49m' : '';
}
