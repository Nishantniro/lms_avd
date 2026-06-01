sealed class Falilure {}

class InternetFailure extends Falilure {
  @override
  String toString() {
    return "no internet connection";
  }
}

class SomethingWentWrongFailure implements Falilure {
  @override
  String toString() {
    return "something went wrong";
  }
}
