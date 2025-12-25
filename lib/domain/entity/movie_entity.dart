class MovieEntity {
  final int id;
  final String title;
  final String? backgroundImage;
  final String? smallCoverImage;
  final String? mediumCoverImage;
  final String? largeCoverImage;
  final double? rating;
  final int? year;
  final int? runtime;
  final List<String>? genres;
  final String? summary;
  final String? descriptionFull;
  final String? synopsis;
  final String? ytTrailerCode;
  final String? language;
  final String? mpaRating;
  final String? state;

  MovieEntity({
    required this.id,
    required this.title,
    this.backgroundImage,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.rating,
    this.year,
    this.runtime,
    this.genres,
    this.summary,
    this.descriptionFull,
    this.synopsis,
    this.ytTrailerCode,
    this.language,
    this.mpaRating,
    this.state,
  });
}
