import 'package:flutter/material.dart';
import 'package:movies_app/core/routing/routes.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.registerRoute);
          },
          child: (const Text("go to reg")),
        ),
      ),
    );
  }
}
