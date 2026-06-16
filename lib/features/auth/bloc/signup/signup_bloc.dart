import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lms_adv/features/auth/model/signup_model.dart';
import 'package:lms_adv/features/auth/repositories/auth_repositorires.dart';
import 'package:lms_adv/core/bloc/exports.dart';


part 'signup_event.dart';
part 'signup_state.dart';
part 'signup_bloc.freezed.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepositorires authRepositorires;

  SignupBloc({required this.authRepositorires}) : super(SignupState.initial()) {
    on<_Signup>(_onSignupEvent);
  }
  Future<void> _onSignupEvent(_Signup event, Emitter<SignupState> emit) async {
    emit(SignupState.loading());

    final result = await authRepositorires.signup(
      signupmodel: event.signupmodel,
    );
    result.fold(
      (l) => emit(SignupState.failure(l)),
      (r) => emit(SignupState.loaded(r)),
    );
  }
}
