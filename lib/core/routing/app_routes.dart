import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/routing/routes.dart';
import 'package:movies_app/presentation/auth/login/login_view.dart';
import 'package:movies_app/presentation/auth/register/register_cubit/register_cubit.dart';
import 'package:movies_app/presentation/auth/register/register_view.dart';
import 'package:movies_app/presentation/home/home_screen.dart';
import 'package:movies_app/presentation/movie_details_screen/movie_details_view.dart';
import 'package:movies_app/presentation/on_boarding/onboarding_view.dart';
import 'package:movies_app/presentation/update/select_picture_screen.dart';
import 'package:movies_app/presentation/update/update_screen.dart';
import 'package:movies_app/presentation/explore/explore_screen.dart';
import 'package:movies_app/presentation/search/search_screen.dart';
import 'package:movies_app/presentation/profile/profile_screen.dart';
import 'package:movies_app/presentation/main/main_screen.dart';


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
      case Routes.onboardingRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const OnboardingView(),
        );
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
          builder:
              (_) => BlocProvider(
                create: (_) => injectionRegisterCubit(),
                child: const RegisterView(),
              ),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LoginView(),
        );
      case Routes.selectPictureRoute:
        return PageRouteBuilder(
          opaque: false,
          barrierColor: Colors.black54,
          pageBuilder: (_, __, ___) => const SelectPictureScreen(),
        );
      case Routes.exploreRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ExploreScreen(),
        );

      case Routes.searchRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SearchScreen(),
        );

      case Routes.profileRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ProfileScreen(),
        );
      case Routes.mainRoute:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
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
