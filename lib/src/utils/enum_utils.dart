extension EnumUtils on Enum {
  String? toBriefString(){
    return toString().split('.').last;
  }
}