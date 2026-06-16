part of 'signup_bloc.dart';

// @freezed
// class SignupState with _$SignupState {
//   const SignupState._();
//   const factory SignupState.initial() = _Initial;
//   const factory SignupState.loading() = _Loading;
//   const factory SignupState.loaded(String msg) = _Loaded;
//   const factory SignupState.failure(Failure failure) = _Failure;

//   bool get isLoading => maybeWhen(loading: () => true, orElse: () => false);
// }

typedef SignupState = BaseState<String>;
