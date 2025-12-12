import 'package:injectable/injectable.dart';
import 'package:movies_app/core/base/base_cubit.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/domain/use_case/use_case.dart';
import 'package:movies_app/presentation/movie_details_screen/cubit/movie_details_contract.dart';


@injectable
class MovieDetailsCubit extends BaseCubit<MovieDetailsState, MovieDetailsActions, MovieDetailsNavigation> {
  MovieDetailsCubit() : super(MovieDetailsState());

  UseCase useCase = getIt();


  @override
  Future<void> doAction(MovieDetailsActions action) async {
    switch (action) {
      case GetMovieDetails():
        {
          _getMovieDetails(action.movieID);
        }
      case Setup():{
        _setup();
      }
      case GoToMovieSuggestion():{
        _goToMovieSuggestion(action.movieID);
        }
      case GoBack():{
        _goBack();
      }
      case WatchMovie():
        {
          _watchMovie(action.url);
        }
    }
  }




  void _setup(){
    emit(state.copyWith(loading: true));
  }

  Future<void> _getMovieDetails(int movieId) async {
    try{
      var responseOfMovieDetails = await useCase.getMovieDetails(movieId);
      var responseOFMovieSuggestions = await useCase.getMovieSuggestion(movieId);
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
    }catch(e){
      rethrow;
    }
    finally{
      emit(state.copyWith(loading: false));
    }

  }

  void _goToMovieSuggestion(int movieID){
    emitNavigation(NavigateToMovieDetails(movieID));
  }

  void _goBack(){
    emitNavigation(NavigateToBack());
  }

  void _watchMovie(String movieUrl) {
    emitNavigation(NavigateToWatchMovie(movieUrl));
  }

}
