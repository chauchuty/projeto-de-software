class ValidateCustom {
  static bool isUser(String user) {
    var regex = r"(\w){5,}";
    return RegExp(regex).hasMatch(user);
  }

  static bool isPass(String user) {
    var regex = r"(\w){6,}";
    return RegExp(regex).hasMatch(user);
  }
  // bool isPass() {}
}
