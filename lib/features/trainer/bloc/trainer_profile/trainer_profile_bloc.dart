import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lms_adv/core/bloc/exports.dart';
import 'package:lms_adv/features/trainer/model/trainer_profile_model.dart';
import 'package:lms_adv/features/trainer/repositories/trainer_repository.dart';

part 'trainer_profile_event.dart';
part 'trainer_profile_state.dart';
part 'trainer_profile_bloc.freezed.dart';

class TrainerProfileBloc
    extends Bloc<TrainerProfileEvent, TrainerProfileState> {
  final TrainerRepository repo;

  TrainerProfileBloc({required this.repo})
    : super(TrainerProfileState.initial()) {
    on<_Profile>(_trainerProfile);
  }
  void _trainerProfile(
    _Profile event,
    Emitter<TrainerProfileState> emit,
  ) async {
    emit(TrainerProfileState.loading());
    final result = await repo.trainerProfile();
    return result.fold(
      (l) => emit(TrainerProfileState.failure(l)),
      (r) => emit(TrainerProfileState.loaded(r)),
    );
  }
}
