import 'package:go_router/go_router.dart';
import 'package:lms_adv/core/pages/splash_screen.dart';
import 'package:lms_adv/core/route/route_name.dart';
import 'package:lms_adv/features/auth/page/login_page.dart';
import 'package:lms_adv/features/auth/page/signup_page.dart';
import 'package:lms_adv/features/auth/page/verify_email.dart';
import 'package:lms_adv/features/home/pages/home_page.dart';

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
          return VerifyEmail();
        },
      ),
      GoRoute(
        path: RouteName.signup.path,
        name: RouteName.signup,
        builder: (context, state) {
          return SignupPage();
        },
      ),
    ],
  );
}

void logout() {
  AppRoute.router.goNamed(RouteName.login);
}
