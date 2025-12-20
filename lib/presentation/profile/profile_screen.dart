import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:movies_app/core/app_colors.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/core/utils/context_extension.dart';
import 'package:movies_app/core/utils/theme_extension.dart';
import 'package:movies_app/domain/entity/movie_entity.dart';
import 'package:movies_app/presentation/home/home_cubit/home_cubit.dart';
import 'package:movies_app/presentation/movie_details_screen/movie_details_view.dart';
import 'package:movies_app/presentation/profile/cubit/profile_cubit.dart';
import 'package:movies_app/presentation/profile/cubit/profile_state.dart';
import 'package:movies_app/presentation/profile/widgets/movie_list.dart';
import 'package:movies_app/presentation/profile/widgets/tab_bar.dart';
import '../../core/routing/routes.dart';
import '../home/widgets/poster_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileCubit cubit = getIt();
  late HomeCubit cubitHome;
  @override
  void initState() {
    super.initState();
    cubitHome = BlocProvider.of<HomeCubit>(context);

    cubitHome.navigation.listen((navigation) async {
      switch (navigation) {
        case NavigateToMovieDetails():
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MovieDetailsView(movieID: navigation.movieID),
            ),
          );
          if (result == true) {
            cubit.doAction(GetProfileData());
          }
      }
    });

    cubit.navigation.listen((event) async {
      switch (event) {
        case NavigateToEditProfile():
          {
            final result = await Navigator.pushNamed(
              context,
              Routes.updateRoute,
            );

            if (result == true) {
              cubit.doAction(GetProfileData());
            }
          }
          {}
        case LogoutNavigation():
          {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.loginRoute,
              (route) => false,
            );
          }
      }
    });
    cubit.doAction(GetProfileData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          final historyMovies =
              (cubitHome.state.moviesSortedByDate ?? [])
                  .where(
                    (movie) =>
                        cubitHome.state.clickedMovieIds.contains(movie.id),
                  )
                  .toList();
          final historyMoviesSorted = [...historyMovies]
            ..sort((a, b) => b.id.compareTo(a.id));

          return state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : DefaultTabController(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        spacing: 8,
                                        children: [
                                          Image.asset(
                                            "assets/images/avatar${state.avatarId}.png",
                                            width: context.widthSize * 0.25,
                                          ),
                                          Text(
                                            state.name ?? 'UnKnown',
                                            style: context.textStyle.titleLarge!
                                                .copyWith(
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
                                            state.wishListNumber.toString(),
                                            style: const TextStyle(
                                              color: AppColors.white,
                                              fontSize: 32,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "Wish List",
                                            style: context.textStyle.titleLarge!
                                                .copyWith(
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
                                            historyMovies.length.toString(),
                                            style: const TextStyle(
                                              color: AppColors.white,
                                              fontSize: 32,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "History",
                                            style: context.textStyle.titleLarge!
                                                .copyWith(
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
                                            cubit.emitNavigation(
                                              NavigateToEditProfile(),
                                            );
                                          },
                                          child: Text(
                                            "Edit Profile",
                                            style: context
                                                .textStyle
                                                .titleMedium!
                                                .copyWith(
                                                  color: AppColors.black,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: FilledButton(
                                          onPressed: () {
                                            cubit.emitNavigation(
                                              LogoutNavigation(),
                                            );
                                          },
                                          style: FilledButton.styleFrom(
                                            backgroundColor: AppColors.red,
                                            foregroundColor: AppColors.white,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            spacing: 8,
                                            children: [
                                              Text(
                                                "Exit",
                                                style: context
                                                    .textStyle
                                                    .titleMedium!
                                                    .copyWith(
                                                      color: AppColors.white,
                                                    ),
                                              ),
                                              const Icon(
                                                Iconsax.logout_outline,
                                              ),
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
                                labelStyle: context.textStyle.titleMedium!
                                    .copyWith(color: AppColors.white),
                                unselectedLabelStyle: context
                                    .textStyle
                                    .titleMedium!
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
                          MovieList(
                            movies:
                                state.movies
                                    .map(
                                      (e) => PosterWidget(
                                        movieTap: (id) {
                                          cubitHome.doAction(
                                            GoToDetailsScreenAction(id),
                                          );
                                        },
                                        movie: MovieEntity(
                                          id: e.id,
                                          title: e.title,
                                          rating: e.rating,
                                          mediumCoverImage: e.smallCoverImage,
                                        ),
                                      ),
                                    )
                                    .toList(),
                          ),
                          MovieList(
                            movies:
                                historyMoviesSorted
                                    .map(
                                      (e) => PosterWidget(
                                        movieTap: (id) {
                                          cubitHome.emitNavigation(
                                            NavigateToMovieDetails(id),
                                          );
                                        },
                                        movie: MovieEntity(
                                          id: e.id,
                                          title: e.title,
                                          rating: e.rating,
                                          mediumCoverImage: e.mediumCoverImage,
                                        ),
                                      ),
                                    )
                                    .toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
        },
      ),
    );
  }
}
