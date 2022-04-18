class Friend {
  late int id;

  late String nickname;

  late String remark;

  Map<String, dynamic> toJson() => {
    'id': id,
    'nickname': nickname,
    'remark': remark,
  };
}

class Group {
  late int id;

  late String name;

  late Permission permission;

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'permission': permission,
  };
}

class Operator{
  late int id;

  late String memberName;

  late String specialTitle;

  late int joinTimeStamp;

  late int lastSpeakTimeStamp;

  late int muteTimeRemaining;

  late Group group;

  Map<String, dynamic> toJson() => {
    'id': id,
    'memberName': memberName,
    'specialTitle': specialTitle,
    'joinTimeStamp': joinTimeStamp,
    'lastSpeakTimeStamp': lastSpeakTimeStamp,
    'muteTimeRemaining': muteTimeRemaining,
    'group': group,
  };
}

class Member {
  late int id;

  late String memberName;

  late Permission permission;

  late Group group;

  Map<String, dynamic> toJson() => {
    'id': id,
    'memberName': memberName,
    'permission': permission,
    'group': group,
  };
}

class OtherClient {
  late int id;

  late String platform;
}

enum Permission {
  ADMINISTRATOR,
  OWNER,
  MEMBER
}