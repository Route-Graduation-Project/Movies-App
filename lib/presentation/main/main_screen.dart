import 'package:flutter/material.dart';
import 'package:movies_app/core/app_colors.dart';

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

  final List<Widget> screens = const [
    HomeScreen(),
    SearchScreen(),
    ExploreScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: screens[currentIndex],

      bottomNavigationBar: Container(
        //margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
          color: AppColors.gray,
          borderRadius: BorderRadius.circular(20),
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
            backgroundColor: AppColors.gray,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.yellow,
            unselectedItemColor: AppColors.white,
            currentIndex: currentIndex,

            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },

            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search_rounded),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore_rounded),
                label: "Explore",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
