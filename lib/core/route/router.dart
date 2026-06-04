import 'package:go_router/go_router.dart';
import 'package:lms_adv/core/route/route_name.dart';
import 'package:lms_adv/features/auth/page/login_page.dart';
import 'package:lms_adv/features/home/pages/home_page.dart';

class AppRoute {
  static GoRouter router() {
    return GoRouter(
      initialLocation: RouteName.login.path,
      routes: [
        GoRoute(
          path: RouteName.home.path,
          name: RouteName.home,
          builder: (context, state) {
            return HomePage();
          },
        ),
        GoRoute(
          path: RouteName.login.path,
          name: RouteName.login,
          builder: (context, state) {
            return LoginPage();
          },
        ),
      ],
    );
  }
}
