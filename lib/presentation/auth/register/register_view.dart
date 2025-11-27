import 'package:flutter/material.dart';
import 'package:movies_app/core/utilis/theme_extension.dart';
import 'package:movies_app/presentation/auth/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register', style: context.textStyle.bodyLarge),
      ),
      body: const RegisterViewBody(),
    );
  }
}
