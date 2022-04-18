import 'dart:html';

import 'package:dirai/src/model/data/shared.dart';
import 'package:dirai/src/utils/enum_utils.dart';

import 'mixin.dart';

//todo for this file: notice that typo: `invitor`
//issue: https://github.com/project-mirai/mirai-api-http/issues/558

enum EventType {
  BotOnlineEvent,
  BotOfflineEventActive,
  BotOfflineEventForce,
  BotOfflineEventDropped,
  BotReloginEvent,
  FriendInputStatusChangedEvent,
  FriendNickChangedEvent,
  FriendRecallEvent,
  BotGroupPermissionChangeEvent,
  BotMuteEvent,
  BotUnmuteEvent,
  BotJoinGroupEvent,
  BotLeaveEventActive,
  BotLeaveEventKick,
  GroupRecallEvent,
  GroupNameChangeEvent,
  GroupEntranceAnnouncementChangeEvent,
  GroupMuteAllEvent,
  GroupAllowAnonymousChatEvent,
  GroupAllowConfessTalkEvent,
  GroupAllowMemberInviteEvent,
  MemberJoinEvent,
  MemberLeaveEventKick,
  MemberLeaveEventQuit,
  MemberCardChangeEvent,
  MemberSpecialTitleChangeEvent,
  MemberPermissionChangeEvent,
  MemberMuteEvent,
  MemberUnmuteEvent,
  MemberHonorChangeEvent,
  NewFriendRequestEvent,
  MemberJoinRequestEvent,
  BotInvitedJoinGroupRequestEvent,
  OtherClientOnlineEvent,
  OtherClientOfflineEvent,
  NudgeEvent
}

abstract class EventBase {
  // Map<String, dynamic> toJson();

  EventType get type;
}

class BotOnlineEvent extends EventBase  with BotEvent {
  @override
  EventType get type => EventType.BotOnlineEvent;

  // @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'qq': qq,
    };
  }
}

class BotOfflineEventActive extends EventBase with BotEvent {
  @override
  EventType get type => EventType.BotOfflineEventActive;

  // @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'qq': qq,
    };
  }
}

class BotOfflineEventForce extends EventBase  with BotEvent {
  @override
  EventType get type => EventType.BotOfflineEventForce;

  // @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'qq': qq,
    };
  }
}

class BotOfflineEventDropped extends EventBase  with BotEvent {
  @override
  EventType get type => EventType.BotOfflineEventDropped;

  // @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'qq': qq,
    };
  }
}

class BotReloginEvent extends EventBase with BotEvent {
  @override
  EventType get type => EventType.BotReloginEvent;

  // @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'qq': qq,
    };
  }
}

class FriendInputStatusChangedEvent extends EventBase {
  @override
  EventType get type => EventType.FriendInputStatusChangedEvent;

  late Friend friend;

  late bool inputting;

  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'friend': friend.toJson(),
      'inputting': inputting,
    };
  }
}

class FriendNickChangedEvent extends EventBase {
  @override
  EventType get type => EventType.FriendNickChangedEvent;

  late Friend friend;

  late String from;

  late String to;

  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'friend': friend.toJson(),
      'from': from,
      'to': to,
    };
  }
}

class FriendRecallEvent extends EventBase {
  @override
  EventType get type => EventType.FriendRecallEvent;

  late int authorId;

  late int messageId;

  late int time;

  late int operator;

  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'authorId': authorId,
      'messageId': messageId,
      'time': time,
      'operator': operator,
    };
  }
}

class BotGroupPermissionChangeEvent extends EventBase
    with GroupStatusChangeEvent<Permission> {
  @override
  EventType get type => EventType.BotGroupPermissionChangeEvent;

  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'origin': origin,
      'current': current,
      'group': group.toJson(),
    };
  }
}

abstract class GroupStatusChangeEvent<T> {
  late T origin;

  late T current;

  late Group group;

  late Operator operator;
}

class BotMuteEvent extends EventBase {
  @override
  EventType get type => EventType.BotMuteEvent;

  late int durationSeconds;

