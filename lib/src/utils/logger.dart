abstract class LoggerBase{
  void log(String message);
  void warn(String message);
  void error(String message, {Exception? exception});
}