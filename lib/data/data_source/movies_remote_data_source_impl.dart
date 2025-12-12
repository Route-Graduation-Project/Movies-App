import 'package:movies_app/data/api_manager/movies_api_client.dart';
import 'package:movies_app/data/api_manager/shared_dio.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/domain/repository/movies_remote_data_source.dart';

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  late final MoviesApiClient _apiClient;

  MoviesRemoteDataSourceImpl() {
    _apiClient = MoviesApiClient(sharedDio());
  }

  @override
  Future<List<MovieModel>> getMovies({
    int? limit,
    int? page,
    String? quality,
    int? minimumRating,
    String? queryTerm,
    String? genre,
    String? sortBy,
    String? orderBy,
  }) async {
    final response = await _apiClient.getMovies(
      limit: limit,
      page: page,
      quality: quality,
      minimumRating: minimumRating,
      queryTerm: queryTerm,
      genre: genre,
      sortBy: sortBy,
      orderBy: orderBy,
    );
    return response.data?.movies ?? [];
  }

  @override
  Future<MovieModel> getMovieDetails(int movieId) async {
    final response = await _apiClient.getMovieDetails(movieId);
    if (response.data?.movie == null) {
      throw Exception("Movie not found");
    }
    return response.data!.movie!;
  }

  @override
  Future<List<MovieModel>> getMovieSuggestions(int movieId) async {
    final response = await _apiClient.getMovieSuggestions(movieId);
    return response.data?.movies ?? [];
  }
}
