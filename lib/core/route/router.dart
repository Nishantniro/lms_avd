import 'package:go_router/go_router.dart';
import 'package:lms_adv/core/models/profile_model.dart';
import 'package:lms_adv/core/pages/splash_screen.dart';
import 'package:lms_adv/core/route/route_name.dart';
import 'package:lms_adv/features/auth/page/login_page.dart';
import 'package:lms_adv/features/auth/page/signup_page.dart';
import 'package:lms_adv/features/auth/page/verify_email.dart';
import 'package:lms_adv/features/course/pages/course_page/create_course.dart';
import 'package:lms_adv/features/home/pages/home_page.dart';
import 'package:lms_adv/features/home/pages/profile_edit_page.dart';
import 'package:lms_adv/features/trainer/pages/apply_trainer.dart';
import 'package:lms_adv/features/trainer/pages/trainer_profile.dart';

class AppRoute {
  static final GoRouter router = GoRouter(
    initialLocation: RouteName.splash.path,

    routes: [
      GoRoute(
        path: RouteName.splash.path,
        name: RouteName.splash,
        builder: (context, state) {
          return SplashScreen();
        },
      ),
      GoRoute(
        path: RouteName.home.path,
        name: RouteName.home,
        builder: (context, state) {
          return Homepage();
        },
      ),
      GoRoute(
        path: RouteName.login.path,
        name: RouteName.login,
        builder: (context, state) {
          return LoginPage();
        },
      ),
      GoRoute(
        path: RouteName.verifyemail.path,
        name: RouteName.verifyemail,
        builder: (context, state) {
          final email = state.extra;
          return VerifyEmail(email: email.toString());
        },
      ),
      GoRoute(
        path: RouteName.signup.path,
        name: RouteName.signup,
        builder: (context, state) {
          return SignupPage();
        },
      ),
      GoRoute(
        path: RouteName.applyTrainer.path,
        name: RouteName.applyTrainer,
        builder: (context, state) {
          return ApplyTrainer();
        },
      ),
      GoRoute(
        path: RouteName.trainerProfile.path,
        name: RouteName.trainerProfile,
        builder: (context, state) {
          return TrainerProfile();
        },
      ),
      GoRoute(
        path: RouteName.createCourse.path,
        name: RouteName.createCourse,
        builder: (context, state) {
          return CreateCourseFormPage();
        },
      ),
      GoRoute(
        path: RouteName.editProfile.path,
        name: RouteName.editProfile,
        builder: (context, state) {
          final user = state.extra as ProfileModel;
          return ProfileEditPage(user: user);
        },
      ),
    ],
  );
}

void logout() {
  AppRoute.router.goNamed(RouteName.login);
}
