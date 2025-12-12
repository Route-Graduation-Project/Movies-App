import 'package:movies_app/data/models/movie_suggestions_response.dart';
import 'package:movies_app/domain/entity/movies_suggestion_entity.dart';

class MoviesSuggestionMapper {
  MoviesSuggestionResultEntity convertToMoviesSuggestionEntity(
    MovieSuggestionsResponse response,
  ) {
    final movies =
        response.data?.movies
            ?.map(
              (e) => MoviesSuggestionEntity(
                backgroundImage: e.backgroundImage,
                backgroundImageOriginal: e.backgroundImageOriginal,
                mediumCoverImage: e.mediumCoverImage,
                rating: e.rating,
                smallCoverImage: e.smallCoverImage,
                url: e.url,
                id: e.id,
              ),
            )
            .toList() ??
        [];
    return MoviesSuggestionResultEntity(
      message: response.statusMessage,
      movies: movies,
    );
  }
}
