class MoviesSuggestionResultEntity {
  final String? message;
  final List<MoviesSuggestionEntity> movies;

  MoviesSuggestionResultEntity({required this.message, required this.movies});
}

class MoviesSuggestionEntity {
  int? id;
  String? url;
  String? backgroundImage;
  String? backgroundImageOriginal;
  String? smallCoverImage;
  String? mediumCoverImage;
  double? rating;
  MoviesSuggestionEntity({
    required this.id,
    required this.backgroundImage,
    required this.backgroundImageOriginal,
    required this.mediumCoverImage,
    required this.rating,
    required this.smallCoverImage,
    required this.url,
  });
}
