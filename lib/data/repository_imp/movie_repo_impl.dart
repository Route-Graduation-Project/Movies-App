import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:movies_app/domain/entity/movie_details_entity.dart';
import 'package:movies_app/domain/entity/movies_suggestion_entity.dart';
import 'package:movies_app/domain/repository/movies_api_remote_data.dart';
import 'package:movies_app/domain/repository/movies_repository.dart';

class MovieRepoImpl implements MoviesRepository {
  final MoviesApiData _moviesApiData;
  MovieRepoImpl(this._moviesApiData);

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

  Future<bool> _isConnected() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    return (connectivityResult.contains(ConnectivityResult.ethernet) ||
        connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile));
  }
}
