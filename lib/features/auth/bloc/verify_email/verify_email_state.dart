part of 'verify_email_bloc.dart';

@freezed
class VerifyEmailState with _$VerifyEmailState {
    const VerifyEmailState._();

  const factory VerifyEmailState.initial() = _Initial;
  const factory VerifyEmailState.loading() = _Loading;
  const factory VerifyEmailState.loaded() = _Loaded;
  const factory VerifyEmailState.failure(Failure failure) = _Failure;
    bool get isLoading => maybeWhen(loading: () => true, orElse: () => false);


}
