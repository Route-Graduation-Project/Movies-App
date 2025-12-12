import 'cast_model.dart';

class MovieModel {
  final int? id;
  final String? url;
  final String? imdbCode;
  final String? title;
  final String? titleEnglish;
  final String? titleLong;
  final String? slug;
  final int? year;
  final double? rating;
  final int? runtime;
  final List<String>? genres;
  final String? summary;
  final String? descriptionFull;
  final String? synopsis;
  final String? ytTrailerCode;
  final String? language;
  final String? mpaRating;
  final String? backgroundImage;
  final String? backgroundImageOriginal;
  final String? smallCoverImage;
  final String? mediumCoverImage;
  final String? largeCoverImage;
  final String? state;
  final String? dateUploaded;
  final int? dateUploadedUnix;
  final int? likeCount;
  final String? descriptionIntro;
  final String? mediumScreenshotImage1;
  final String? mediumScreenshotImage2;
  final String? mediumScreenshotImage3;
  final String? largeScreenshotImage1;
  final String? largeScreenshotImage2;
  final String? largeScreenshotImage3;
  final List<CastModel>? cast;

  MovieModel({
    this.id,
    this.url,
    this.imdbCode,
    this.title,
    this.titleEnglish,
    this.titleLong,
    this.slug,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.summary,
    this.descriptionFull,
    this.synopsis,
    this.ytTrailerCode,
    this.language,
    this.mpaRating,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.state,
    this.dateUploaded,
    this.dateUploadedUnix,
    this.likeCount,
    this.descriptionIntro,
    this.mediumScreenshotImage1,
    this.mediumScreenshotImage2,
    this.mediumScreenshotImage3,
    this.largeScreenshotImage1,
    this.largeScreenshotImage2,
    this.largeScreenshotImage3,
    this.cast,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      url: json['url'],
      imdbCode: json['imdb_code'],
      title: json['title'],
      titleEnglish: json['title_english'],
      titleLong: json['title_long'],
      slug: json['slug'],
      year: json['year'],
      rating: (json['rating'] as num?)?.toDouble(),
      runtime: json['runtime'],
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      summary: json['summary'],
      descriptionFull: json['description_full'],
      synopsis: json['synopsis'],
      ytTrailerCode: json['yt_trailer_code'],
      language: json['language'],
      mpaRating: json['mpa_rating'],
      backgroundImage: json['background_image'],
      backgroundImageOriginal: json['background_image_original'],
      smallCoverImage: json['small_cover_image'],
      mediumCoverImage: json['medium_cover_image'],
      largeCoverImage: json['large_cover_image'],
      state: json['state'],
      dateUploaded: json['date_uploaded'],
      dateUploadedUnix: json['date_uploaded_unix'],
      likeCount: json['like_count'],
      descriptionIntro: json['description_intro'],
      mediumScreenshotImage1: json['medium_screenshot_image1'],
      mediumScreenshotImage2: json['medium_screenshot_image2'],
      mediumScreenshotImage3: json['medium_screenshot_image3'],
      largeScreenshotImage1: json['large_screenshot_image1'],
      largeScreenshotImage2: json['large_screenshot_image2'],
      largeScreenshotImage3: json['large_screenshot_image3'],
      cast:
          (json['cast'] as List<dynamic>?)
              ?.map((e) => CastModel.fromJson(e))
              .toList(),
    );
  }
}
