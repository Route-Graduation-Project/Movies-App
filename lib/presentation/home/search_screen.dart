import 'package:flutter/material.dart';
import 'package:movies_app/core/app_colors.dart';

import 'bottom_nav.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          const Center(
            child: Text(
              "Search Screen",
              style: TextStyle(color: AppColors.white),
            ),
          ),

          BottomNav(currentIndex: 1),
        ],
      ),
    );
  }
}
