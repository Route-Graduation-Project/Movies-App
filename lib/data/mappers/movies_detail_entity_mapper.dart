import 'package:movies_app/data/models/cast_model.dart';
import 'package:movies_app/data/models/movie_details_response.dart';
import 'package:movies_app/domain/entity/movie_details_entity.dart';

class MoviesDetailEntityMapper {
  MovieDetailsEntity convertToMoviesDetailsEntity(
    MovieDetailsResponse response,
  ) {
    return MovieDetailsEntity(
      statusMessage: response.statusMessage,
      id: response.data?.movie?.id,
      backgroundImage: response.data?.movie?.backgroundImage,
      backgroundImageOriginal: response.data?.movie?.backgroundImageOriginal,
      cast: response.data?.movie?.cast?.map((e) => _mapCast(e)).toList() ?? [],
      descriptionFull: response.data?.movie?.descriptionFull,
      descriptionIntro: response.data?.movie?.descriptionIntro,
      genres: response.data?.movie?.genres,
      largeCoverImage: response.data?.movie?.largeCoverImage,
      largeScreenshotImage1: response.data?.movie?.largeScreenshotImage1,
      largeScreenshotImage2: response.data?.movie?.largeScreenshotImage2,
      largeScreenshotImage3: response.data?.movie?.largeScreenshotImage3,
      likeCount: response.data?.movie?.likeCount,
      mediumCoverImage: response.data?.movie?.mediumCoverImage,
      mediumScreenshotImage1: response.data?.movie?.mediumScreenshotImage1,
      mediumScreenshotImage2: response.data?.movie?.mediumScreenshotImage2,
      mediumScreenshotImage3: response.data?.movie?.mediumScreenshotImage3,
      rating: response.data?.movie?.rating,
      runtime: response.data?.movie?.runtime,
      smallCoverImage: response.data?.movie?.smallCoverImage,
      title: response.data?.movie?.title,
      titleEnglish: response.data?.movie?.titleEnglish,
      url: response.data?.movie?.url,
      year: response.data?.movie?.year,
    );
  }

  CastEntity _mapCast(CastModel model) {
    return CastEntity(
      name: model.name,
      characterName: model.characterName,
      urlSmallImage: model.urlSmallImage,
    );
  }
}
