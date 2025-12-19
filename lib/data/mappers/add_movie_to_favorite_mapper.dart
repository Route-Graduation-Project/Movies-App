import 'package:movies_app/data/models/favorite_movies/add_favorite_movie_response.dart';
import 'package:movies_app/domain/entity/add_movie_to_favorite_entity.dart';

class AddMovieToFavoriteMapper{
  static AddMovieToFavoriteEntity convertResponseToAddMovieFavoriteMapper(AddFavoriteMovieResponse response)
  {
    return AddMovieToFavoriteEntity(
      message: response.message,
      movieId: response.data!.movieId,
      imageURL: response.data!.imageURL,
      rating: response.data!.rating!.toInt(),
    );
  }
}