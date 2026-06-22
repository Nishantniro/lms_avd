import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_adv/core/bloc/exports.dart';
import 'package:lms_adv/core/route/route_name.dart';
import 'package:lms_adv/core/utils/snackbar_utils.dart';
import 'package:lms_adv/core/widgets/app_button.dart';
import 'package:lms_adv/core/widgets/app_text.dart';
import 'package:lms_adv/core/widgets/custom_text_form.dart';
import 'package:lms_adv/features/trainer/bloc/trainer_apply/trainer_apply_bloc.dart';
import 'package:lms_adv/features/trainer/model/apply_trainer_model.dart';

class ApplyTrainer extends StatefulWidget {
  const ApplyTrainer({super.key});

  @override
  State<ApplyTrainer> createState() => _ApplyTrainerState();
}

class _ApplyTrainerState extends State<ApplyTrainer> {
  final TextEditingController _bio = TextEditingController();
  final TextEditingController _expertise = TextEditingController();
  final TextEditingController _experienceYears = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _bio.dispose();
    _experienceYears.dispose();
    _expertise.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: .start,
              spacing: 6,
              children: [
                AppText("Bio", type: AppTextType.heading),
                CustomTextForm(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "cannot be empty";
                    }
                    return null;
                  },
                  controller: _bio,
                  prefixIcon: Icon(Icons.library_books_sharp),
                ),
                SizedBox(),
                AppText("Expertise", type: AppTextType.heading),
                CustomTextForm(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "cannot be empty";
                    }
                    return null;
                  },
                  controller: _expertise,
                  prefixIcon: Icon(Icons.lightbulb),
                ),
                SizedBox(),
                AppText("ExperienceYears", type: AppTextType.heading),
                CustomTextForm(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "cannot be empty";
                    }
                    return null;
                  },
                  controller: _experienceYears,
                  prefixIcon: Icon(Icons.calendar_month),
                ),
                SizedBox(),
                BlocConsumer<TrainerApplyBloc, TrainerApplyState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      loaded: (msg) {
                        context.goNamed(RouteName.home);
                        AppSnackBar.success(context, message: msg);
                      },
                      failure: (msg) {
                        AppSnackBar.error(context, message: msg.toString());
                      },
                    );
                  },
                  builder: (context, state) {
                    return AppButton(
                      text: "Apply",
                      onPressed: () {
                        if (_formkey.currentState?.validate() == false) {
                          return;
                        }
                        int experienceYears = int.parse(_experienceYears.text);
                        final form = ApplyTrainerModel(
                          bio: _bio.text,
                          expertise: _expertise.text,
                          experienceYears: experienceYears,
                        );
                        context.read<TrainerApplyBloc>().add(
                          TrainerApplyEvent.apply(apply: form),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
