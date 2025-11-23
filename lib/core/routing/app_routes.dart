import 'package:flutter/material.dart';

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
      default:
        return MaterialPageRoute(
          builder:
              (_) => const Scaffold(
                body: Center(child: Text("404 - Page Not Found")),
              ),
        );
    }
  }
}
