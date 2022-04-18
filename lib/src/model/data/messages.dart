//stfu dart
// ignore_for_file: constant_identifier_names

import 'package:dirai/src/utils/enum_utils.dart';

/// 消息类型
enum MessageType {
  Source,
  Quote,
  At,
  AtAll,
  Face,
  Plain,
  Image,
  FlashImage,
  Voice,
  Xml,
  Json,
  App,
  Poke,
  Dice,
  MarketFace,
  MusicShare,
  ForwardMessage,
  File,
  MiraiCode
}

/// 消息基类
abstract class MessageBase{
    MessageType get type;

    Map<String, dynamic> toJson();
}

/// 源消息
class SourceMessage extends MessageBase {
  @override
  get type => MessageType.Source;

  late int id;

  late int time;

  @override
  Map<String, dynamic> toJson() => {
    'type': type.toBriefString(),
    'id': id,
    'time': time
  };
}

/// 回复消息
class QuoteMessage extends MessageBase {
  @override
  MessageType get type => MessageType.Quote;

  int id;

  int groupId;

  int senderId;

  int targetId;

  List<MessageBase> origin;


  QuoteMessage(
      this.id, this.groupId, this.senderId, this.targetId, this.origin);

  @override
  Map<String, dynamic> toJson() => {
    'type': type.toBriefString(),
    'id': id,
    'groupId': groupId,
    'senderId': senderId,
    'targetId': targetId,
    'origin': origin.map((e) => e.toJson()).toList()
  };
}

/// @某人消息
class AtMessage extends MessageBase {
  @override
  MessageType get type => MessageType.At;

  int target;

  String get _display => "";

  @override
  Map<String, dynamic> toJson() => {
    'type': type.toBriefString(),
    'target': target,
    'display': _display
  };

  AtMessage(this.target);
}

/// @全体成员消息
class AtAllMessage extends MessageBase {
  @override
  MessageType get type => MessageType.AtAll;

  @override
  Map<String, dynamic> toJson() => {
    'type': type.toBriefString()
  };
}

class FaceMessage extends MessageBase {
  late int? faceId;

  late String? name;

  @override
  Map<String, dynamic> toJson() {
    if (faceId == null) {
      return {
        'type': type.toBriefString(),
        'name': name
      };
    } else {
      return {
        'type': type.toBriefString(),
        'faceId': faceId
      };
    }
  }

  @override
  MessageType get type => MessageType.Face;

  FaceMessage.fromId(this.faceId);

  FaceMessage.fromName(this.name);
}

class PlainMessage extends MessageBase {
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'text': text
    };
  }

  @override
  MessageType get type => MessageType.Plain;

  String text;

  PlainMessage(this.text);
}

class ImageMessage extends MessageBase {
  @override
  Map<String, dynamic> toJson() {
    if(imageId != null) {
      return {
        'type': type.toBriefString(),
        'imageId': imageId
      };
    } else if(url != null) {
      return {
        'type': type.toBriefString(),
        'url': url
      };
    } else if (path != null) {
      return {
        'type': type.toBriefString(),
        'path': path
      };
    } else {
      return {
        'type': type.toBriefString(),
        'base64': base64
      };
    }
  }

  @override
  MessageType get type => MessageType.Image;

  late String? imageId;

  late String? url;

  late String? path;

  late String? base64;

  ImageMessage.fromId(this.imageId);

  ImageMessage.fromUrl(this.url);

  ImageMessage.fromPath(this.path);

  ImageMessage.fromBase64(this.base64);
}

class FlashImageMessage extends MessageBase {
  @override
  Map<String, dynamic> toJson() {
    if(imageId != null) {
      return {
        'type': type.toBriefString(),
        'imageId': imageId
      };
    } else if(url != null) {
      return {
        'type': type.toBriefString(),
        'url': url
      };
    } else if (path != null) {
      return {
        'type': type.toBriefString(),
        'path': path
      };
    } else {
      return {
        'type': type.toBriefString(),
        'base64': base64
      };
    }
  }

  @override
  MessageType get type => MessageType.FlashImage;

  late String? imageId;

  late String? url;

  late String? path;

  late String? base64;

  FlashImageMessage.fromId(this.imageId);

  FlashImageMessage.fromUrl(this.url);

  FlashImageMessage.fromPath(this.path);

  FlashImageMessage.fromBase64(this.base64);
}

class VoiceMessage extends MessageBase {
  @override
  Map<String, dynamic> toJson() {
    if(voiceId != null) {
      return {
        'type': type.toBriefString(),
        'voiceId': voiceId
      };
    } else if(url != null) {
      return {
        'type': type.toBriefString(),
        'url': url
      };
    } else if (path != null) {
      return {
        'type': type.toBriefString(),
        'path': path
      };
    } else {
      return {
        'type': type.toBriefString(),
        'base64': base64
      };
    }
  }

  @override
  MessageType get type => MessageType.Voice;

  late String? url;

  late String? path;

  late String? base64;

  late String? voiceId;

  ///返回的语音长度, 发送消息时可以不传
  late int length;

  VoiceMessage.fromUrl(this.url);

  VoiceMessage.fromPath(this.path);

  VoiceMessage.fromBase64(this.base64);

  VoiceMessage.fromId(this.voiceId);
}

class XmlMessage extends MessageBase {
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'xml': xml
    };
  }

  @override
  MessageType get type => MessageType.Xml;

  String xml;

  XmlMessage(this.xml);
}

class JsonMessage extends MessageBase {
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'json': json
    };
  }

  @override
  MessageType get type => MessageType.Json;

  String json;

  JsonMessage(this.json);
}

class AppMessage extends MessageBase {
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'app': app
    };
  }

  @override
  MessageType get type => MessageType.App;

  String app;

  AppMessage(this.app);
}

class PokeMessage extends MessageBase {
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'name': name
    };
  }

  @override
  MessageType get type => MessageType.Poke;

  String name;

  PokeMessage(this.name);
}

class DiceMessage extends MessageBase {
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'value': value
    };
  }

  @override
  MessageType get type => MessageType.Dice;

  String value;

  DiceMessage(this.value);
}

class MarketFaceMessage extends MessageBase {
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'name': face,
      'id': id
    };
  }

  @override
  MessageType get type => MessageType.MarketFace;

  late String face;

  late int id;
}

class MusicShareMessage extends MessageBase{
  @override
  MessageType get type => MessageType.MusicShare;

  late String kind;

  late String title;

  late String summary;

  late String jumpUrl;

  late String pictureUrl;

  late String musicUrl;

  late String brief;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'kind': kind,
      'title': title,
      'summary': summary,
      'jumpUrl': jumpUrl,
      'pictureUrl': pictureUrl,
      'musicUrl': musicUrl,
      'brief': brief
    };
  }
}

class ForwardMessage extends MessageBase {
  @override
  MessageType get type => MessageType.ForwardMessage;

  late List<ForwardMessageNode> nodeList;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'nodeList': nodeList
    };
  }
}

class ForwardMessageNode {
  late int senderId;

  late int time;

  late String senderName;

  late List<MessageBase> messageChain;

  late int messageId;

  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'time': time,
      'senderName': senderName,
      'messageChain': messageChain.map((e) => e.toJson()).toList(),
      'messageId': messageId
    };
  }
}

class FileMessage extends MessageBase {
  @override
  MessageType get type => MessageType.File;

  late String id;

  late String name;

  late int size;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'id': id,
      'name': name,
      'size': size
    };
  }
}

class MiraiCode extends MessageBase {
  @override
  MessageType get type => MessageType.MiraiCode;

  String code;

  MiraiCode(this.code);

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'code': code
    };
  }
}