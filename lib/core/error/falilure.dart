sealed class Failure {}

class InternetFailure extends Failure {
  @override
  String toString() {
    return "no internet connection";
  }
}

class SomethingWentWrongFailure implements Failure {
  @override
  String toString() {
    return "something went wrong";
  }
}
