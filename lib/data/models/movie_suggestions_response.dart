import 'movie_model.dart';

class MovieSuggestionsResponse {
  final String? status;
  final String? statusMessage;
  final MovieSuggestionsData? data;

  MovieSuggestionsResponse({this.status, this.statusMessage, this.data});

  factory MovieSuggestionsResponse.fromJson(Map<String, dynamic> json) {
    return MovieSuggestionsResponse(
      status: json['status'],
      statusMessage: json['status_message'],
      data:
          json['data'] != null
              ? MovieSuggestionsData.fromJson(json['data'])
              : null,
    );
  }
}

class MovieSuggestionsData {
  final int? movieCount;
  final List<MovieModel>? movies;

  MovieSuggestionsData({this.movieCount, this.movies});

  factory MovieSuggestionsData.fromJson(Map<String, dynamic> json) {
    return MovieSuggestionsData(
      movieCount: json['movie_count'],
      movies:
          (json['movies'] as List<dynamic>?)
              ?.map((e) => MovieModel.fromJson(e))
              .toList(),
    );
  }
}
