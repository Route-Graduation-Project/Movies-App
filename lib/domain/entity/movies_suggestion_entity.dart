class MoviesSuggestionEntity {
  String? url;
  String? backgroundImage;
  String? backgroundImageOriginal;
  String? smallCoverImage;
  String? mediumCoverImage;
  double? rating;
  MoviesSuggestionEntity({
    required this.backgroundImage,
    required this.backgroundImageOriginal,
    required this.mediumCoverImage,
    required this.rating,
    required this.smallCoverImage,
    required this.url,
  });
}
