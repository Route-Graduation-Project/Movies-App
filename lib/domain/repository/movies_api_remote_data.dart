import 'package:movies_app/domain/entity/movie_details_entity.dart';
import 'package:movies_app/domain/entity/movies_suggestion_entity.dart';

abstract interface class MoviesApiData {
  Future<MovieDetailsEntity> getMovieDetails({required int movieId});
  Future<MoviesSuggestionResultEntity> getMovieSuggestions({
    required int movieId,
  });
}
