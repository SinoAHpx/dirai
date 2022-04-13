import 'dart:convert';

extension JsonSerializeUtils<T> on T {
  String? toJsonString() {
    return json.encode(this);
  }
}

extension JsonDeserializeUtils on String {
  Map<String, dynamic> deserialize(){
    return json.decode(this);
  }

  T? fetch<T>(String token) {
    var map = deserialize();
    return map[token] as T;
  }
}