import 'package:injectable/injectable.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/data/api_manager/movies_api_client.dart';
import 'package:movies_app/data/mappers/movies_detail_entity_mapper.dart';
import 'package:movies_app/data/mappers/movies_suggestion_mapper.dart';
import 'package:movies_app/domain/entity/movie_details_entity.dart';
import 'package:movies_app/domain/entity/movies_suggestion_entity.dart';
import 'package:movies_app/domain/repository/movies_api_remote_data.dart';


@Injectable(as: MoviesApiData)
class MoviesApiRemoteImpl implements MoviesApiData {
  MoviesApiClient moviesApiClient = getIt();
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
  Future<MoviesSuggestionResultEntity> getMovieSuggestions({
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
