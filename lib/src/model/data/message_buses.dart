// ignore_for_file: constant_identifier_names

import 'package:dirai/src/model/data/messages.dart';
import 'package:dirai/src/model/data/shared.dart';
import 'package:dirai/src/utils/enum_utils.dart';

enum MessageBusType {
  FriendMessage,
  GroupMessage,
  TempMessage,
  StrangerMessage,
  OtherClientMessage
}

abstract class MessageBusBase<T> {
  MessageBusType get type;

  late T sender;

  late List<MessageBase> messageChain;

  Map<String, dynamic> toJson();
}

class FriendMessageBus extends MessageBusBase<Friend> {
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'sender': sender.toJson(),
      'messageChain': messageChain.map((e) => e.toJson()).toList()
    };
  }

  @override
  MessageBusType get type => MessageBusType.FriendMessage;
}

class GroupMessageBus extends MessageBusBase<Group> {
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'sender': sender.toJson(),
      'messageChain': messageChain.map((e) => e.toJson()).toList()
    };
  }

  @override
  MessageBusType get type => MessageBusType.GroupMessage;
}

class TempMessageBus extends MessageBusBase<Operator> {
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'sender': sender.toJson(),
      'messageChain': messageChain.map((e) => e.toJson()).toList()
    };
  }

  @override
  MessageBusType get type => MessageBusType.TempMessage;
}

class StrangerMessageBus extends MessageBusBase<Friend> {
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'sender': sender.toJson(),
      'messageChain': messageChain.map((e) => e.toJson()).toList()
    };
  }

  @override
  MessageBusType get type => MessageBusType.StrangerMessage;
}

class OtherClientMessageBus extends MessageBusBase<OtherClient> {
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'sender': sender.toJson(),
      'messageChain': messageChain.map((e) => e.toJson()).toList()
    };
  }

  @override
  MessageBusType get type => MessageBusType.OtherClientMessage;
}