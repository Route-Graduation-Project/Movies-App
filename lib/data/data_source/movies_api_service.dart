import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/movie_model.dart';

class MoviesApiService {
  static const String _baseUrl = 'https://yts.mx/api/v2/list_movies.json';

  Future<List<MovieModel>> getMovies() async {
    final uri = Uri.parse(_baseUrl);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List moviesJson = data['data']['movies'] ?? [];

      return moviesJson
          .map((movieJson) => MovieModel.fromJson(movieJson))
          .toList();
    } else {
      throw Exception('Failed to load movies. Code: ${response.statusCode}');
    }
  }
}