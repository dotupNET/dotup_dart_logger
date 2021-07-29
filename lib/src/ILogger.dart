abstract class ILogger {
  void console(Object message, {Map<String, dynamic>? data, Object? error, StackTrace? stackTrace, String? source});
  void debug(String message, {Map<String, dynamic>? data, Object? error, StackTrace? stackTrace, String? source});
  void info(String message, {Map<String, dynamic>? data, Object? error, StackTrace? stackTrace, String? source});
  void warn(String message, {Map<String, dynamic>? data, Object? error, StackTrace? stackTrace, String? source});
  void error(Error error, {Map<String, dynamic>? data, StackTrace? stackTrace, String? source});
  void exception(Exception error, {Map<String, dynamic>? data, StackTrace? stackTrace, String? source});
}

// abstract class Logger implements ILogger {
//   // void print(Object? message, [Object? error]);
//   // void debug(Object? message, [Object? error]);
//   // void info(Object? message, [Object? error]);
//   // void warn(Object? message, [Object? error]);
//   // void error(Object? error);

//   static void startTrace(String name) {
//     dev.Timeline.startSync(name);
//   }

//   static void stopTrace() {
//     dev.Timeline.finishSync();
//   }
// }