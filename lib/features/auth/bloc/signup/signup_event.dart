part of 'signup_bloc.dart';

@freezed
abstract class SignupEvent with _$SignupEvent {
  const factory SignupEvent.signup({
  required SignupModel signupmodel,
  }) = _Signup;
}