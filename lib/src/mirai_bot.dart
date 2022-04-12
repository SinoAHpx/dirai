import 'dart:ffi';

import 'package:dirai/src/model/exceptions.dart';

import 'model/utils/http_endpoint.dart';
import 'utils/http_utils.dart';
import 'utils/logger.dart';
import 'utils/json_utils.dart';


class MiraiBot {
  /// 带主机和端口的地址，例如: localhost:8080
  late final String address;

  /// bot的qq号
  late final int qq;

  /// mah配置文件内的验证密钥
  late final String verifyKey;

  /// 单一实例
  static late MiraiBot instance;

  /// 日志，如果为null则不使用日志
  late LoggerBase? logger;

  late final String sessionKey;

  /// 启动bot，注意: 每次启动都会刷新静态的instance单例
  Future<void> launch() async {
    logger?.log("launching bot...");

    instance = this;

    await _verify();
    await _bind();

    logger?.log("launch successfully");
  }

  Future<void> dispose() async {
    if(sessionKey.isEmpty)
      return;

    await _release();

    logger?.log("life circle terminated");
  }

  /// 验明身份，返回session key
  Future<void> _verify() async {
    var payload = {"verifyKey": verifyKey}.toJsonString();
    var response = await HttpEndpoint.verify.post(payload);

    logger?.log("post /verify endpoint with payload $payload, get $response");
    var sessionKey = response?.fetch("session");
    if(sessionKey == null) {
      throw VerifyFailedException("failed to verify with key: \"$verifyKey\", response: $response");
    }
    logger?.log("session key is: $sessionKey");

    this.sessionKey = sessionKey;
  }

  Future<void> _bind() async {
    var payload = {"sessionKey": sessionKey, "qq": qq}.toJsonString();
    var response = await HttpEndpoint.bind.post(payload);
    logger?.log("post /bind endpoint with payload $payload, get $response");
    //todo: ensure success extension for response
  }

  Future<void> _release() async {
    var payload = {"sessionKey": sessionKey, "qq": qq}.toJsonString();
    var response = await HttpEndpoint.release.post(payload);
    logger?.log("post /release endpoint with payload $payload, get $response");
  }
}
