import 'package:movies_app/data/models/movie_model.dart';

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
  Future<MovieModel> getMovieDetails(int movieId);
  Future<List<MovieModel>> getMovieSuggestions(int movieId);
}
