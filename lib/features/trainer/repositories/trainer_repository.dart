// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:lms_adv/core/services/api_services.dart';
import 'package:lms_adv/core/typedef/either.dart';
import 'package:lms_adv/features/trainer/model/apply_trainer_model.dart';
import 'package:lms_adv/features/trainer/model/trainer_profile_model.dart';

abstract class TrainerRepository {
  FutureEither<String> applyTrainer({required ApplyTrainerModel applyModel});
  FutureEither<TrainerProfileModel> trainerProfile();
}

class TrainerRepositoryimpl implements TrainerRepository {
  final ApiServices _apiservices;
  TrainerProfileModel? _cachedProfilemodel;

  TrainerRepositoryimpl({required this._apiservices});

  @override
  FutureEither<String> applyTrainer({
    required ApplyTrainerModel applyModel,
  }) async {
    return await _apiservices.post(
      "/trainer/apply/",
      data: applyModel.toMap(),
      fromJson: (json) {
        return "Applied Successful";
      },
    );
  }

  @override
  FutureEither<TrainerProfileModel> trainerProfile() async {
    if (_cachedProfilemodel != null) {
      return Right(_cachedProfilemodel!);
    }
    return await _apiservices.get(
      "/trainer/me",
      fromJson: (map) {
        _cachedProfilemodel = TrainerProfileModel.fromMap(map);
        return _cachedProfilemodel!;
      },
    );
  }
}
