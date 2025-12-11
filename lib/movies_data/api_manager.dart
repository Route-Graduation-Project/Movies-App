import 'package:dio/dio.dart';

import 'movies_list_3d_response.dart';

class ApiManager {
  String baseUrl = "yts.lt";

  Future<MoviesList3dResponse> get3DMovies() async {
    Dio dio = Dio();
    Uri uri = Uri.http(baseUrl, "/api/v2/list_movies.json", {"quality": "3D"});
    final response = await dio.getUri(uri);

    MoviesList3dResponse movies3D = MoviesList3dResponse.fromJson(response.data);

    print(movies3D.status);
    print(movies3D.statusMessage);
    print(movies3D.data);

    return movies3D;
  }
}
