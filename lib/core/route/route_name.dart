class RouteName {
  static const String home = "home";
  static const String login = "login";
}

extension Path on String {
  String get path => "/$this";
}
