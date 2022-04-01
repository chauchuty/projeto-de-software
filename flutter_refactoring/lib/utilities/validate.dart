class ValidateCustom {
  static bool isUser(String data) {
    var regex = r"(\w){5,}";
    return RegExp(regex).hasMatch(data);
  }

  static bool isPass(String data) {
    var regex = r"(\w){6,}";
    return RegExp(regex).hasMatch(data);
  }

  static bool isFullName(String data) {
    var regex = r"^.{1,64}$";
    return RegExp(regex).hasMatch(data);
  }

  static bool isPhone(String data) {
    var regex = r"^\(\d{2}\)\s\d\s\d{4}\s\d{4}$";
    return RegExp(regex).hasMatch(data);
  }

  static bool isEmail(String data) {
    var regex = r"\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b";
    return RegExp(regex).hasMatch(data);
  }
}
