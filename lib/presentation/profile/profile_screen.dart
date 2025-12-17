import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:movies_app/core/app_colors.dart';
import '../../core/routing/routes.dart';
import '../home/widgets/poster_widget.dart';

class ProfileScreen extends StatelessWidget {
  final List<PosterWidget> historyList = const [];
  final List<PosterWidget> watchList = const [];

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView(
          children: [
            Container(
              height: size.height * 0.35,
              width: double.infinity,
              decoration: const BoxDecoration(color: AppColors.gray),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 64),
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
                              watchList.length.toString(),
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
                              historyList.length.toString(),
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
            DefaultTabController(
              initialIndex: 0,
              length: 2,
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.1,
                    decoration: const BoxDecoration(color: AppColors.gray),
                    child: const TabBar(
                      dividerHeight: 0,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 3,
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: AppColors.white,
                      ),
                      unselectedLabelStyle: TextStyle(fontSize: 20),
                      tabs: [
                        Tab(
                          icon: Icon(
                            Icons.list,
                            size: 40,
                            color: AppColors.yellow,
                          ),
                          text: "Watch List",
                        ),
                        Tab(
                          icon: Icon(
                            Icons.folder,
                            size: 40,
                            color: AppColors.yellow,
                          ),
                          text: "History",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.88,
                    child: TabBarView(
                      children: [
                        Center(child: Image.asset("assets/images/Empty 1.png")),
                        (watchList.isEmpty)
                            ? Center(
                          child: Image.asset("assets/images/Empty 1.png"),
                        )
                            : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            itemBuilder: (context, index) {
                              return watchList[index];
                            },
                            itemCount: watchList.length,
                          ),
                        ),
                        (historyList.isEmpty)
                            ? Center(
                              child: Image.asset("assets/images/Empty 1.png"),
                            )
                            : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 16,
                                      mainAxisSpacing: 16,
                                    ),
                                itemBuilder: (context, index) {
                                  return historyList[index];
                                },
                                itemCount: historyList.length,
                              ),
                            ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
