import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/domain/entity/movie_entity.dart';

class MovieMapper {
  static MovieEntity toEntity(MovieModel model) {
    return MovieEntity(
      id: model.id ?? 0,
      title: model.title ?? '',
      backgroundImage: model.backgroundImage,
      smallCoverImage: model.smallCoverImage,
      mediumCoverImage: model.mediumCoverImage,
      largeCoverImage: model.largeCoverImage,
      rating: model.rating,
      year: model.year,
      runtime: model.runtime,
      genres: model.genres,
      summary: model.summary,
      descriptionFull: model.descriptionFull,
      synopsis: model.synopsis,
      ytTrailerCode: model.ytTrailerCode,
      language: model.language,
      mpaRating: model.mpaRating,
      state: model.state,
    );
  }
}
