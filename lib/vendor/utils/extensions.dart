extension StringExtension on String {
  bool isNumeric() {
    return double.tryParse(this) != null;
  }
}

extension RegexExt on String {
  bool validateEmail() => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(this);
}
