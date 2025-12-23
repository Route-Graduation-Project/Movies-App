import 'package:movies_app/data/models/favorite_movies/get_favorite_movies_response.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/domain/entity/add_movie_to_favorite_entity.dart';
import 'package:movies_app/domain/entity/movie_details_entity.dart';
import 'package:movies_app/domain/entity/movies_suggestion_entity.dart';
import 'package:movies_app/domain/entity/search_entity.dart';

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

  Future<AddMovieToFavoriteEntity> addMovieToFavoriteList(
    String movieId,
    String name,
    double rating,
    String imageURL,
    String year,
  );
  Future<GetFavoriteMoviesResponse> getAllFavoriteMovies();
  Future<String> removeMovieFromFavoriteList(String movieId);
  Future<bool> isMovieInFavList(String movieId);
  Future<List<SearchEntity>> searchMovie(String query);
}
