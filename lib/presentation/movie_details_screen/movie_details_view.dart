import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/app_colors.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/core/utils/context_extension.dart';
import 'package:movies_app/core/utils/padding_extension.dart';
import 'package:movies_app/core/utils/theme_extension.dart';
import 'package:movies_app/core/utils/white_space_extension.dart';
import 'package:movies_app/presentation/movie_details_screen/cubit/movie_details_contract.dart';
import 'package:movies_app/presentation/movie_details_screen/cubit/movie_details_cubit.dart';
import 'package:movies_app/presentation/movie_details_screen/widgets/character_widget.dart';
import 'package:movies_app/presentation/movie_details_screen/widgets/genres_widget.dart';
import 'package:movies_app/presentation/movie_details_screen/widgets/movie_cover_widget.dart';
import 'package:movies_app/presentation/movie_details_screen/widgets/screen_shot_widget.dart';
import 'package:movies_app/presentation/movie_details_screen/widgets/suggested_movie_widget.dart';
import 'package:movies_app/presentation/movie_details_screen/widgets/watch_movie_widget.dart';


class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView({required this.movieID, super.key});

  final int movieID;

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  @override
  void initState() {
    super.initState();

    cubit.doAction(Setup());
    cubit.doAction(GetMovieDetails(widget.movieID));
    cubit.navigation.listen((navigation) {
      switch (navigation) {
        case NavigateToMovieDetails():
          {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MovieDetailsView(movieID: navigation.movieId!),
              ),
            );
          }
        case NavigateToBack():
          {
            Navigator.pop(context);
          }
        case NavigateToWatchMovie():
          {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => WatchMovieScreen(url: navigation.url,),
              ),
            );
          }
      }
    });
  }

  MovieDetailsCubit cubit = getIt();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              cubit.doAction(GoBack());
            },
            icon: const Icon(Icons.arrow_back_ios, color: AppColors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                // todo Favourite Movie Action
              },
              icon: const Icon(Icons.bookmark, color: AppColors.white),
            ),
          ],
        ),
        body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
          builder: (_, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                  // image of movie
                  SizedBox(
                    width: double.infinity,
                    child: Stack(
                      children: [
                        MovieCoverWidget(urlImage: state.largeCoverImage!),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  const Color(0xFF121312).withAlpha(50),
                                  const Color(0xFF121312).withAlpha(30),
                                  const Color(0xFF121312),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Image.asset("assets/images/play_icon.png"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // title of movie
                  Text(
                    state.title!,
                    style: context.textStyle.titleLarge!.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  5.heightSpace,
                  // the year of movie
                  Text(
                    state.year.toString(),
                    style: context.textStyle.titleLarge!.copyWith(
                      color: AppColors.white.withAlpha(100),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  // watch button
                  FilledButton(
                    onPressed: () {
                      cubit.doAction(WatchMovie(state.url!));
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.red,
                    ),
                    child: Text(
                      "Watch",
                      style: context.textStyle.titleMedium!.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ).allPadding(16),
                  // rates and like info
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.gray,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(
                                Icons.favorite,
                                color: AppColors.yellow,
                                size: 28,
                              ),
                              Text(
                                state.likeCount.toString(),
                                style: context.textStyle.titleMedium!.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      20.widthSpace,
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.gray,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(
                                Icons.watch_later,
                                color: AppColors.yellow,
                                size: 28,
                              ),
                              Text(
                                state.runtime.toString(),
                                style: context.textStyle.titleMedium!.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      20.widthSpace,
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.gray,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(
                                Icons.star,
                                color: AppColors.yellow,
                                size: 28,
                              ),
                              Text(
                                state.rating.toString(),
                                style: context.textStyle.titleMedium!.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ).allPadding(16),

                  Text(
                    "Screen Shots",
                    style: context.textStyle.titleLarge!.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ).horizontalPadding(16),
                  ScreenShotWidget(urlImage: state.mediumScreenshotImage1!),
                  ScreenShotWidget(urlImage: state.mediumScreenshotImage2!),
                  ScreenShotWidget(urlImage: state.mediumScreenshotImage3!),
                  Text(
                    "Similar",
                    style: context.textStyle.titleLarge!.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ).horizontalPadding(16),

                  SizedBox(
                    // determine the height based on the count of suggested movie depend on the height of the image (30% of height screen)
                    height: state.movieSuggestions!.length > 2 ? context.heightSize * 0.67 : context.heightSize * 0.34,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.65,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                      itemCount: state.movieSuggestions!.length>4? 4 : state.movieSuggestions!.length,
                      itemBuilder:
                          (context, index) => SuggestedMovieWidget(
                            movieSuggestion: state.movieSuggestions![index],
                            movieSuggestionTap: (id) {
                              cubit.doAction(GoToMovieSuggestion(id));
                            },
                          ),
                    ),
                  ),

                  Text(
                    "Summary",
                    style: context.textStyle.titleLarge!.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ).horizontalPadding(16),

                  10.heightSpace,
                  Text(
                    state.descriptionFull == "" || state.descriptionFull == null ? "There is no summary of this movie" : state.descriptionFull!,
                    style: context.textStyle.bodyMedium!.copyWith(
                      color: AppColors.white,
                    ),
                  ).horizontalPadding(16),

                  15.heightSpace,

                  Text(
                    "Cast",
                    style: context.textStyle.titleLarge!.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ).horizontalPadding(16),

                  for (int i = 0; i < state.cast!.length; i++)
                    CharacterWidget(
                      urlImage: state.cast![i].urlSmallImage!,
                      originName: state.cast![i].name!,
                      characterName: state.cast![i].characterName!,
                    ),

                  15.heightSpace,

                  Text(
                    "Geners",
                    style: context.textStyle.titleLarge!.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ).horizontalPadding(16),

                  GenresWidget(genres: state.genres!),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
