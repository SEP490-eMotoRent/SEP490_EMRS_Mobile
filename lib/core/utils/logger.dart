import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 1,
      errorMethodCount: 5,
      lineLength: 80,
      colors: true,
      printEmojis: true,
      printTime: false,
    ),
  );

  void debug(String message) => _logger.d(message);
  void info(String message) => _logger.i(message);
  void warn(String message) => _logger.w(message);
  void error(String message) => _logger.e(message);
}
