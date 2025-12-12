import 'package:movies_app/data/api_manager/movies_api_client.dart';
import 'package:movies_app/data/api_manager/shared_dio.dart';
import 'package:movies_app/data/mappers/movies_detail_entity_mapper.dart';
import 'package:movies_app/data/mappers/movies_suggestion_mapper.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/domain/entity/movie_details_entity.dart';
import 'package:movies_app/domain/entity/movies_suggestion_entity.dart';
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
  Future<MovieDetailsEntity> getMovieDetails(int movieId) async {
    final response = await _apiClient.getMovieDetails(movieId);
    return MoviesDetailEntityMapper().convertToMoviesDetailsEntity(response);
  }

  @override
  Future<MoviesSuggestionResultEntity> getMovieSuggestions(int movieId) async {
    final response = await _apiClient.getMovieSuggestions(movieId);
    return MoviesSuggestionMapper().convertToMoviesSuggestionEntity(response);
  }
}
