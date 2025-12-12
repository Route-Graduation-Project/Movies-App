import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/domain/entity/movie_details_entity.dart';
import 'package:movies_app/domain/entity/movies_suggestion_entity.dart';

abstract interface class MoviesRemoteDataSource {
  Future<List<MovieModel>> getMovies({
    int? limit,
    int? page,
    String? quality,
    int? minimumRating,
    String? queryTerm,
    String? genre,
    String? sortBy,
    String? orderBy,
  });
  Future<MovieDetailsEntity> getMovieDetails(int movieId);
  Future<MoviesSuggestionResultEntity> getMovieSuggestions(int movieId);
}
