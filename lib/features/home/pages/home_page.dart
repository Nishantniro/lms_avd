import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_adv/core/bloc/profile/profile_bloc.dart';
import 'package:lms_adv/core/di/di_init.dart';
import 'package:lms_adv/core/route/route_name.dart';
import 'package:lms_adv/core/route/router.dart';
import 'package:lms_adv/core/storage/token_storage.dart';
import 'package:lms_adv/core/widgets/app_button.dart';
import 'package:lms_adv/core/widgets/app_image.dart';
import 'package:lms_adv/core/widgets/app_text.dart';
import 'package:lms_adv/core/bloc/exports.dart';
import 'package:lms_adv/features/course/bloc/get_course/get_course_bloc.dart';

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
    context.read<GetCourseBloc>().add(GetCourseEvent.getCourse());
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
                            Row(
                              children: [
                                AppImage.circle(imageUrl: profile.avatar),
                                IconButton(
                                  onPressed: () {
                                    context.pushNamed(
                                      RouteName.editProfile,
                                      extra: profile,
                                    );
                                  },
                                  icon: Icon(Icons.edit),
                                ),
                              ],
                            ),
                            // CircleAvatar(
                            //   radius: 40,
                            //   child: Icon(Icons.person, size: 50),
                            // ),
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
                            // AppButton(
                            //   icon: Icons.logout,
                            //   type: ButtonType.filled,
                            //   text: "Logout",
                            //   //icon: Icons.logout_rounded,
                            //   backgroundColor: const Color.fromARGB(
                            //     255,
                            //     60,
                            //     1,
                            //     70,
                            //   ),
                            //   onPressed: () async {
                            //     await sl<TokenStorageService>().clear();
                            //     logout();
                            //   },
                            // ),
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
              AppButton(
                icon: Icons.logout,
                type: ButtonType.filled,
                text: "Logout",
                //icon: Icons.logout_rounded,
                backgroundColor: const Color.fromARGB(255, 60, 1, 70),
                onPressed: () async {
                  await sl<TokenStorageService>().clear();
                  logout();
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(title: Text("welcome home")),
      body: BlocBuilder<GetCourseBloc, GetCourseState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => Center(
              child: LoadingAnimationWidget.flickr(
                leftDotColor: Colors.red,
                rightDotColor: Colors.cyanAccent,
                size: 60,
              ),
            ),
            failure: (failure) => Center(child: AppText(failure.message)),
            loaded: (response) {
              final courses = response.results;
              if (courses.isEmpty) {
                return const Center(child: Text("No courses found"));
              }
              return ListView.separated(
                itemCount: courses.length,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return Card(
                    child: ListTile(
                      leading: course.thumbnail == null
                          ? Icon(Icons.image_not_supported)
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                course.thumbnail!,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                      title: AppText(course.title, type: AppTextType.label),
                      subtitle: Column(
                        crossAxisAlignment: .start,
                        children: [
                          AppText(course.trainerName),
                          AppText(course.difficultyLevel),
                          if (course.priceDetail != null)
                            AppText(
                              "${course.priceDetail!.currency} ${course.priceDetail!.finalAmount}",
                            ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            orElse: () => Center(
              child: LoadingAnimationWidget.flickr(
                leftDotColor: Colors.red,
                rightDotColor: Colors.cyanAccent,
                size: 60,
              ),
            ),
          );
        },
      ),
    );
  }
}
