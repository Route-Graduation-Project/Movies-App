import 'package:flutter/material.dart';

import '../../core/routing/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
          child: FilledButton(onPressed: () {
            Navigator.pushNamed(context, Routes.updateRoute);
          }, child: const Text("Update Profile"))),
    );
  }
}
