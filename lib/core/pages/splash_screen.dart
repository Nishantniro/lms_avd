import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_adv/core/bloc/gatekeeper/gatekeeper_cubit.dart';
import 'package:lms_adv/core/route/route_name.dart';
import 'package:lms_adv/core/theme/colour_pallet.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    context.read<GatekeeperCubit>().getStatus();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<GatekeeperCubit, GatekeeperState>(
        listener: (context, state) {
          state.whenOrNull(
            authenticated: () => context.goNamed(RouteName.home),
            unauthenticated: () => context.goNamed(RouteName.login),
          );
        },
        child: LoadingAnimationWidget.hexagonDots(
          color: ColorPallet.primary,
          size: 35,
        ),
      ),
    );
  }
}
