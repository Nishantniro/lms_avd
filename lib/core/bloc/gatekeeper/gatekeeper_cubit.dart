import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lms_adv/core/storage/token_storage.dart';

part 'gatekeeper_state.dart';
part 'gatekeeper_cubit.freezed.dart';

class GatekeeperCubit extends Cubit<GatekeeperState> {
  final TokenStorageService _tokenStorageService;
  GatekeeperCubit({required this._tokenStorageService})
    : super(GatekeeperState.initial());

  Future<void> getStatus() async {
    try {
      final token = await _tokenStorageService.getAccessToken();
      if (token != null) {
        emit(GatekeeperState.authenticated());
      } else {
        emit(GatekeeperState.unauthenticated());
      }
    } catch (e) {
      emit(GatekeeperState.authenticated());
    }
  }
}
