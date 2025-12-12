import 'package:flutter/material.dart';
import 'package:movies_app/core/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Text(
          "Profile Screen",
          style: TextStyle(color: AppColors.white, fontSize: 20),
        ),
      ),
    );
  }
}
