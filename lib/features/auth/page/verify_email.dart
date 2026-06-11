import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_adv/core/extension/context_extension.dart';
import 'package:lms_adv/core/route/route_name.dart';
import 'package:lms_adv/core/utils/snackbar_utils.dart';
import 'package:lms_adv/core/widgets/app_text.dart';
import 'package:lms_adv/features/auth/bloc/verify_email/verify_email_bloc.dart';
import 'package:lms_adv/features/auth/model/verify_email_request.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key, required this.email});
  final String email;

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final PinInputController otpController = PinInputController();
  Timer? timer;
  int seconds = 60;
  bool canResend = false;

  @override
  void dispose() {
    timer?.cancel();
    otpController.dispose();
    super.dispose();
  }

  void startTimer() {
    seconds = 60;
    canResend = false;
    timer?.cancel();

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        setState(() {
          canResend = true;
        });
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: .start,
          children: [
            AppText(
              "Verify your email",
              type: AppTextType.heading,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
            Gap(20),
            AppText(
              "Enter your otp sent on ${widget.email}",

              type: AppTextType.caption,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.primary,
            ),
            Gap(10),
            BlocConsumer<VerifyEmailBloc, VerifyEmailState>(
              listener: (context, state) {
                state.whenOrNull(
                  loading: () {
                    context.showDialogBox();
                  },

                  loaded: () {
                    context.goNamed(RouteName.home);
                    AppSnackBar.success(context, message: "email Verified");
                  },
                  failure: (failure) {
                    AppSnackBar.success(context, message: failure.toString());
                  },
                );
              },
              builder: (context, state) {
                return MaterialPinField(
                  pinController: otpController,
                  length: 6,

                  onClipboardFound: (value) {
                    if (value.length == 6) {
                      otpController.setText(value);
                    }
                  },
                  onCompleted: (pin) => context.read<VerifyEmailBloc>().add(
                    VerifyEmailEvent.verifyemail(
                      verifyEmailRequestModel: VerifyEmailRequestModel(
                        email: widget.email,
                        otp: pin,
                      ),
                    ),
                  ),
                  theme: MaterialPinTheme(
                    shape: MaterialPinShape.outlined,
                    cellSize: Size(45, 45),
                    borderRadius: BorderRadius.circular(12),
                  ),
                );
              },
            ),
            AppText("Didn't recceived code ?"),
            canResend
                ? TextButton(
                    onPressed: () {
                      context.read<VerifyEmailBloc>().add(
                        VerifyEmailEvent.resendOtp(email: widget.email),
                      );
                    },
                    child: AppText("resend otp"),
                  )
                : AppText("Resend in ${seconds}s"),
          ],
        ),
      ),
    );
  }
}
