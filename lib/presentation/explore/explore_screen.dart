import 'package:flutter/material.dart';
import 'package:movies_app/core/app_colors.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Text(
          "Explore Screen",
          style: TextStyle(color: AppColors.white, fontSize: 20),
        ),
      ),
    );
  }
}
