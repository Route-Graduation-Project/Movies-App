import 'package:flutter/material.dart';
import 'package:movies_app/core/app_colors.dart';
import 'bottom_nav.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          /// MAIN CONTENT
          const Center(
            child: Text(
              "Profile Screen",
              style: TextStyle(color: AppColors.white),
            ),
          ),

          BottomNav(currentIndex: 3),
        ],
      ),
    );
  }
}
