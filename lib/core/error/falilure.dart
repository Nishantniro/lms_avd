sealed class Failure {
  const Failure();

  String get message;

  @override
  String toString() => message;
}

class InternetFailure extends Failure {
  const InternetFailure();

  @override
  String get message => "No internet connection";
}

class BadRequestFailure extends Failure {
  final String error;

  const BadRequestFailure(this.error);

  @override
  String get message => error;
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure();

  @override
  String get message => "Authentication credentials were not provided";
}

class ForbiddenFailure extends Failure {
  const ForbiddenFailure();

  @override
  String get message => "You do not have permission";
}

class NotFoundFailure extends Failure {
  const NotFoundFailure();

  @override
  String get message => "Resource not found";
}

class MethodNotAllowedFailure extends Failure {
  const MethodNotAllowedFailure();

  @override
  String get message => "Method not allowed";
}

class ValidationFailure extends Failure {
  final String error;

  const ValidationFailure(this.error);

  @override
  String get message => error;
}

class ConflictFailure extends Failure {
  const ConflictFailure();

  @override
  String get message => "Conflict occurred";
}

class ServerFailure extends Failure {
  final String error;

  const ServerFailure(this.error, {required String message});

  @override
  String get message => error;
}

class TimeoutFailure extends Failure {
  const TimeoutFailure({required String message});

  @override
  String get message => "Request timeout";
}

class SomethingWentWrongFailure extends Failure {
  const SomethingWentWrongFailure();

  @override
  String get message => "Something went wrong";
}


