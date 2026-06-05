import 'package:dartz/dartz.dart';
import 'package:lms_adv/core/models/token_model.dart';
import 'package:lms_adv/core/services/api_services.dart';
import 'package:lms_adv/core/storage/token_storage.dart';
import 'package:lms_adv/core/typedef/either.dart';

abstract class AuthRepositorires {
  FutureEither<String> login({required String email, required String password});
}

class AuthRepositoryImpl implements AuthRepositorires {
  final ApiServices apiservices;
  final TokenStorageService _storageService;

  AuthRepositoryImpl({
    required this.apiservices,
    required this._storageService,
  });
  @override
  FutureEither<String> login({
    required String email,
    required String password,
  }) async {
    final result = await apiservices.post(
      "/auth/login/",
      data: {"email": email, "password": password},
    );
    return result.fold((l) => left(l), (json) async {
      await _storageService.saveTokens(TokenModel.fromMap(json['token']));
      return right("login successful ");
    });
  }
}
