part of 'verify_email_bloc.dart';

@freezed
abstract class VerifyEmailEvent with _$VerifyEmailEvent {
  const factory VerifyEmailEvent.verifyemail({
    required VerifyEmailRequestModel verifyEmailRequestModel,
  }) = _VerifyEmail;
}
