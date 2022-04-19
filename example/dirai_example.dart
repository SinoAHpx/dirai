import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dirai/dirai.dart';
import 'package:dirai/src/model/data/message_buses.dart';
import 'package:dirai/src/model/data/messages.dart';
import 'package:dirai/src/utils/json_utils.dart';
import 'package:dirai/src/utils/logger.dart';
import 'package:intl/intl.dart';

void main() async {
  final bot = MiraiBot()
    ..address = "localhost:8080"
    ..qq = 1590454991
    ..verifyKey = "1145141919810"
    ..logger = BasicLogger();

  await bot.launch();

  bot.updateStream.listen((event) {
    var rawJson = event.toString();
    var jsonObject = jsonDecode(rawJson);


    print("receiving group message: $event");
  });
}

class BasicLogger implements LoggerBase {
  String getPrefix(String type) {
    var time = DateFormat("jms").format(DateTime.now());
    return "[$type $time] - ";
  }

  @override
  void error(String message, {Exception? exception}) {
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
