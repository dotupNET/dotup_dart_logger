import '../LogEntry.dart';
import '../LogLevel.dart';
import '../formater/PipeSeparatedLogFormater.dart';
import '../interfaces/ILogFormater.dart';
import '../interfaces/ILogWriter.dart';

const bool prod = bool.fromEnvironment('dart.vm.product');

class ConsoleLogWriter implements ILogWriter {
  @override
  late LogLevel logLevel;

  late ILogFormater formater;

  ConsoleLogWriter(this.logLevel, {ILogFormater? formater}) {
    this.formater = formater ?? const PipeSeparatedLogFormater();
  }

  @override
  void write(LogEntry logEntry) {
    if (!prod) {
      // ignore: avoid_print
      print(formater.format(logEntry));
    }
  }

  // static WithAllLevels(): ConsoleLogWriter {
  //   const result = new ConsoleLogWriter();
  //   result.logLevel = LogLevel.Debug |
  //     LogLevel.Info |
  //     LogLevel.Warn |
  //     LogLevel.Error |
  //     LogLevel.Fatal;

  //   return result;
  // }

  // write(entry: LogEntry): void {
  //   const level = LogLevel[entry.logLevel];
  //   console.log(`${entry.timeStamp} - ${entry.context}:${entry.memberName} - ${entry.message} - ${level}`);
  // }

}
