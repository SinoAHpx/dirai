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
  Map<String, dynamic> toJson();

  EventType get type;
}

class BotOnlineEvent extends EventBase  with BotEventMixin {
  @override
  EventType get type => EventType.BotOnlineEvent;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'qq': qq,
    };
  }
}

class BotOfflineEventActive extends EventBase with BotEventMixin {
  @override
  EventType get type => EventType.BotOfflineEventActive;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'qq': qq,
    };
  }
}

class BotOfflineEventForce extends EventBase  with BotEventMixin {
  @override
  EventType get type => EventType.BotOfflineEventForce;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'qq': qq,
    };
  }
}

class BotOfflineEventDropped extends EventBase  with BotEventMixin {
  @override
  EventType get type => EventType.BotOfflineEventDropped;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'qq': qq,
    };
  }
}

class BotReloginEvent extends EventBase with BotEventMixin {
  @override
  EventType get type => EventType.BotReloginEvent;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'qq': qq,
    };
  }
}

class FriendInputStatusChangedEvent extends EventBase with FriendEventMixin {
  @override
  EventType get type => EventType.FriendInputStatusChangedEvent;

  late bool inputting;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'friend': friend.toJson(),
      'inputting': inputting,
    };
  }
}

class FriendNickChangedEvent extends EventBase with FriendEventMixin {
  @override
  EventType get type => EventType.FriendNickChangedEvent;

  late String from;

  late String to;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'friend': friend.toJson(),
      'from': from,
      'to': to,
    };
  }
}

class FriendRecallEvent extends EventBase with RecallEventMixin {
  @override
  EventType get type => EventType.FriendRecallEvent;

  late int operator;

  @override
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
    with GroupStatusChangeEventMixin<Permission> {
  @override
  EventType get type => EventType.BotGroupPermissionChangeEvent;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'origin': origin,
      'current': current,
      'group': group.toJson(),
    };
  }
}

class BotMuteEvent extends EventBase with MuteEventMixin {
  @override
  EventType get type => EventType.BotMuteEvent;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'durationSeconds': durationSeconds,
      'operator': operator?.toJson(),
    };
  }
}

class BotUnmuteEvent extends EventBase with MuteEventMixin {
  @override
  EventType get type => EventType.BotUnmuteEvent;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'operator': operator?.toJson(),
    };
  }
}

class BotJoinGroupEvent extends EventBase with JoinEventMixin {
  @override
  EventType get type => EventType.BotJoinGroupEvent;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'group': group.toJson(),
      'invitor': invitor?.toJson(),
    };
  }
}

class BotLeaveEventActive extends EventBase with LeaveEventMixin {
  @override
  EventType get type => EventType.BotLeaveEventActive;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'group': group.toJson(),
    };
  }
}

class BotLeaveEventKick extends EventBase with LeaveEventMixin {
  @override
  EventType get type => EventType.BotLeaveEventKick;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'group': group.toJson(),
      'operator': operator?.toJson(),
    };
  }
}

class GroupRecallEvent extends EventBase with RecallEventMixin {
  @override
  EventType get type => EventType.GroupRecallEvent;

  late Group group;

  late Operator operator;

  @override
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

  @override
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
    with GroupStatusChangeEventMixin<String> {
  @override
  EventType get type => EventType.GroupNameChangeEvent;

  @override
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
    with GroupStatusChangeEventMixin<String> {
  @override
  EventType get type => EventType.GroupEntranceAnnouncementChangeEvent;

  @override
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

class GroupMuteAllEvent extends EventBase with GroupStatusChangeEventMixin<bool> {
  @override
  EventType get type => EventType.GroupMuteAllEvent;

  @override
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
    with GroupStatusChangeEventMixin<bool> {
  @override
  EventType get type => EventType.GroupAllowAnonymousChatEvent;

  @override
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
    with GroupStatusChangeEventMixin<bool> {
  @override
  EventType get type => EventType.GroupAllowConfessTalkEvent;

  late bool isByBot;

  @override
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
    with GroupStatusChangeEventMixin<bool> {
  @override
  EventType get type => EventType.GroupAllowMemberInviteEvent;

  @override
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

class MemberJoinEvent extends EventBase with JoinEventMixin {
  @override
  EventType get type => EventType.MemberJoinEvent;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'member': member.toJson(),
      'invitor': invitor?.toJson(),
    };
  }
}

class MemberLeaveEventKick extends EventBase with LeaveEventMixin {
  @override
  EventType get type => EventType.MemberLeaveEventKick;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'member': member.toJson(),
      'kicker': operator?.toJson(),
    };
  }
}

class MemberLeaveEventQuit extends EventBase with LeaveEventMixin {
  @override
  EventType get type => EventType.MemberLeaveEventQuit;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'member': member.toJson(),
    };
  }
}

class MemberCardChangeEvent extends EventBase
    with GroupStatusChangeEventMixin<String> {
  @override
  EventType get type => EventType.MemberCardChangeEvent;

  @override
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
    with GroupStatusChangeEventMixin<String> {
  @override
  EventType get type => EventType.MemberSpecialTitleChangeEvent;

  @override
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
    with GroupStatusChangeEventMixin<Permission> {
  @override
  EventType get type => EventType.MemberPermissionChangeEvent;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'member': member.toJson(),
      'origin': origin.toBriefString(),
      'current': current.toBriefString(),
    };
  }
}

class MemberMuteEvent extends EventBase with MuteEventMixin {
  @override
  EventType get type => EventType.MemberMuteEvent;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'member': member.toJson(),
      'operator': operator?.toJson(),
      'durationTime': durationTime,
    };
  }
}

class MemberUnmuteEvent extends EventBase with MuteEventMixin {
  @override
  EventType get type => EventType.MemberUnmuteEvent;

  @override
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

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'member': member.toJson(),
      'action': action,
      'honor': honor,
    };
  }
}

class NewFriendRequestEvent extends EventBase with RequestEventMixin {
  @override
  EventType get type => EventType.NewFriendRequestEvent;

  @override
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

class MemberJoinRequestEvent extends EventBase with RequestEventMixin {
  @override
  EventType get type => EventType.MemberJoinRequestEvent;

  @override
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

class BotInvitedJoinGroupRequestEvent extends EventBase with RequestEventMixin {
  @override
  EventType get type => EventType.BotInvitedJoinGroupRequestEvent;

  @override
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

class OtherClientOnlineEvent extends EventBase with OtherClientEventMixin {
  @override
  EventType get type => EventType.OtherClientOnlineEvent;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'client': client,
      'kind': kind,
    };
  }
}


class OtherClientOfflineEvent extends EventBase with OtherClientEventMixin {
  @override
  EventType get type => EventType.OtherClientOfflineEvent;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toBriefString(),
      'client': client,
    };
  }
}