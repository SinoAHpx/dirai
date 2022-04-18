import 'package:dirai/src/model/data/shared.dart';

class BotEventMixin {
  late int qq;
}

class FriendEventMixin {
  late Friend friend;
}

class RecallEventMixin {
  late int authorId;

  late int messageId;

  late int time;
}


class GroupStatusChangeEventMixin<T> {
  late T origin;

  late T current;

  late Group group;

  late Operator operator;

  late Member member;
}

class MuteEventMixin {
  late int durationSeconds;

  late Operator? operator;

  late Member member;

  late int durationTime;
}

class JoinEventMixin {
  late Group group;

  late Member? invitor;

  late Member member;
}

class LeaveEventMixin {
  late Group group;

  late Operator? operator;

  late Member member;
}

class RequestEventMixin {
  late int eventId;

  late int fromId;

  late int groupId;

  late String nick;

  late String message;
}

class OtherClientEventMixin {
  late OtherClient client;

  late int kind;
}