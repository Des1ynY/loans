import 'package:mark/mark.dart' as l;

final $Logger = Logger();

class Logger {
  final l.Logger _logger;

  Logger() : _logger = l.Logger(processors: const [l.EphemeralMessageProcessor()]);

  void info(Object message, {Object? meta}) => _logger.info(message, meta: meta);

  void debug(Object message, {Object? meta}) => _logger.debug(message, meta: meta);

  void warning(Object message, {StackTrace? stackTrace, Object? meta}) {
    return _logger.warning(message, stackTrace: stackTrace, meta: meta);
  }

  void error(Object message, {StackTrace? stackTrace, Object? meta}) {
    return _logger.error(message, stackTrace: stackTrace, meta: meta);
  }
}
