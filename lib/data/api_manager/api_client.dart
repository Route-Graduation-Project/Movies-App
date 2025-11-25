import 'package:dio/dio.dart';
import 'package:movies_app/data/models/login_responce.dart';
import 'package:retrofit/retrofit.dart';

import '../models/login_request.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://route-movie-apis.vercel.app/")
abstract class ApiClient{
  factory ApiClient(Dio dio,) = _ApiClient;
  
  @POST("auth/login")
  Future<LoginResponse> loginWithEmailAndPassword(@Body() LoginRequest body);


}