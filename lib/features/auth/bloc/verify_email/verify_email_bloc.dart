import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lms_adv/core/error/falilure.dart';
import 'package:lms_adv/features/auth/model/verify_email_request.dart';
import 'package:lms_adv/features/auth/repositories/auth_repositorires.dart';

part 'verify_email_event.dart';
part 'verify_email_state.dart';
part 'verify_email_bloc.freezed.dart';

class VerifyEmailBloc extends Bloc<VerifyEmailEvent, VerifyEmailState> {
  final AuthRepositorires authRepositorires;

  VerifyEmailBloc({required this.authRepositorires})
    : super((VerifyEmailState.initial())) {
    on<_VerifyEmail>(_onVerifyEmail);
    on<_ResendOtp>(_onResendOtp);
  }
  Future<void> _onVerifyEmail(
    _VerifyEmail event,
    Emitter<_$VerifyEmailState> emit,
  ) async {
    emit(VerifyEmailState.loading());
    final data = await authRepositorires.verifyEmail(
      verify: event.verifyEmailRequestModel,
    );
    return data.fold(
      (l) => emit(VerifyEmailState.failure(l)),
      (r) => emit(VerifyEmailState.loaded()),
    );
  }

  Future<void> _onResendOtp(
    _ResendOtp event,
    Emitter<_$VerifyEmailState> emit,
  ) async {
    emit(VerifyEmailState.loading());
    final data = await authRepositorires.resendOtp(email: event.email);
    return data.fold(
      (l) => emit(VerifyEmailState.failure(l)),
      (r) => emit(VerifyEmailState.loaded()),
    );
  }
}
