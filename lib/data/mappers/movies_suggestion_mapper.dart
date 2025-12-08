import 'package:movies_app/data/models/movies_suggestion/movies_suggestions_reponse/movies_suggestions_reponse.dart';
import 'package:movies_app/domain/entity/movies_suggestion_entity.dart';

class MoviesSuggestionMapper {
  List<MoviesSuggestionEntity> convertToMoviesSuggestionEntity(
    MoviesSuggestionsReponse response,
  ) {
    return response.data?.movies
            ?.map(
              (e) => MoviesSuggestionEntity(
                backgroundImage: e.backgroundImage,
                backgroundImageOriginal: e.backgroundImageOriginal,
                mediumCoverImage: e.mediumCoverImage,
                rating: e.rating,
                smallCoverImage: e.smallCoverImage,
                url: e.url,
              ),
            )
            .toList() ??
        [];
  }
}
