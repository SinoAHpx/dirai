import 'package:dirai/src/model/utils/http_endpoint.dart';
import 'package:dirai/src/utils/http_utils.dart';


class MiraiBot {
  /// 带主机和端口的地址，例如: localhost:8080
  late final String address;

  /// bot的qq号
  late final int qq;

  /// mah配置文件内的验证密钥
  late final String verifyKey;

  /// 单一实例
  static late MiraiBot instance;

  /// 启动bot，注意: 每次启动都会刷新静态的instance单例
  void launch() {
    instance = this;
  }

  /// 验明身份，返回验证密钥
  Future<String?> verify() async {
    var response = await HttpEndpoint.verify.post({"verifyKey": verifyKey});

    return response;
  }
}
