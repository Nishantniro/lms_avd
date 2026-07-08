part of 'update_profile_bloc.dart';

@freezed
abstract class UpdateProfileEvent with _$UpdateProfileEvent {
  const factory UpdateProfileEvent.update(ProfileModelPatch profileModel) = _Update;
}