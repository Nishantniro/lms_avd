import 'package:dartz/dartz.dart';
import 'package:lms_adv/core/models/profile_model.dart';
import 'package:lms_adv/core/services/api_services.dart';
import 'package:lms_adv/core/typedef/either.dart';

abstract class ProfileRepository {
  FutureEither<ProfileModel> profile();
}

class ProfileRepositoryImpl implements ProfileRepository {
  final ApiServices apiServices;

  ProfileRepositoryImpl({required this.apiServices});
  @override
  FutureEither<ProfileModel> profile() async {
    final response = await apiServices.get("/profile/me/");
    return response.fold((l) => left(l), (json) {
      return Right(ProfileModel.fromMap(json));
    });
  }
}
