part of 'gatekeeper_cubit.dart';

@freezed
class GatekeeperState with _$GatekeeperState {
  const factory GatekeeperState.initial() = _Initial;
  const factory GatekeeperState.authenticated() = _Authenticated;
  const factory GatekeeperState.unauthenticated() = _Unauthenticated;



}
