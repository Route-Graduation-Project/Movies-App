import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/models/movie_details_response.dart';
import 'package:movies_app/data/models/movie_list_response.dart';
import 'package:movies_app/data/models/movie_suggestions_response.dart';
import 'package:retrofit/retrofit.dart';

part 'movies_api_client.g.dart';

@singleton
@RestApi(baseUrl: "https://yts.lt/api/v2/")
abstract class MoviesApiClient {
  @factoryMethod
  factory MoviesApiClient(Dio dio) = _MoviesApiClient;

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
  Future<MovieDetailsResponse> getMovieDetails(
    @Query("movie_id") int movieId, {
    @Query("with_images") bool? withImages,
    @Query("with_cast") bool? withCast,
  });

  @GET("movie_suggestions.json")
  Future<MovieSuggestionsResponse> getMovieSuggestions(
    @Query("movie_id") int movieId,
  );
}
