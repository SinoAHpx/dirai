import 'dart:io';
import 'package:dirai/dirai.dart';
import 'package:dirai/src/model/utils/http_endpoint.dart';
import 'package:http/http.dart' as http;

extension HttpUtils on HttpEndpoint {
  // String get(){
  //   var url = Uri.parse(MiraiBot.instance.address);
  //   var client = http.get(url);
  // }

  //http post in dart
  Future<String?> post(Object? body) async {
    assert(MiraiBot.instance.address == "localhost:8080");
    var url = Uri.parse('http://$MiraiBot.instance.address/$this');
    var response = await http.post(url, body: body);

    return response.body;
  }
}