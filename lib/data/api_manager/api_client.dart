import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/models/favorite_movies/add_favorite_movie_request.dart';
import 'package:movies_app/data/models/favorite_movies/add_favorite_movie_response.dart';
import 'package:movies_app/data/models/favorite_movies/get_favorite_movies_response.dart';
import 'package:movies_app/data/models/favorite_movies/is_movie_in_favorite_list_response.dart';
import 'package:movies_app/data/models/favorite_movies/remove_movie_from_favorite_list_response.dart';
import 'package:movies_app/data/models/login_responce.dart';
import 'package:movies_app/data/models/register_request.dart';
import 'package:movies_app/data/models/register_response.dart';
import 'package:retrofit/retrofit.dart';

import '../models/login_request.dart';

part 'api_client.g.dart';

@singleton
@RestApi(baseUrl: "https://route-movie-apis.vercel.app/")
abstract class ApiClient {

  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @POST("auth/login")
  Future<LoginResponse> loginWithEmailAndPassword(@Body() LoginRequest body);

  @POST("auth/register")
  Future<RegisterResponse> register(@Body() RegisterRequest body);

  @POST("favorites/add")
  Future<AddFavoriteMovieResponse> addMovieToFavorite(@Body() AddFavoriteMovieRequest request, @Header("Authorization") String token);

  @GET("favorites/all")
  Future<GetFavoriteMoviesResponse> getAllFavoriteMovies(@Header("Authorization") String token);
  
  @DELETE("favorites/remove/{movieId}")
  Future<RemoveMovieFromFavoriteListResponse> removeMovieFromFavoriteList(@Path("movieId") String movieId,@Header("Authorization") String token,);

  @GET("favorites/is-favorite/{movieId}")
  Future<IsMovieInFavoriteListResponse> checkIfMovieIsInFavList(@Path("movieId") String movieId,@Header("Authorization") String token,);

}
