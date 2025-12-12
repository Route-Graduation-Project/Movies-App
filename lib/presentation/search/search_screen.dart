import 'package:flutter/material.dart';
import 'package:movies_app/core/app_colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Text(
          "Search Screen",
          style: TextStyle(color: AppColors.white, fontSize: 20),
        ),
      ),
    );
  }
}
