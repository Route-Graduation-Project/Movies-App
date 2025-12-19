import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/data/api_manager/api_client.dart';
import 'package:movies_app/data/mappers/add_movie_to_favorite_mapper.dart';
import 'package:movies_app/data/models/favorite_movies/add_favorite_movie_request.dart';
import 'package:movies_app/data/models/favorite_movies/get_favorite_movies_response.dart';
import 'package:movies_app/domain/entity/add_movie_to_favorite_entity.dart';
import 'package:movies_app/domain/entity/movie_details_entity.dart';
import 'package:movies_app/domain/entity/movie_entity.dart';
import 'package:movies_app/domain/entity/movies_suggestion_entity.dart';
import 'package:movies_app/domain/repository/movies_api_remote_data.dart';
import 'package:movies_app/domain/repository/movies_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: MoviesRepository)
class MovieRepoImpl implements MoviesRepository {
  final MoviesApiData _moviesApiData = getIt();
  final ApiClient _apiClient = getIt();

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
      bool connected = await _isConnected();
      if (connected) {
        return await _moviesApiData.getMovies(
          limit: limit,
          page: page,
          quality: quality,
          minimumRating: minimumRating,
          queryTerm: queryTerm,
          genre: genre,
          sortBy: sortBy,
          orderBy: orderBy,
        );
      } else {
        throw ("There is no connection. Check the connection and try again");
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MovieDetailsEntity> getMovieDetails({required movieId}) async {
    try {
      bool connected = await _isConnected();
      if (connected) {
        var response = await _moviesApiData.getMovieDetails(movieId: movieId);
        return response;
      } else {
        throw ("There is no connection. Check the connection and try again");
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MoviesSuggestionResultEntity> getMovieSuggestions({
    required int movieId,
  }) async {
    try {
      bool connected = await _isConnected();
      if (connected) {
        var response = await _moviesApiData.getMovieSuggestions(
          movieId: movieId,
        );
        return response;
      } else {
        throw ("There is no connection. Check the connection and try again");
      }
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
      bool connected = await _isConnected();
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("token");
      if (connected) {
        var response = await _apiClient.addMovieToFavorite(
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
      } else {
        throw ("There is no connection. Check the connection and try again");
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<GetFavoriteMoviesResponse> getAllFavoriteMovies() async {
    bool connected = await _isConnected();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString("token");
    try {
      if (connected) {
        var response = await _apiClient.getAllFavoriteMovies("Bearer $token");
        return response;
      } else {
        throw ("There is no connection. Check the connection and try again");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> _isConnected() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    return (connectivityResult.contains(ConnectivityResult.ethernet) ||
        connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile));
  }

  @override
  Future<String> removeMovieFromFavoriteList(String movieId) async {
    bool connected = await _isConnected();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString("token");
    try {
      if (connected) {
        var response = await _apiClient.removeMovieFromFavoriteList(
          movieId,
          "Bearer $token",
        );
        return response.message??"";
      } else {
        throw ("There is no connection. Check the connection and try again");
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> isMovieInFavList(String movieId) async{
    bool connected = await _isConnected();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString("token");
    try {
      if (connected) {
        var response = await _apiClient.checkIfMovieIsInFavList(
          movieId,
          "Bearer $token",
        );
        return response.data??false;
      } else {
        throw ("There is no connection. Check the connection and try again");
      }
    } catch (e) {
      rethrow;
    }
  }
}
