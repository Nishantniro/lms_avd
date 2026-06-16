import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lms_adv/core/error/falilure.dart';

part 'base.freezed.dart';

@freezed
class BaseState<T> with _$BaseState {
  const BaseState._();
  const factory BaseState.initial() = _Initial;
  const factory BaseState.loading() = _Loading;

  const factory BaseState.loaded(T data) = _Loaded;

  const factory BaseState.failure(Failure failure) = _Failure;

  bool get isLoading => maybeWhen(loading: () => true, orElse: () => false);
}
