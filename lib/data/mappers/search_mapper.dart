import 'package:movies_app/data/models/search_response/movie.dart';
import 'package:movies_app/domain/entity/search_entity.dart';

class SearchMapper {
  List<SearchEntity> convertToListSearchEntity(List<Movie> movies) {
    final response = movies.map((e) => _convertToSearchEntity(e)).toList();
    return response;
  }

  SearchEntity _convertToSearchEntity(Movie response) {
    return SearchEntity(
      id: response.id,
      largeCoverImage: response.largeCoverImage,
      mediumCoverImage: response.mediumCoverImage,
      rating: response.rating,
    );
  }
}
