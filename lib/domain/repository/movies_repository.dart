import 'package:movies_app/domain/entity/movie_details_entity.dart';
import 'package:movies_app/domain/entity/movie_entity.dart';
import 'package:movies_app/domain/entity/movies_suggestion_entity.dart';

abstract interface class MoviesRepository {
  Future<List<MovieEntity>> getMovies({
    int? limit,
    int? page,
    String? quality,
    int? minimumRating,
    String? queryTerm,
    String? genre,
    String? sortBy,
    String? orderBy,
  });
  Future<MovieDetailsEntity> getMovieDetails({required int movieId});
  Future<MoviesSuggestionResultEntity> getMovieSuggestions({
    required int movieId,
  });
}
