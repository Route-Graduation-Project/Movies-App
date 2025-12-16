import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:movies_app/core/app_colors.dart';
import '../../core/routing/routes.dart';

class ProfileScreen extends StatelessWidget {
  final int wishListCount = 12;
  final int historyListCount = 10;

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          children: [
            Container(
              height: size.height * 0.35,
              width: double.infinity,
              decoration: const BoxDecoration(color: AppColors.gray),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 64,
                ),
                child: Column(
                  spacing: 16,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          spacing: 16,
                          children: [
                            Image.asset(
                              "assets/images/avatar0.png",
                              width: size.width * 0.3,
                            ),
                            const Text(
                              "User Name",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          spacing: 16,
                          children: [
                            Text(
                              wishListCount.toString(),
                              style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "Wish List",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          spacing: 16,
                          children: [
                            Text(
                              historyListCount.toString(),
                              style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "History",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      spacing: 8,
                      children: [
                        Expanded(
                          flex: 5,
                          child: FilledButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.updateRoute);
                            },
                            child: const Text(
                              "Edit Profile",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: FilledButton(
                            onPressed: () {},
                            style: FilledButton.styleFrom(
                              backgroundColor: AppColors.red,
                              foregroundColor: AppColors.white,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 8,
                              children: [
                                Text(
                                  "Exit",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Icon(Iconsax.logout_outline),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
