# dotup_dart_logger

## Take a look at [dotup.de](https://dotup.de) or on [pub.dev](https://pub.dev/packages?q=dotup)

## Example

```dart
final consoleWriter = ConsoleLogWriter(LogLevel.Info | LogLevel.Error);
LoggerManager.addLogWriter(consoleWriter);

var logger = Logger('dotup');

// Only info and error are printed
logger.debug("Where's the bug?");
logger.error(UnimplementedError());
logger.info('Starting');
// console is a formated print call
logger.console(() => 'Expensive log entry');
logger.warn('warning');

LoggerManager.removeLogWriter(consoleWriter);

// Create an output target
final c2 = ConsoleLogWriter(LogLevel.All, formater: PrettyFormater(showColors: true));
// Add that target to LoggerManager
LoggerManager.addLogWriter(c2);
// Create a named Logger
logger = Logger('PP');
// And log
logger.debug('PrettyFormater with colors');
logger.info('PrettyFormater with colors');
logger.warn('PrettyFormater with colors');
logger.error(Trouble('PrettyFormater with colors'));
logger.exception(Problem('PrettyFormater with colors'));
```


### Example console output:

```
Connecting to VM Service at http://127.0.0.1:53575/raiZraXssJM=/
2021-07-30 07:39:22.566748 | logger: dotup | text: UnimplementedError | level: Error
2021-07-30 07:39:22.572365 | logger: dotup | text: Starting | level: Info
2021-07-30 07:39:22.573980 | logger: dotup | text: Expensive log entry | level: None
🐞  07:39:22.575765 PP PrettyFormater with colors Debug
ℹ️  07:39:22.578314 PP PrettyFormater with colors Info
🦺  07:39:22.578802 PP PrettyFormater with colors Warn
😩  07:39:22.579125 PP PrettyFormater with colors Error
💥  07:39:22.579755 PP Exception: PrettyFormater with colors Exception
Exited
```