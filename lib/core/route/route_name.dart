class RouteName {
  static const String home = "home";
}

extension Path on String{
  String get path =>"/$this";
}
