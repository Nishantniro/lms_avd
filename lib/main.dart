import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_adv/core/bloc/gatekeeper/gatekeeper_cubit.dart';
import 'package:lms_adv/core/bloc/profile/profile_bloc.dart';
import 'package:lms_adv/core/di/di_init.dart';
import 'package:lms_adv/core/route/router.dart';
import 'package:lms_adv/core/theme/theme_mode.dart';
import 'package:lms_adv/features/auth/bloc/login/login_bloc.dart';
import 'package:lms_adv/features/auth/bloc/signup/signup_bloc.dart';
import 'package:lms_adv/features/auth/bloc/verify_email/verify_email_bloc.dart';
import 'package:lms_adv/features/trainer/bloc/trainer_apply/trainer_apply_bloc.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<LoginBloc>()),
        BlocProvider(create: (context) => sl<ProfileBloc>()),
        BlocProvider(create: (context) => sl<GatekeeperCubit>()),
        BlocProvider(create: (context) => sl<SignupBloc>()),
        BlocProvider(create: (context) => sl<VerifyEmailBloc>()),
        BlocProvider(create: (context) => sl<TrainerApplyBloc>()),
      ],
      child: MaterialApp.router(
        title: 'LMS Advance',
        debugShowCheckedModeBanner: false,
        theme: AppThemeMode.lightTheme(context),
        darkTheme: AppThemeMode.darkTheme(context),
        themeMode: ThemeMode.system,
        routerConfig: AppRoute.router,
      ),
    );
  }
}
