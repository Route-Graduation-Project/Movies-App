import 'package:movies_app/data/mappers/movie_mapper.dart';
import 'package:movies_app/domain/entity/movie_details_entity.dart';
import 'package:movies_app/domain/entity/movie_entity.dart';
import 'package:movies_app/domain/entity/movies_suggestion_entity.dart';
import 'package:movies_app/domain/repository/movies_remote_data_source.dart';
import 'package:movies_app/domain/repository/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDataSource _remoteDataSource;

  MoviesRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<MovieEntity>> getMovies({
    int? limit,
    int? page,
    String? quality,
    int? minimumRating,
    String? queryTerm,
    String? genre,
    String? sortBy,
    String? orderBy,
  }) async {
    final models = await _remoteDataSource.getMovies(
      limit: limit,
      page: page,
      quality: quality,
      minimumRating: minimumRating,
      queryTerm: queryTerm,
      genre: genre,
      sortBy: sortBy,
      orderBy: orderBy,
    );
    return models.map((model) => MovieMapper.toEntity(model)).toList();
  }

  @override
  Future<MovieDetailsEntity> getMovieDetails({required int movieId}) async {
    return await _remoteDataSource.getMovieDetails(movieId);
  }

  @override
  Future<MoviesSuggestionResultEntity> getMovieSuggestions({
    required int movieId,
  }) async {
    return await _remoteDataSource.getMovieSuggestions(movieId);
  }
}
