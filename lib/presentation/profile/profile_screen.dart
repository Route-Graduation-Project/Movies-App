import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:movies_app/core/app_colors.dart';
import 'package:movies_app/core/utils/context_extension.dart';
import 'package:movies_app/core/utils/theme_extension.dart';
import 'package:movies_app/domain/entity/movie_entity.dart';
import 'package:movies_app/presentation/profile/widgets/movie_list.dart';
import 'package:movies_app/presentation/profile/widgets/tab_bar.dart';
import '../../core/routing/routes.dart';
import '../home/widgets/poster_widget.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  // test data
  final List<PosterWidget> historyList = [
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_2010/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_2010/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_2010/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_2010/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
  ];
  final List<PosterWidget> watchList = [
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
    PosterWidget(
      movieTap: (index) {},
      movie: MovieEntity(
        id: 1,
        title: "moodfsd",
        mediumCoverImage:
            "https://yts.lt/assets/images/movies/13_13_13_2013/medium-cover.jpg",
        rating: 7.7,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.gray,
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (_, _) {
              return [
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    color: AppColors.gray,
                    child: Column(
                      spacing: 16,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              spacing: 8,
                              children: [
                                Image.asset(
                                  "assets/images/avatar0.png",
                                  width: context.widthSize * 0.25,
                                ),
                                Text(
                                  "User Name",
                                  style: context.textStyle.titleLarge!.copyWith(
                                    color: AppColors.white,
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
                                Text(
                                  "Wish List",
                                  style: context.textStyle.titleLarge!.copyWith(
                                    color: AppColors.white,
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
                                Text(
                                  "History",
                                  style: context.textStyle.titleLarge!.copyWith(
                                    color: AppColors.white,
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
                                  Navigator.pushNamed(
                                    context,
                                    Routes.updateRoute,
                                  );
                                },
                                child: Text(
                                  "Edit Profile",
                                  style: context.textStyle.titleMedium!
                                      .copyWith(color: AppColors.black),
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 8,
                                  children: [
                                    Text(
                                      "Exit",
                                      style: context.textStyle.titleMedium!
                                          .copyWith(color: AppColors.white),
                                    ),
                                    const Icon(Iconsax.logout_outline),
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
                SliverPersistentHeader(
                  floating: false,
                  pinned: true,
                  delegate: TabBarDelegate(
                    TabBar(
                      labelStyle: context.textStyle.titleMedium!.copyWith(
                        color: AppColors.white,
                      ),
                      unselectedLabelStyle: context.textStyle.titleMedium!
                          .copyWith(color: AppColors.white),
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: const [
                        Tab(
                          icon: Icon(
                            Icons.list,
                            size: 30,
                            color: AppColors.yellow,
                          ),
                          text: "Watch List",
                        ),
                        Tab(
                          icon: Icon(
                            Icons.folder,
                            size: 30,
                            color: AppColors.yellow,
                          ),
                          text: "History",
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                MovieList(movies: watchList),
                MovieList(movies: historyList),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
