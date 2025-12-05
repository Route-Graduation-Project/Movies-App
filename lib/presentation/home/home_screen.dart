import 'package:flutter/material.dart';
import 'package:movies_app/core/routing/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: FilledButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.updateRoute);
          },
          child: Text('update profile'),
        ),
      ),
    );
  }
}
