import 'package:injectable/injectable.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/domain/entity/movie_details_entity.dart';
import 'package:movies_app/domain/entity/movie_entity.dart';
import 'package:movies_app/domain/entity/movies_suggestion_entity.dart';
import '../repository/movies_repository.dart';

@injectable
class UseCase {
  final MoviesRepository _moviesRepository = getIt();

  Future<MovieDetailsEntity> getMovieDetails(int movieId) async {
    return await _moviesRepository.getMovieDetails(movieId: movieId);
  }

  Future<MoviesSuggestionResultEntity> getMovieSuggestion(int movieId) async {
    return await _moviesRepository.getMovieSuggestions(movieId: movieId);
  }

  Future<List<MovieEntity>> getMovie({
    int? limit,
    int? page,
    String? quality,
    int? minimumRating,
    String? queryTerm,
    String? genre,
    String? sortBy,
    String? orderBy,
  }) async {
    return await _moviesRepository.getMovies(
      limit: limit,
      page: page,
      quality: quality,
      minimumRating: minimumRating,
      queryTerm: queryTerm,
      genre: genre,
      sortBy: sortBy,
      orderBy: orderBy,
    );
  }
}
