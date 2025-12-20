import 'package:dio/dio.dart';

class YtsApiService {
  final Dio _dio = Dio();

  Future<List<dynamic>> searchMovies(String query) async {
    final response = await _dio.get(
      'https://yts.mx/api/v2/list_movies.json',
      queryParameters: {
        'query_term': query,
        'limit': 20,
      },
    );

    return response.data['data']['movies'] ?? [];
  }
}