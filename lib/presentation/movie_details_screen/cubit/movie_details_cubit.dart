import 'package:injectable/injectable.dart';
import 'package:movies_app/core/base/base_cubit.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/domain/use_case/use_case.dart';
import 'package:movies_app/presentation/movie_details_screen/cubit/movie_details_contract.dart';

@injectable
class MovieDetailsCubit
    extends
        BaseCubit<
          MovieDetailsState,
          MovieDetailsActions,
          MovieDetailsNavigation
        > {
  MovieDetailsCubit() : super(MovieDetailsState());

  UseCase useCase = getIt();
  @override
  Future<void> doAction(MovieDetailsActions action) async {
    switch (action) {
      case GetMovieDetails():
        {
          _getMovieDetails(action.movieID);
        }
      case Setup():
        {
          _setup();
        }
      case GoToMovieSuggestion():
        {
          _goToMovieSuggestion(action.movieID);
        }
      case GoBack():
        {
          _goBack();
        }
      case WatchMovie():
        {
          _watchMovie(action.url);
        }
      case AddMovieToFavorite():
        _addMovieToFavorite(action);

      case RemoveMovieFromFavorite():
        _removeMovieFromFav(action);
    }
  }

  void _removeMovieFromFav(RemoveMovieFromFavorite action) async {
    emit(state.copyWith(loading: true));

    await useCase.removeMovieFromFavoriteList(action.movieId);
    emit(state.copyWith(favorite: false));
  }

  Future<void> _addMovieToFavorite(AddMovieToFavorite action) async {
    try {
      await useCase.addMovieToFavoriteList(
        action.movieId,
        action.name,
        action.rating,
        action.imageURL,
        action.year,
      );
      emit(state.copyWith(loading: true));

      emit(state.copyWith(favorite: true));
    } catch (e) {
      emit(state.copyWith(loading: true));

      emit(state.copyWith(favorite: false));
    }
  }

  void _setup() {
    emit(state.copyWith(loading: true));
  }

  Future<void> _getMovieDetails(int movieId) async {
    try {
      var responseOfMovieDetails = await useCase.getMovieDetails(movieId);
      var responseOFMovieSuggestions = await useCase.getMovieSuggestion(
        movieId,
      );
      bool isFav = await useCase.isMovieInFavoriteList(movieId.toString());
      emit(state.copyWith(favorite: isFav));
      emit(
        state.copyWith(
          id: responseOfMovieDetails.id,
          url: responseOfMovieDetails.url,
          title: responseOfMovieDetails.title,
          year: responseOfMovieDetails.year,
          rating: responseOfMovieDetails.rating,
          runtime: responseOfMovieDetails.runtime,
          genres: responseOfMovieDetails.genres,
          likeCount: responseOfMovieDetails.likeCount,
          descriptionFull: responseOfMovieDetails.descriptionFull,
          largeCoverImage: responseOfMovieDetails.largeCoverImage,
          mediumScreenshotImage1: responseOfMovieDetails.mediumScreenshotImage1,
          mediumScreenshotImage2: responseOfMovieDetails.mediumScreenshotImage2,
          mediumScreenshotImage3: responseOfMovieDetails.mediumScreenshotImage3,
          cast: responseOfMovieDetails.cast,
          movieSuggestions: responseOFMovieSuggestions.movies,
        ),
      );
    } catch (e) {
      rethrow;
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  void _goToMovieSuggestion(int movieID) {
    emitNavigation(NavigateToMovieDetails(movieID));
  }

  void _goBack() {
    emitNavigation(NavigateToBack());
  }

  void _watchMovie(String movieUrl) {
    emitNavigation(NavigateToWatchMovie(movieUrl));
  }
}
