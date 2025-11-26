import 'package:flutter/material.dart';
import 'package:movies_app/core/routing/routes.dart';
import 'package:movies_app/presentation/ui/auth/presentation/views/login_view.dart';
import 'package:movies_app/presentation/ui/auth/presentation/views/register/register_view.dart';
import 'package:movies_app/presentation/ui/home/home_screen.dart';
import 'package:movies_app/presentation/ui/update/update_screen.dart';
import '../app_colors.dart';

abstract class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    final uri = Uri.parse(settings.name ?? '/');

    switch (uri.path) {
      //--------Example return--------
      //case Routes.exampleViewRoute:
      // return MaterialPageRoute(
      //   settings: settings,
      //   builder: (_) => const ExampleView(),
      // );
      case Routes.homeRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const HomeScreen(),
        );
      case Routes.updateRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const UpdateScreen(),
        );
      case Routes.registerRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const RegisterView(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LoginView(),
        );
      default:
        return MaterialPageRoute(
          builder:
              (_) => const Scaffold(
                body: Center(
                  child: Text(
                    "404 - Page Not Found",
                    style: TextStyle(color: AppColors.red),
                  ),
                ),
              ),
        );
    }
  }
}
