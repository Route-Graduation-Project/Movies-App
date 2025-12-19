import 'package:injectable/injectable.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/data/models/favorite_movies/get_favorite_movies_response.dart';
import 'package:movies_app/domain/entity/add_movie_to_favorite_entity.dart';
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

  Future<AddMovieToFavoriteEntity> addMovieToFavoriteList(String movieId,
      String name,
      double rating,
      String imageURL,
      String year,)async
  {
    return await _moviesRepository.addMovieToFavoriteList(movieId, name, rating, imageURL, year);
  }

  Future<GetFavoriteMoviesResponse> getAllFavoriteMovies()async{
    return await _moviesRepository.getAllFavoriteMovies();
  }

  Future<String> removeMovieFromFavoriteList(String movieId) async {
    return await _moviesRepository.removeMovieFromFavoriteList(movieId);
  }

  Future<bool> isMovieInFavoriteList(String movieId) async{
    return await _moviesRepository.isMovieInFavList(movieId);
  }
}
