import 'package:movies_app/domain/entity/movie_details_entity.dart';
import 'package:movies_app/domain/entity/movies_suggestion_entity.dart';

class MovieDetailsState {
  int? id;
  String? url;
  String? title;
  int? year;
  double? rating;
  int? runtime;
  List<String>? genres;
  int? likeCount;
  String? descriptionFull;
  String? largeCoverImage;
  String? mediumScreenshotImage1;
  String? mediumScreenshotImage2;
  String? mediumScreenshotImage3;
  List<CastEntity>? cast;

  List<MoviesSuggestionEntity>? movieSuggestions;

  bool isLoading;
  bool isFavorite;

  MovieDetailsState({
    this.id,
    this.url,
    this.title,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.likeCount,
    this.descriptionFull,
    this.largeCoverImage,
    this.mediumScreenshotImage1,
    this.mediumScreenshotImage2,
    this.mediumScreenshotImage3,
    this.cast,
    this.movieSuggestions,
    this.isLoading = false,
    this.isFavorite = false,
  });

  MovieDetailsState copyWith({
    int? id,
    String? url,
    String? title,
    int? year,
    double? rating,
    int? runtime,
    List<String>? genres,
    int? likeCount,
    String? descriptionFull,
    String? largeCoverImage,
    String? mediumScreenshotImage1,
    String? mediumScreenshotImage2,
    String? mediumScreenshotImage3,
    List<CastEntity>? cast,
    List<MoviesSuggestionEntity>? movieSuggestions,
    bool loading = false,
    bool? favorite,
  }) {
    return MovieDetailsState(
      id: id ?? this.id,
      url: url ?? this.url,
      title: title ?? this.title,
      year: year ?? this.year,
      rating: rating ?? this.rating,
      runtime: runtime ?? this.runtime,
      genres: genres ?? this.genres,
      likeCount: likeCount ?? this.likeCount,
      descriptionFull: descriptionFull ?? this.descriptionFull,
      largeCoverImage: largeCoverImage ?? this.largeCoverImage,
      mediumScreenshotImage1:
          mediumScreenshotImage1 ?? this.mediumScreenshotImage1,
      mediumScreenshotImage2:
          mediumScreenshotImage2 ?? this.mediumScreenshotImage2,
      mediumScreenshotImage3:
          mediumScreenshotImage3 ?? this.mediumScreenshotImage3,
      cast: cast ?? this.cast,
      movieSuggestions: movieSuggestions ?? this.movieSuggestions,
      isLoading: loading,
      isFavorite: favorite ?? isFavorite,
    );
  }
}

sealed class MovieDetailsActions {}

class Setup extends MovieDetailsActions {}

class RemoveMovieFromFavorite extends MovieDetailsActions {
  String movieId;
  RemoveMovieFromFavorite(this.movieId);
}

class AddMovieToFavorite extends MovieDetailsActions {
  String name;
  double rating;
  String imageURL;
  String year;
  String movieId;
  AddMovieToFavorite(
    this.imageURL,
    this.name,
    this.rating,
    this.year,
    this.movieId,
  );
}

class GetMovieDetails extends MovieDetailsActions {
  int movieID;

  GetMovieDetails(this.movieID);
}

class GoToMovieSuggestion extends MovieDetailsActions {
  int movieID;

  GoToMovieSuggestion(this.movieID);
}

class GoBack extends MovieDetailsActions {}

class WatchMovie extends MovieDetailsActions {
  String url;
  WatchMovie(this.url);
}

sealed class MovieDetailsNavigation {}

class NavigateToMovieDetails extends MovieDetailsNavigation {
  int? movieId;

  NavigateToMovieDetails(this.movieId);
}

class NavigateToBack extends MovieDetailsNavigation {}

class NavigateToWatchMovie extends MovieDetailsNavigation {
  String url;
  NavigateToWatchMovie(this.url);
}
