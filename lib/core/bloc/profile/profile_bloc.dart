import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lms_adv/core/error/falilure.dart';
import 'package:lms_adv/core/models/profile_model.dart';
import 'package:lms_adv/features/home/repositories/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;

  ProfileBloc({required this.profileRepository})
    : super(ProfileState.initial()) {
    on<_Profile>(_onProfileEvent);
  }

  void _onProfileEvent(_Profile event, Emitter<ProfileState> emit) async {
    emit(ProfileState.loading());
    final result = await profileRepository.profile();
    result.fold(
      (l) => emit(ProfileState.failure(l)),
      (r) => emit(ProfileState.loaded(r)),
    );
  }
}
