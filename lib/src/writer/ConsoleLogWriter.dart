import 'package:dotup_dart_logger/src/interfaces/ILogFormater.dart';
import 'package:dotup_dart_logger/src/LogLevel.dart';

import 'package:dotup_dart_logger/src/LogEntry.dart';
import 'package:dotup_dart_logger/src/formater/PipeSeparatedLogFormater.dart';

import '../interfaces/ILogWriter.dart';

class ConsoleLogWriter implements ILogWriter {
  @override
  late LogLevel logLevel;

  late ILogFormater formater;

  ConsoleLogWriter(this.logLevel, {ILogFormater? formater }){
    this.formater = formater ?? PipeSeparatedLogFormater();
  }

  @override
  void write(LogEntry logEntry) {
    print(formater.format(logEntry));
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
