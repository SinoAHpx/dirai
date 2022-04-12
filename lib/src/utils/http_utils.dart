import 'package:dirai/dirai.dart';
import 'package:dirai/src/model/utils/http_endpoint.dart';
import 'package:dirai/src/utils/enum_utils.dart';
import 'package:http/http.dart' as http;
import 'package:dirai/src/utils/json_utils.dart';

extension HttpUtils on HttpEndpoint {
  // String get(){
  //   var url = Uri.parse(MiraiBot.instance.address);
  //   var client = http.get(url);
  // }

  //http post in dart, warning: body won't be serialized to json
  Future<String?> post(Object? body) async {
    var url = Uri.parse('http://${MiraiBot.instance.address}/${toBriefString()}');
    var response = await http.post(url, body: body);

    return response.body;
  }
}