class RouteName {
  static const String home = "home";
  static const String verifyemail = "verifyemail";
  static const String login = "login";
  static const String splash = "splash";
  static const String signup = "signup";
}

extension Path on String {
  String get path => "/$this";
}
