import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/movie_list_response.dart';
import '../models/movie_details_response.dart';
import '../models/movie_suggestions_response.dart';

part 'movies_api_client.g.dart';

@RestApi(baseUrl: "https://yts.mx/api/v2/")
abstract class MoviesApiClient {
  factory MoviesApiClient(Dio dio, {String baseUrl}) = _MoviesApiClient;

  @GET("list_movies.json")
  Future<MovieListResponse> getMovies({
    @Query("limit") int? limit,
    @Query("page") int? page,
    @Query("quality") String? quality,
    @Query("minimum_rating") int? minimumRating,
    @Query("query_term") String? queryTerm,
    @Query("genre") String? genre,
    @Query("sort_by") String? sortBy,
    @Query("order_by") String? orderBy,
  });

  @GET("movie_details.json")
  Future<MovieDetailsResponse> getMovieDetails(@Query("movie_id") int movieId);

  @GET("movie_suggestions.json")
  Future<MovieSuggestionsResponse> getMovieSuggestions(
    @Query("movie_id") int movieId,
  );
}
