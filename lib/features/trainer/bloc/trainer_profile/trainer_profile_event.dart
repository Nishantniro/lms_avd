part of 'trainer_profile_bloc.dart';

@freezed
class TrainerProfileEvent with _$TrainerProfileEvent {
  const factory TrainerProfileEvent.profile() = _Profile;
}