import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/data/api_manager/api_client.dart';
import 'package:movies_app/data/api_manager/movies_api_client.dart';
import 'package:movies_app/data/mappers/add_movie_to_favorite_mapper.dart';
import 'package:movies_app/data/mappers/movies_detail_entity_mapper.dart';
import 'package:movies_app/data/mappers/movies_suggestion_mapper.dart';
import 'package:movies_app/data/models/favorite_movies/add_favorite_movie_request.dart';
import 'package:movies_app/data/models/favorite_movies/get_favorite_movies_response.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/domain/entity/add_movie_to_favorite_entity.dart';
import 'package:movies_app/domain/entity/movie_details_entity.dart';
import 'package:movies_app/domain/entity/movies_suggestion_entity.dart';
import 'package:movies_app/domain/repository/movies_remote_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  late final MoviesApiClient _movieApiClient;
  late final ApiClient _apiClient;

  MoviesRemoteDataSourceImpl() {
    _movieApiClient = MoviesApiClient(getIt());
    _apiClient = ApiClient(getIt());
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
    final response = await _movieApiClient.getMovies(
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
    final response = await _movieApiClient.getMovieDetails(movieId);
    return MoviesDetailEntityMapper().convertToMoviesDetailsEntity(response);
  }

  @override
  Future<MoviesSuggestionResultEntity> getMovieSuggestions(int movieId) async {
    final response = await _movieApiClient.getMovieSuggestions(movieId);
    return MoviesSuggestionMapper().convertToMoviesSuggestionEntity(response);
  }

  @override
  Future<AddMovieToFavoriteEntity> addMovieToFavoriteList(
    String movieId,
    String name,
    double rating,
    String imageURL,
    String year,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString("token");
    final response = await _apiClient.addMovieToFavorite(
      AddFavoriteMovieRequest(
        movieId: movieId,
        name: name,
        rating: rating,
        imageURL: imageURL,
        year: year,
      ),
        "Bearer $token",
    );
    return AddMovieToFavoriteMapper.convertResponseToAddMovieFavoriteMapper(response);
  }

  @override
  Future<GetFavoriteMoviesResponse> getAllFavoriteMovies() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString("token");
    final response = await _apiClient.getAllFavoriteMovies(
      "Bearer $token",
    );
    return response;
  }

  @override
  Future<String> removeMovieFromFavoriteList(String movieId) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString("token");
    final response = await _apiClient.removeMovieFromFavoriteList(
      movieId,
      "Bearer $token",
    );
    return response.message??"";
  }

  @override
  Future<bool> isMovieInFavList(String movieId) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString("token");
    final response = await _apiClient.checkIfMovieIsInFavList(
      movieId,
      "Bearer $token",
    );
    return response.data??false;
  }
}
