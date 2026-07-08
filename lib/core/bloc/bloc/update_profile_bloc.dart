import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lms_adv/core/bloc/base_state/base.dart';
import 'package:lms_adv/core/models/profile_model_patch.dart';
import 'package:lms_adv/features/home/repositories/profile_repository.dart';

part 'update_profile_event.dart';
part 'update_profile_state.dart';
part 'update_profile_bloc.freezed.dart';

class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  final ProfileRepository _repo;
  UpdateProfileBloc({required this._repo})
    : super(UpdateProfileState.initial()) {
    on<_Update>(_onUpdateProfile);
  }
  Future<void> _onUpdateProfile(
    _Update event,
    Emitter<UpdateProfileState> emit,
  ) async {
    emit(UpdateProfileState.loading());
    final result = await _repo.updateProfile(event.profileModel);
    result.fold(
      (l) => emit(BaseState.failure(l)),
      (r) => emit(BaseState.loaded(r)),
    );
  }
}
