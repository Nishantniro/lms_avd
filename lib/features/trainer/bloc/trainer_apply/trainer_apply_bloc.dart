import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lms_adv/core/bloc/exports.dart';
import 'package:lms_adv/features/trainer/model/apply_trainer_model.dart';

import 'package:lms_adv/features/trainer/repositories/trainer_repository.dart';

part 'trainer_apply_event.dart';
part 'trainer_apply_state.dart';
part 'trainer_apply_bloc.freezed.dart';

class TrainerApplyBloc extends Bloc<TrainerApplyEvent, TrainerApplyState> {
  final TrainerRepository trainerRepository;
  TrainerApplyBloc({required this.trainerRepository})
    : super(TrainerApplyState.initial()) {
    on<_ApplyTrainer>(_onApply);
  }
  Future<void> _onApply(
    _ApplyTrainer event,
    Emitter<TrainerApplyState> emit,
  ) async {
    emit(TrainerApplyState.initial());
    final result = await trainerRepository.applyTrainer(
      applyModel: event.apply,
    );
    result.fold(
      (l) => emit(TrainerApplyState.failure(l)),
      (r) => emit(TrainerApplyState.loaded(r)),
    );
  }
}
