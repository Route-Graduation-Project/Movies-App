import 'movie_model.dart';

class MovieListResponse {
  final String? status;
  final String? statusMessage;
  final MovieListData? data;

  MovieListResponse({this.status, this.statusMessage, this.data});

  factory MovieListResponse.fromJson(Map<String, dynamic> json) {
    return MovieListResponse(
      status: json['status'],
      statusMessage: json['status_message'],
      data: json['data'] != null ? MovieListData.fromJson(json['data']) : null,
    );
  }
}

class MovieListData {
  final int? movieCount;
  final int? limit;
  final int? pageNumber;
  final List<MovieModel>? movies;

  MovieListData({this.movieCount, this.limit, this.pageNumber, this.movies});

  factory MovieListData.fromJson(Map<String, dynamic> json) {
    return MovieListData(
      movieCount: json['movie_count'],
      limit: json['limit'],
      pageNumber: json['page_number'],
      movies:
          (json['movies'] as List<dynamic>?)
              ?.map((e) => MovieModel.fromJson(e))
              .toList(),
    );
  }
}
