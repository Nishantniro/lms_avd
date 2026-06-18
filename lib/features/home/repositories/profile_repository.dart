import 'package:dartz/dartz.dart';
import 'package:lms_adv/core/models/profile_model.dart';
import 'package:lms_adv/core/services/api_services.dart';
import 'package:lms_adv/core/typedef/either.dart';

abstract class ProfileRepository {
  FutureEither<ProfileModel> profile();
}

class ProfileRepositoryImpl implements ProfileRepository {
  final ApiServices apiServices;
  ProfileModel? _cachedProfilemodel;

  ProfileRepositoryImpl({required this.apiServices});
  @override
  FutureEither<ProfileModel> profile() async {
    if (_cachedProfilemodel != null) {
      return Right(_cachedProfilemodel!);
    }

   return await apiServices.get(
      "/profile/me/",
      fromJson: (map) {
        _cachedProfilemodel = ProfileModel.fromMap(map);
        return _cachedProfilemodel!;
      },
    );

  }
}
