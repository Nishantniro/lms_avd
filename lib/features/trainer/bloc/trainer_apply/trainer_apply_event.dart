part of 'trainer_apply_bloc.dart';

@freezed
abstract class TrainerApplyEvent with _$TrainerApplyEvent {
  const factory TrainerApplyEvent.apply({
    required ApplyTrainerModel apply
    }) = _ApplyTrainer;
}