  late Operator operator;

  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'durationSeconds': durationSeconds,
      'operator': operator.toJson(),
    };
  }
}

class BotUnmuteEvent extends EventBase {
  @override
  EventType get type => EventType.BotUnmuteEvent;

  late Operator operator;

  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'operator': operator.toJson(),
    };
  }
}

class BotJoinGroupEvent extends EventBase {
  @override
  EventType get type => EventType.BotJoinGroupEvent;

  late Group group;

  late Member invitor;

  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'group': group.toJson(),
      'invitor': invitor.toJson(),
    };
  }
}

class BotLeaveEventActive extends EventBase {
  @override
  EventType get type => EventType.BotLeaveEventActive;

  late Group group;

  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'group': group.toJson(),
    };
  }
}

class BotLeaveEventKick extends EventBase {
  @override
  EventType get type => EventType.BotLeaveEventKick;

  late Group group;

  late Member operator;

  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'group': group.toJson(),
      'operator': operator.toJson(),
    };
  }
}

class GroupRecallEvent extends EventBase {
  @override
  EventType get type => EventType.GroupRecallEvent;

  late Group group;

  late int authorId;

  late int messageId;

  late int time;

  late Operator operator;

  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'group': group.toJson(),
      'authorId': authorId,
      'messageId': messageId,
      'time': time,
      'operator': operator.toJson(),
    };
  }
}

class NudgeEvent extends EventBase {
  @override
  EventType get type => EventType.NudgeEvent;

  late int fromId;

  late NudgeSubject subject;

  late String action;

  late String suffix;

  late int target;

  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'fromId': fromId,
      'subject': subject.toJson(),
      'action': action,
      'suffix': suffix,
      'target': target,
    };
  }
}

class NudgeSubject {
  late int id;

  late String kind;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kind': kind,
    };
  }
}

class GroupNameChangeEvent extends EventBase
    with GroupStatusChangeEvent<String> {
  @override
  EventType get type => EventType.GroupNameChangeEvent;

  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'group': group.toJson(),
      'origin': origin,
      'current': current,
      'operator': operator.toJson(),
    };
  }
}

class GroupEntranceAnnouncementChangeEvent extends EventBase
    with GroupStatusChangeEvent<String> {
  @override
  EventType get type => EventType.GroupEntranceAnnouncementChangeEvent;

  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'group': group.toJson(),
      'origin': origin,
      'current': current,
      'operator': operator.toJson(),
    };
  }
}

class GroupMuteAllEvent extends EventBase with GroupStatusChangeEvent<bool> {
  @override
  EventType get type => EventType.GroupMuteAllEvent;

  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'group': group.toJson(),
      'origin': origin,
      'current': current,
      'operator': operator.toJson(),
    };
  }
}

class GroupAllowAnonymousChatEvent extends EventBase
    with GroupStatusChangeEvent<bool> {
  @override
  EventType get type => EventType.GroupAllowAnonymousChatEvent;

  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'group': group.toJson(),
      'origin': origin,
      'current': current,
      'operator': operator.toJson(),
    };
  }
}

class GroupAllowConfessTalkEvent extends EventBase
    with GroupStatusChangeEvent<bool> {
  @override
  EventType get type => EventType.GroupAllowConfessTalkEvent;

  late bool isByBot;

  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'group': group.toJson(),
      'origin': origin,
      'current': current,
      'isByBot': isByBot,
    };
  }
}

class GroupAllowMemberInviteEvent extends EventBase
    with GroupStatusChangeEvent<bool> {
  @override
  EventType get type => EventType.GroupAllowMemberInviteEvent;

  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'group': group.toJson(),
      'origin': origin,
      'current': current,
      'operator': operator.toJson(),
    };
  }
}

class MemberJoinEvent extends EventBase {
  @override
  EventType get type => EventType.MemberJoinEvent;

  late Member member;

  late Member? invitor;

  Map<String, dynamic> toJson() {
    if (invitor == null) {
      return {
        'type': type.toBriefString(),
        'member': member.toJson(),
      };
    } else {
      return {
        'type': type.toBriefString(),
        'member': member.toJson(),
        'invitor': invitor!.toJson(),
      };
    }
  }
}

