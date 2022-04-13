import 'package:dirai/dirai.dart';
import 'package:dirai/src/model/exceptions.dart';
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

  /// If there's no "code" entity in the json, assuming it was successful request
  void ensure(String responseJson, {String additionalMsg = ""}) {
    var code = responseJson.fetch<int>("code");
    if(code != null && code != 0){
      var msg = ": ${responseJson.fetch("msg")}" ?? "";
      if(additionalMsg.isNotEmpty) {
        additionalMsg = ", $additionalMsg";
      }
      throw InvalidResponseException("Failed to request endpoint \"${toBriefString()}\"$msg$additionalMsg");
    }
  }
}