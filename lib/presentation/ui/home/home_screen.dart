import 'package:flutter/material.dart';
import 'package:movies_app/core/routing/routes.dart';
import 'package:movies_app/data/data_source/api_remote_impl.dart';
import 'package:movies_app/data/models/login_request.dart';
import 'package:movies_app/data/repository_imp/auth_repo_impl.dart';
import 'package:movies_app/domain/repository/api_remote_data.dart';


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
