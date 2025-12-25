import 'package:injectable/injectable.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/data/api_manager/api_client.dart';
import 'package:movies_app/data/api_manager/movies_api_client.dart';
import 'package:movies_app/data/mappers/add_movie_to_favorite_mapper.dart';
import 'package:movies_app/data/mappers/movie_mapper.dart';
import 'package:movies_app/data/mappers/movies_detail_entity_mapper.dart';
import 'package:movies_app/data/mappers/movies_suggestion_mapper.dart';
import 'package:movies_app/data/mappers/search_mapper.dart';
import 'package:movies_app/data/models/favorite_movies/add_favorite_movie_request.dart';
import 'package:movies_app/data/models/favorite_movies/get_favorite_movies_response.dart';
import 'package:movies_app/domain/entity/add_movie_to_favorite_entity.dart';
import 'package:movies_app/domain/entity/movie_details_entity.dart';
import 'package:movies_app/domain/entity/movie_entity.dart';
import 'package:movies_app/domain/entity/movies_suggestion_entity.dart';
import 'package:movies_app/domain/entity/search_entity.dart';
import 'package:movies_app/domain/repository/movies_api_remote_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: MoviesApiData)
class MoviesApiRemoteImpl implements MoviesApiData {
  MoviesApiClient moviesApiClient = getIt();
  ApiClient apiClient = getIt();

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
    try {
      var response = await moviesApiClient.getMovies(
        limit: limit,
        page: page,
        quality: quality,
        minimumRating: minimumRating,
        queryTerm: queryTerm,
        genre: genre,
        sortBy: sortBy,
        orderBy: orderBy,
      );
      return response.data?.movies
              ?.map((e) => MovieMapper.toEntity(e))
              .toList() ??
          [];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MovieDetailsEntity> getMovieDetails({required int movieId}) async {
    try {
      var response = await moviesApiClient.getMovieDetails(
        movieId,
        withImages: true,
        withCast: true,
      );
      return MoviesDetailEntityMapper().convertToMoviesDetailsEntity(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MoviesSuggestionResultEntity> getMovieSuggestions({
    required int movieId,
  }) async {
    try {
      var response = await moviesApiClient.getMovieSuggestions(movieId);
      return MoviesSuggestionMapper().convertToMoviesSuggestionEntity(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AddMovieToFavoriteEntity> addMovieToFavoriteList(
    String movieId,
    String name,
    double rating,
    String imageURL,
    String year,
  ) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("token");
      var response = await apiClient.addMovieToFavorite(
        AddFavoriteMovieRequest(
          movieId: movieId,
          name: name,
          rating: rating,
          imageURL: imageURL,
          year: year,
        ),
        "Bearer $token",
      );

      return AddMovieToFavoriteMapper.convertResponseToAddMovieFavoriteMapper(
        response,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<GetFavoriteMoviesResponse> getAllFavoriteMovies() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("token");
      var response = await apiClient.getAllFavoriteMovies("Bearer $token");

      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> removeMovieFromFavoriteList(String movieId) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("token");
      var response = await apiClient.removeMovieFromFavoriteList(
        movieId,
        "Bearer $token",
      );

      return response.message ?? "";
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> isMovieInFavList(String movieId) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("token");
      var response = await apiClient.checkIfMovieIsInFavList(
        movieId,
        "Bearer $token",
      );

      return response.data ?? false;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<SearchEntity>> searchMovie(String query) async {
    try {
      var response = await moviesApiClient.getSearchResults(query);
      return SearchMapper().convertToListSearchEntity(
        response.data?.movies ?? [],
      );
    } catch (e) {
      rethrow;
    }
  }
}
