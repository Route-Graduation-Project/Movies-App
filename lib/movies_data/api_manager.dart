import 'package:dio/dio.dart';
import 'package:movies_app/movies_data/movies_list_response.dart';

class ApiManager {
  String baseUrl = "yts.lt";

  Future<MoviesListResponse> get3DMovies() async {
    Dio dio = Dio();
    Uri uri = Uri.http(baseUrl, "/api/v2/list_movies.json");
    final response = await dio.getUri(uri);

    MoviesListResponse movies3D = MoviesListResponse.fromJson(response.data);

    print(movies3D.status);
    print(movies3D.statusMessage);
    print(movies3D.data);

    return movies3D;
  }
}
