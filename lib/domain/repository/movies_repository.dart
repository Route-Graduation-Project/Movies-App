import 'package:movies_app/domain/entity/movie_details_entity.dart';
import 'package:movies_app/domain/entity/movies_suggestion_entity.dart';

abstract interface class MoviesRepository {
  Future<MovieDetailsEntity> getMovieDetails({required movieId});
  Future<MoviesSuggestionResultEntity> getMovieSuggestions({
    required int movieId,
  });
}
