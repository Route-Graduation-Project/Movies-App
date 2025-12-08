import 'package:dio/dio.dart';
import 'package:movies_app/data/models/movies_details/movies_details_response/movies_details_response.dart';
import 'package:movies_app/data/models/movies_suggestion/movies_suggestions_reponse/movies_suggestions_reponse.dart';
import 'package:retrofit/retrofit.dart';

part 'movies_api_client.g.dart';

@RestApi(baseUrl: "https://yts.lt/api/v2/")
abstract class MoviesApiClient {
  factory MoviesApiClient(Dio dio) = _MoviesApiClient;

  @GET("movie_details.json?with_images=true&with_cast=true")
  Future<MoviesDetailsResponse> moviesDetails(@Query('movie_id') int movieId);
  @GET("movie_suggestions.json?")
  Future<MoviesSuggestionsReponse> moviesSuggestion(
    @Query('movie_id') int movieId,
  );
}
