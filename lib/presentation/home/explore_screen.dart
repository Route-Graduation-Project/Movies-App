import 'package:flutter/material.dart';
import 'package:movies_app/core/app_colors.dart';
import 'bottom_nav.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          const Center(
            child: Text(
              "Explore Screen",
              style: TextStyle(color: AppColors.white),
            ),
          ),

          BottomNav(currentIndex: 2),
        ],
      ),
    );
  }
}
