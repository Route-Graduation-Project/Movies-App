import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/app_colors.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/core/utils/context_extension.dart';
import 'package:movies_app/core/utils/padding_extension.dart';
import 'package:movies_app/core/utils/theme_extension.dart';
import 'package:movies_app/core/utils/white_space_extension.dart';
import 'package:movies_app/presentation/home/home_cubit/home_cubit.dart';
import 'package:movies_app/presentation/home/widgets/poster_widget.dart';
import 'package:movies_app/presentation/movie_details_screen/movie_details_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeCubit cubit = getIt();

  @override
  void initState() {
    super.initState();
    cubit.doAction(SetupHome());
    cubit.doAction(GetMovieList());
    cubit.navigation.listen((navigation) {
      switch (navigation) {
        case NavigateToMovieDetails():
          {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MovieDetailsView(movieID: navigation.movieID),
              ),
            );
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/image_5.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF2A2C30).withAlpha(70),
                const Color(0xFF2A2C30),
              ],
            ),
          ),
          child: SafeArea(
            child: ListView(
              children: [
                // image Available Now
                Container(
                  height: context.heightSize * 0.14,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/Available Now.png"),
                    ),
                  ),
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (_, state) {
                    if (state.isMovieOfDateLoading) {
                      return SizedBox(
                        height: context.heightSize * 0.34,
                        child: const Center(child: CircularProgressIndicator()),
                      );
                    } else {
                      return CarouselSlider(
                        items:
                            state.moviesSortedByDate!
                                .map(
                                  (movie) => InkWell(
                                    onTap: () {
                                      cubit.doAction(GoToDetailsScreenAction(movie.id));
                                    },
                                    child: PosterWidget(movie: movie),
                                  ),
                                )
                                .toList(),
                        options: CarouselOptions(
                          height: context.heightSize * 0.35,
                          enableInfiniteScroll: true,
                          viewportFraction: 0.47,
                          animateToClosest: true,
                          enlargeCenterPage: true,
                          initialPage: 0,
                        ),
                      );
                    }
                  },
                ),
                Container(
                  height: context.heightSize * 0.14,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/Watch Now.png"),
                    ),
                  ),
                ),

                SizedBox(
                  height: context.heightSize * 0.35,
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (_, state) {
                      if (state.isMovieOfGenresLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  state.genres[state.indexOfGenres!],
                                  style: context.textStyle.bodyLarge!.copyWith(
                                    color: AppColors.white,
                                  ),
                                ),
                                const Spacer(),
                                const Text("See More"),
                              ],
                            ).horizontalPadding(16),
                            Expanded(
                              child: ListView.separated(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                itemBuilder:
                                    (_, index) => InkWell(
                                      onTap:(){
                                        cubit.doAction(GoToDetailsScreenAction(state.moviesSortedByGenres![index].id));
                                      },
                                      child: PosterWidget(
                                        movie: state.moviesSortedByGenres![index],
                                      ),
                                    ),
                                separatorBuilder: (_, _) => 15.widthSpace,
                                itemCount: state.moviesSortedByGenres!.length,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
