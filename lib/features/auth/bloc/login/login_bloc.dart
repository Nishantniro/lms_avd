import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lms_adv/core/error/falilure.dart';
import 'package:lms_adv/features/auth/repositories/auth_repositorires.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepositorires authRepositorires;
  LoginBloc({required this.authRepositorires}) : super(LoginState.initial()) {
    on<_Login>(_onLoginEvent);
  }

  Future<void> _onLoginEvent(_Login event, Emitter<LoginState> emit) async {
    emit(LoginState.loading());

    final result = await authRepositorires.login(
      email: event.email,
      password: event.password,
    );
    result.fold(
      (l) => emit(LoginState.failure(l)),
      (r) => emit(LoginState.loaded(r)),
    );
  }
}
