import 'package:dartz/dartz.dart';
import 'package:lms_adv/core/models/profile_model.dart';
import 'package:lms_adv/core/models/profile_model_patch.dart';
import 'package:lms_adv/core/services/api_services.dart';
import 'package:lms_adv/core/typedef/either.dart';

abstract class ProfileRepository {
  FutureEither<ProfileModel> profile();
  FutureEither<String> updateProfile(ProfileModelPatch form);
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

  @override
  FutureEither<String> updateProfile(ProfileModelPatch form) async {
    return await apiServices.patch(
      "/profile/me/",
      data: await form.toFormDataMap(),
      fromJson: (json) {
        return "profile successfully updated";
      },
    );
  }
}
