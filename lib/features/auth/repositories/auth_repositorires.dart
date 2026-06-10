
import 'package:dartz/dartz.dart';
import 'package:lms_adv/core/models/token_model.dart';
import 'package:lms_adv/core/services/api_services.dart';
import 'package:lms_adv/core/storage/token_storage.dart';
import 'package:lms_adv/core/typedef/either.dart';
import 'package:lms_adv/features/auth/model/signup_model.dart';
import 'package:lms_adv/features/auth/model/verify_email_request.dart';

abstract class AuthRepositorires {
  FutureEither<String> login({required String email, required String password});
  FutureEither<String> signup({required SignupModel signupmodel});
  FutureEither<String> verifyEmail({required VerifyEmailRequestModel verify});
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

  @override
  FutureEither<String> signup({required final SignupModel signupmodel}) async {
    final result = await apiservices.post(
      "/auth/sign-up/",
      data: signupmodel.toMap(),
    );
    return result.fold((l) => left(l), (r) {
      return Right(r['detail']?.toString() ?? 'successful');
    });
  }

  @override
  FutureEither<String> verifyEmail({
    required VerifyEmailRequestModel verify,
  }) async {
    final response = await apiservices.post(
      "/auth/verify-email/",
      data: verify.toMap(),
    );
    return response.fold((l) => Left(l), (r) async {
      await _storageService.saveTokens(TokenModel.fromMap(r['token']));
      return Right("Signup sucessful");
    });
  }
}
