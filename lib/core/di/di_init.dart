import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:lms_adv/core/bloc/gatekeeper/gatekeeper_cubit.dart';
import 'package:lms_adv/core/bloc/profile/profile_bloc.dart';
import 'package:lms_adv/core/network/dio_client.dart';
import 'package:lms_adv/core/services/api_services.dart';
import 'package:lms_adv/core/storage/token_storage.dart';
import 'package:lms_adv/features/auth/bloc/login/login_bloc.dart';
import 'package:lms_adv/features/auth/bloc/signup/signup_bloc.dart';
import 'package:lms_adv/features/auth/bloc/verify_email/verify_email_bloc.dart';
import 'package:lms_adv/features/auth/repositories/auth_repositorires.dart';
import 'package:lms_adv/features/home/repositories/profile_repository.dart';
import 'package:lms_adv/features/trainer/bloc/trainer_apply/trainer_apply_bloc.dart';
import 'package:lms_adv/features/trainer/bloc/trainer_profile/trainer_profile_bloc.dart';
import 'package:lms_adv/features/trainer/repositories/trainer_repository.dart';

final sl = GetIt.instance;

void init() {
  // bloc
  sl.registerLazySingleton(() => LoginBloc(authRepositorires: sl()));
  sl.registerLazySingleton(() => SignupBloc(authRepositorires: sl()));
  sl.registerLazySingleton(() => ProfileBloc(profileRepository: sl()));
  sl.registerLazySingleton(() => GatekeeperCubit(tokenStorageService: sl()));
  sl.registerLazySingleton(() => VerifyEmailBloc(authRepositorires: sl()));
  sl.registerLazySingleton(() => TrainerApplyBloc(trainerRepository: sl()));
  sl.registerLazySingleton(() => TrainerProfileBloc(repo: sl()));
  //repo
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(apiServices: sl()),
  );
  sl.registerLazySingleton<AuthRepositorires>(
    () => AuthRepositoryImpl(apiservices: sl(), storageService: sl()),
  );

  sl.registerLazySingleton<TrainerRepository>(
    () => TrainerRepositoryimpl(apiservices: sl()),
  );

  //core

  sl.registerLazySingleton(() => TokenStorageService(sl()));
  sl.registerLazySingleton(() => FlutterSecureStorage());
  sl.registerLazySingleton(() => ApiServices(dio: sl()));
  sl.registerLazySingleton(() => DioClient(authTokenInterceptor: sl()).dio);
  sl.registerLazySingleton(
    () => AuthTokenInterceptor(tokenStorageService: sl()),
  );
}
