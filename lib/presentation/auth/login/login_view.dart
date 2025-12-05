import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/routing/routes.dart';
import 'package:movies_app/presentation/auth/login/login_cubit/login_injection.dart';
import 'package:movies_app/presentation/auth/login/login_cubit/login_cubit.dart';
import 'package:movies_app/presentation/auth/login/login_cubit/login_state.dart';
import 'package:movies_app/presentation/auth/login/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injectionLoginCubit(),
      child: Scaffold(
        body: const SafeArea(child: _LoginViewListener()),
      ),
    );
  }
}

class _LoginViewListener extends StatelessWidget {
  const _LoginViewListener();

  void _navigate(BuildContext context, LoginNavigationAction action) {
    if (action is LoginNavigationToRegister) {
      Navigator.of(context).pushReplacementNamed(Routes.registerRoute);
    } else if (action is LoginNavigationToHome) {
      Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return StreamBuilder<LoginNavigationAction>(
      stream: cubit.navigation,
      builder: (context, snapshot) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (snapshot.hasData) {
            _navigate(context, snapshot.data!);

          }
        });
        return const LoginViewBody();
      },
    );

  }
}