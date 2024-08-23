class AppValidator {
  static String? validateText(String? text) {
    if (text!.isEmpty) {
      return "This field is required";
    }
    return null;
  }
}
