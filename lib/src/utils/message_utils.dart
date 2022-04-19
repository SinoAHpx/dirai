import 'package:dirai/src/model/data/messages.dart';
import 'package:dirai/src/model/exceptions.dart';

extension MessageUtils on Map<String, dynamic> {
  MessageBase toMessage() {
    var type = this['type'].toString();
    switch (type) {
      case 'Source':
        return SourceMessage(this['id'] as int, this['time'] as int);
      case 'Quote':
        return QuoteMessage(
            this['id'] as int,
            this['groupId'] as int,
            this['senderId'] as int,
            this['targetId'] as int,
            (this['origin'] as List<Map<String, dynamic>>)
                .map((e) => e.toMessage())
                .toList());
      case 'At':
        return AtMessage(this['target'] as int);
      case 'AtAll':
        return AtAllMessage();
      case 'Face':
        if (this['faceId'] != null) {
          return FaceMessage.fromId(this['faceId'] as int);
        } else {
          return FaceMessage.fromName(this['name'] as String);
        }
      case 'Plain':
        return PlainMessage(this['text'] as String);
      case 'Image':
        if (this['imageId'] != null) {
          return ImageMessage.fromId(this['imageId'] as String);
        } else if (this['url'] != null) {
          return ImageMessage.fromUrl(this['url'] as String);
        } else if (this['path'] != null) {
          return ImageMessage.fromPath(this['path'] as String);
        } else {
          return ImageMessage.fromBase64(this['base64']);
        }
      case 'FlashImage':
        if (this['imageId'] != null) {
          return FlashImageMessage.fromId(this['imageId'] as String);
        } else if (this['url'] != null) {
          return FlashImageMessage.fromUrl(this['url'] as String);
        } else if (this['path'] != null) {
          return FlashImageMessage.fromPath(this['path'] as String);
        } else {
          return FlashImageMessage.fromBase64(this['base64'] as String);
        }
      case 'Voice':
        if (this['voiceId'] != null) {
          return VoiceMessage.fromId(this['voiceId'] as String);
        } else if (this['url'] != null) {
          return VoiceMessage.fromUrl(this['url'] as String);
        } else if (this['path'] != null) {
          return VoiceMessage.fromPath(this['path'] as String);
        } else {
          return VoiceMessage.fromBase64(this['base64'] as String);
        }
      case 'Xml':
        return XmlMessage(this['xml'] as String);
      case 'Json':
        return JsonMessage(this['json'] as String);
      case 'App':
        return AppMessage(this['app'] as String);
      case 'Poke':
        return PokeMessage(this['name'] as String);
      case 'Dice':
        return DiceMessage(this['value'] as int);
      case 'MarketFace':
        return MarketFaceMessage(this['face'] as String, this['id'] as int);
      case 'MusicShare':
        return MusicShareMessage(
            this['kind'] as String,
            this['title'] as String,
            this['summary'] as String,
            this['jumpUrl'] as String,
            this['pictureUrl'] as String,
            this['musicUrl'] as String,
            this['brief'] as String);
      case 'Forward':
        var nodeList = this['nodeList'] as List<Map<String, dynamic>>;
        var processed = nodeList
            .map((e) => ForwardMessageNode(
                e['senderId'] as int,
                e['time'] as int,
                e['senderName'] as String,
                (e['messageChain'] as List<Map<String, dynamic>>)
                    .map((e) => e.toMessage())
                    .toList(),
                e['messageId'] as int))
            .toList();

        return ForwardMessage(processed);
      case 'File':
        return FileMessage(
            this['id'] as String, this['name'] as String, this['size'] as int);
      default:
        throw UnknownMessageTypeException('Unknown message type: $type');
    }
  }
}
