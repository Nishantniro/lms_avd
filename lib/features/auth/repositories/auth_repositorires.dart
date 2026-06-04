import 'package:dartz/dartz.dart';
import 'package:lms_adv/core/services/api_services.dart';
import 'package:lms_adv/core/typedef/either.dart';

abstract class AuthRepositorires {
  FutureEither<String> login({required String email, required String password});
}

class AuthRepositoryImpl implements AuthRepositorires {
  final ApiServices apiservices;

  AuthRepositoryImpl({required this.apiservices});
  @override
  FutureEither<String> login({
    required String email,
    required String password,
  }) async {
    final result = await apiservices.post(
      "/auth/login/",
      data: {"email": email, "password": password},
    );
    return result.fold((l) => left(l), (json) {
      return right("login successful ");
    });
  }
}
