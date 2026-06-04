import 'package:get_it/get_it.dart';
import 'package:lms_adv/core/network/dio_client.dart';
import 'package:lms_adv/core/services/api_services.dart';
import 'package:lms_adv/features/auth/bloc/login/login_bloc.dart';
import 'package:lms_adv/features/auth/repositories/auth_repositorires.dart';

final sl = GetIt.instance;

void init() {
  // bloc
  sl.registerLazySingleton(() => LoginBloc(authRepositorires: sl()));
  //repo

  sl.registerLazySingleton<AuthRepositorires>(
    () => AuthRepositoryImpl(apiservices: sl()),
  );

  //core

  sl.registerLazySingleton(() => ApiServices(dio: sl()));
  sl.registerLazySingleton(() => DioClient().dio);
}
