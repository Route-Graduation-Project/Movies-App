class MovieDetailsEntity {
    int? id;
    	String? statusMessage;
  String? url;
  String? title;
  String? titleEnglish;
  int? year;
  double? rating;
  int? runtime;
  List<String>? genres;
  int? likeCount;
  String? descriptionIntro;
  String? descriptionFull;
  String? backgroundImage;
  String? backgroundImageOriginal;
  String? smallCoverImage;
  String? mediumCoverImage;
  String? largeCoverImage;
  String? mediumScreenshotImage1;
  String? mediumScreenshotImage2;
  String? mediumScreenshotImage3;
  String? largeScreenshotImage1;
  String? largeScreenshotImage2;
  String? largeScreenshotImage3;
  List<CastEntity>? cast;
  MovieDetailsEntity({
    required this.id,
    required this.statusMessage,
    required this.backgroundImage,
    required this.backgroundImageOriginal,
    required this.cast,
    required this.descriptionFull,
    required this.descriptionIntro,
    required this.genres,
    required this.largeCoverImage,
    required this.largeScreenshotImage1,
    required this.largeScreenshotImage2,
    required this.largeScreenshotImage3,
    required this.likeCount,
    required this.mediumCoverImage,
    required this.mediumScreenshotImage1,
    required this.mediumScreenshotImage2,
    required this.mediumScreenshotImage3,
    required this.rating,
    required this.runtime,
    required this.smallCoverImage,
    required this.title,
    required this.titleEnglish,
    required this.url,
    required this.year,
  });
}

class CastEntity {
  String? name;
  String? characterName;
  String? urlSmallImage;

  CastEntity({this.name, this.characterName, this.urlSmallImage});
}
