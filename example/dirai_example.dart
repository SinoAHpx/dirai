import 'package:dirai/dirai.dart';
import 'package:dirai/src/utils/logger.dart';
import 'package:intl/intl.dart';

void main() async {
  final bot = MiraiBot()
    ..address = "localhost:8080"
    ..qq = 1590454991
    ..verifyKey = "1145141919810"
    ..logger = BasicLogger();
  
  bot.launch();
  
  print("this is a postfix");
}

class BasicLogger implements LoggerBase {
  String getPrefix(String type){
    var time = DateFormat("jms").format(DateTime.now());
    return "[$type $time] - ";
  }

  @override
  void error(String message, {Exception? exception}) {
    var exceptionMsg = exception.toString();
    // shut up dart
    // ignore: dead_null_aware_expression
    print("${getPrefix("ERROR")}$message${exception.toString() ?? ""}");
  }

  @override
  void log(String message) {
    print("${getPrefix("LOG")}$message");
  }

  @override
  void warn(String message) {
    print("${getPrefix("WARN")}$message");
  }
}
