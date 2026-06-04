part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const LoginState._();
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;

  const factory LoginState.loaded(String msg) = _Loaded;

  const factory LoginState.failure(Failure failure) = _Failure;

  bool get isLoading => maybeWhen(loading: () => true, orElse: () => false);
}
