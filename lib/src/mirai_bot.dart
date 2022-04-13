import 'dart:async';

import 'package:dirai/src/model/exceptions.dart';
import 'package:web_socket_channel/io.dart';

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

  late Stream updateStream;

  late final String sessionKey;

  /// 启动bot，注意: 每次启动都会刷新静态的instance单例
  Future<void> launch() async {
    logger?.log("launching bot...");

    instance = this;
    logger?.log("trying to initialize http adapter");
    await _verify();
    await _bind();
    logger?.log("successfully initialized http adapter");

    logger?.log("trying to connect to websocket adapter");
    await _connect();
    logger?.log("successfully initialized websocket adapter");

    logger?.log("launch successfully");
  }

  Future<void> dispose() async {
    if (sessionKey.isEmpty) {
      return;
    }

    await _release();
    _channel.sink.close();

    logger?.log("life circle terminated");
  }

  late IOWebSocketChannel _channel;

  /// connect to websocket adapter
  Future<void> _connect() async {
    _channel = IOWebSocketChannel.connect(
        Uri.parse("ws://$address/all?verifyKey=$verifyKey&qq=$qq"));
    updateStream = _channel.stream.asBroadcastStream();
  }

  /// verify session by specified verify key, set session key here
  Future<void> _verify() async {
    var payload = {"verifyKey": verifyKey}.toJsonString();
    var response = await HttpEndpoint.verify.post(payload);
    logger?.log("post /verify endpoint with payload $payload, get $response");

    if (response == null) {
      throw InvalidResponseException(
          "For some magic reasons, request was failed");
    }
    HttpEndpoint.verify.ensure(response, additionalMsg: "body: $payload");

    var sessionKey = response.fetch<String>("session");
    if (sessionKey == null) {
      throw VerifyFailedException(
          "failed to verify with key: \"$verifyKey\", response: $response");
    }

    logger?.log("session key is: $sessionKey");

    this.sessionKey = sessionKey;
  }

  Future<void> _bind() async {
    var payload = {"sessionKey": sessionKey, "qq": qq}.toJsonString();
    var response = await HttpEndpoint.bind.post(payload);
    logger?.log("post /bind endpoint with payload $payload, get $response");

    if (response == null) {
      throw InvalidResponseException(
          "For some magic reasons, request was failed");
    }

    HttpEndpoint.bind.ensure(response, additionalMsg: "body: $payload");
  }

  Future<void> _release() async {
    var payload = {"sessionKey": sessionKey, "qq": qq}.toJsonString();
    var response = await HttpEndpoint.release.post(payload);
    logger?.log("post /release endpoint with payload $payload, get $response");

    if (response == null) {
      throw InvalidResponseException(
          "For some magic reasons, request was failed");
    }

    HttpEndpoint.release.ensure(response, additionalMsg: "body: $payload");
  }
}
