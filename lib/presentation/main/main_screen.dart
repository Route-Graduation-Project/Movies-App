import 'package:flutter/material.dart';
import 'package:movies_app/core/app_colors.dart';
import 'package:movies_app/core/utils/padding_extension.dart';

import 'package:movies_app/presentation/home/home_screen.dart';
import 'package:movies_app/presentation/profile/profile_screen.dart';
import 'package:movies_app/presentation/explore/explore_screen.dart';
import 'package:movies_app/presentation/search/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const ExploreScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.black,
      body: screens[currentIndex],

      bottomNavigationBar: SafeArea(
        bottom: true,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BottomNavigationBar(
            unselectedFontSize: 0,
            selectedFontSize: 0,
            backgroundColor: AppColors.gray,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.yellow,
            unselectedItemColor: AppColors.white,
            currentIndex: currentIndex,
            elevation: 0,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },

            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search_rounded),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore_rounded),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "",
              ),
            ],
          ),
        ).horizontalPadding(16),
      ),
    );
  }
}
