import 'package:movies_app/data/api_manager/movies_api_client.dart';
import 'package:movies_app/data/api_manager/shared_dio.dart';
import 'package:movies_app/data/mappers/movies_detail_entity_mapper.dart';
import 'package:movies_app/data/mappers/movies_suggestion_mapper.dart';
import 'package:movies_app/domain/entity/movie_details_entity.dart';
import 'package:movies_app/domain/entity/movies_suggestion_entity.dart';
import 'package:movies_app/domain/repository/movies_api_remote_data.dart';

class MoviesApiRemoteImpl implements MoviesApiData {
  MoviesApiClient moviesApiClient = MoviesApiClient(sharedDio());
  @override
  Future<MovieDetailsEntity> getMovieDetails({required int movieId}) async {
    try {
      var response = await moviesApiClient.moviesDetails(movieId);
      return MoviesDetailEntityMapper().convertToMoviesDetailsEntity(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MoviesSuggestionEntity>> getMovieSuggestions({
    required int movieId,
  }) async {
    try {
      var response = await moviesApiClient.moviesSuggestion(movieId);
      return MoviesSuggestionMapper().convertToMoviesSuggestionEntity(response);
    } catch (e) {
      rethrow;
    }
  }
}