class MemberLeaveEventKick extends EventBase {
  @override
  EventType get type => EventType.MemberLeaveEventKick;

  late Member member;

  late Operator? operator;

  Map<String, dynamic> toJson() {
    if (operator == null) {
      return {
        'type': type.toBriefString(),
        'member': member.toJson(),
      };
    } else {
      return {
        'type': type.toBriefString(),
        'member': member.toJson(),
        'kicker': operator!.toJson(),
      };
    }
  }
}

class MemberLeaveEventQuit extends EventBase {
  @override
  EventType get type => EventType.MemberLeaveEventQuit;

  late Member member;

  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'member': member.toJson(),
    };
  }
}

class MemberCardChangeEvent extends EventBase
    with GroupStatusChangeEvent<String> {
  @override
  EventType get type => EventType.MemberCardChangeEvent;

  late Member member;

  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'member': member.toJson(),
      'origin': origin,
      'current': current,
    };
  }
}

class MemberSpecialTitleChangeEvent extends EventBase
    with GroupStatusChangeEvent<String> {
  @override
  EventType get type => EventType.MemberSpecialTitleChangeEvent;

  late Member member;

  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'member': member.toJson(),
      'origin': origin,
      'current': current,
    };
  }
}

class MemberPermissionChangeEvent extends EventBase
    with GroupStatusChangeEvent<Permission> {
  @override
  EventType get type => EventType.MemberPermissionChangeEvent;

  late Member member;

  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'member': member.toJson(),
      'origin': origin.toBriefString(),
      'current': current.toBriefString(),
    };
  }
}

class MemberMuteEvent extends EventBase {
  @override
  EventType get type => EventType.MemberMuteEvent;

  late Member member;

  late Operator? operator;

  late int durationTime;

  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'member': member.toJson(),
      'operator': operator?.toJson(),
      'durationTime': durationTime,
    };
  }
}

class MemberUnmuteEvent extends EventBase {
  @override
  EventType get type => EventType.MemberUnmuteEvent;

  late Member member;

  late Operator? operator;

  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'member': member.toJson(),
      'operator': operator?.toJson(),
    };
  }
}

class MemberHonorChangeEvent extends EventBase {
  @override
  EventType get type => EventType.MemberHonorChangeEvent;

  late Member member;

  late String action;

  late String honor;

  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'member': member.toJson(),
      'action': action,
      'honor': honor,
    };
  }
}

class NewFriendRequestEvent extends EventBase {
  @override
  EventType get type => EventType.NewFriendRequestEvent;

  late int eventId;

  late int fromId;

  late int groupId;

  late String nick;

  late String message;

  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'eventId': eventId,
      'fromId': fromId,
      'groupId': groupId,
      'nick': nick,
      'message': message,
    };
  }
}

class MemberJoinRequestEvent extends EventBase {
  @override
  EventType get type => EventType.MemberJoinRequestEvent;

  late int eventId;

  late int fromId;

  late int groupId;

  late String nick;

  late String message;

  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'eventId': eventId,
      'fromId': fromId,
      'groupId': groupId,
      'nick': nick,
      'message': message,
    };
  }
}

class BotInvitedJoinGroupRequestEvent extends EventBase {
  @override
  EventType get type => EventType.BotInvitedJoinGroupRequestEvent;

  late int eventId;

  late int fromId;

  late int groupId;

  late String nick;

  late String message;

  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'eventId': eventId,
      'fromId': fromId,
      'groupId': groupId,
      'nick': nick,
      'message': message,
    };
  }
}

class OtherClientOnlineEvent extends EventBase {
  @override
  EventType get type => EventType.OtherClientOnlineEvent;

  late OtherClient client;

  late int kind;

  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'client': client,
      'kind': kind,
    };
  }
}

class OtherClientOfflineEvent extends EventBase {
  @override
  EventType get type => EventType.OtherClientOfflineEvent;

  late OtherClient client;

  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'client': client,
    };
  }
}