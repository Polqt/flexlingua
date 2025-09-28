class Validators {
  static bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    return password.length >= 8;
  }

  static bool doPasswordsMatch(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  
}