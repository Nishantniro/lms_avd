import 'package:flutter/material.dart';
import 'package:lms_adv/core/route/router.dart';
import 'package:lms_adv/core/theme/theme_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'LMS Advance',
      debugShowCheckedModeBanner: false,
      theme: AppThemeMode.lightTheme(context),
      darkTheme: AppThemeMode.darkTheme(context),
      themeMode: ThemeMode.dark,
     routerConfig: AppRoute.router(),
    );
  }
}

