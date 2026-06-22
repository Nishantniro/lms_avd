import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_adv/core/bloc/profile/profile_bloc.dart';
import 'package:lms_adv/core/di/di_init.dart';
import 'package:lms_adv/core/route/route_name.dart';
import 'package:lms_adv/core/route/router.dart';
import 'package:lms_adv/core/storage/token_storage.dart';
import 'package:lms_adv/core/widgets/app_button.dart';
import 'package:lms_adv/core/widgets/app_text.dart';
import 'package:lms_adv/core/bloc/exports.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<ProfileBloc>().add(ProfileEvent.profile());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return Center(
                        child: LoadingAnimationWidget.newtonCradle(
                          color: Colors.black,
                          size: 40,
                        ),
                      );
                    },

                    loaded: (profile) {
                      return SingleChildScrollView(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              child: Icon(Icons.person, size: 50),
                            ),
                            Gap(10),
                            AppText(profile.name, type: AppTextType.body),
                            Gap(4),
                            AppText(
                              "@${profile.username}",
                              type: AppTextType.caption,
                            ),
                            Gap(4),

                            AppButton(
                              backgroundColor: const Color.fromARGB(
                                255,
                                60,
                                1,
                                70,
                              ),

                              text: profile.hastrainerprofile
                                  ? "Trainer profile"
                                  : "Apply",
                              onPressed: () {
                                context.pushNamed(
                                  profile.hastrainerprofile
                                      ? RouteName.trainerProfile
                                      : RouteName.applyTrainer,
                                );
                              },
                            ),
                            Gap(10),
                            AppButton(
                              icon: Icons.logout,
                              type: ButtonType.filled,
                              text: "Logout",
                              //icon: Icons.logout_rounded,
                              backgroundColor: const Color.fromARGB(
                                255,
                                60,
                                1,
                                70,
                              ),
                              onPressed: () async {
                                await sl<TokenStorageService>().clear();
                                logout();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    failure: (failure) {
                      return Center(child: AppText(failure.message));
                    },
                    loading: () {
                      return Center(
                        child: LoadingAnimationWidget.newtonCradle(
                          color: Colors.black,
                          size: 40,
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(title: Text("welcome home")),
      body: Center(
        child: LoadingAnimationWidget.flickr(
          leftDotColor: Colors.red,
          rightDotColor: Colors.cyanAccent,
          size: 60,
        ),
      ),
    );
  }
}
