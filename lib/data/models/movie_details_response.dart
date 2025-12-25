import 'movie_model.dart';

class MovieDetailsResponse {
  final String? status;
  final String? statusMessage;
  final MovieDetailsData? data;

  MovieDetailsResponse({this.status, this.statusMessage, this.data});

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) {
    return MovieDetailsResponse(
      status: json['status'],
      statusMessage: json['status_message'],
      data:
          json['data'] != null ? MovieDetailsData.fromJson(json['data']) : null,
    );
  }
}

class MovieDetailsData {
  final MovieModel? movie;

  MovieDetailsData({this.movie});

  factory MovieDetailsData.fromJson(Map<String, dynamic> json) {
    return MovieDetailsData(
      movie: json['movie'] != null ? MovieModel.fromJson(json['movie']) : null,
    );
  }
}
