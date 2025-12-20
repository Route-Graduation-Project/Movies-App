part of 'home_cubit.dart';

class HomeState {
  bool isMovieOfDateLoading;
  bool isMovieOfGenresLoading;
  Set<int> clickedMovieIds;
  List<MovieEntity>? moviesSortedByDate;
  List<MovieEntity>? moviesSortedByGenres;

  List<String> genres = [
    'Comedy',
    'Romance',
    'Biography',
    'Documentary',
    'Music',
    'Horror',
    'Thriller',
    'Drama',
    'Fantasy',
    'Sci-Fi',
    'Action',
    'War',
    'Mystery',
    'Family',
    'Sport',
    'Adventure',
  ];
  int? indexOfGenres;

  HomeState({
    this.isMovieOfDateLoading = false,
    this.isMovieOfGenresLoading = false,
    this.moviesSortedByDate,
    this.moviesSortedByGenres,
    this.indexOfGenres = 0,
    Set<int>? clickedMovieIds,
  }) : clickedMovieIds = clickedMovieIds ?? {};

  HomeState copyWith({
    List<MovieEntity>? moviesSortedByDate,
    List<MovieEntity>? moviesSortedByGenres,
    bool isMovieOfDateLoading = false,
    bool isMovieOfGenresLoading = false,
    int? indexOfGenres,
    Set<int>? clickedMovieIds,
  }) {
    return HomeState(
      moviesSortedByDate: moviesSortedByDate ?? this.moviesSortedByDate,
      moviesSortedByGenres: moviesSortedByGenres ?? this.moviesSortedByGenres,
      isMovieOfGenresLoading: isMovieOfGenresLoading,
      isMovieOfDateLoading: isMovieOfDateLoading,
      indexOfGenres: indexOfGenres ?? this.indexOfGenres,
      clickedMovieIds: clickedMovieIds ?? this.clickedMovieIds,
    );
  }
}

sealed class HomeAction {}

class SetupHome extends HomeAction {}

class GetMovieList extends HomeAction {}

class GoToDetailsScreenAction extends HomeAction {
  int movieId;
  GoToDetailsScreenAction(this.movieId);
}

sealed class NavigationHome {}

class NavigateToMovieDetails extends NavigationHome {
  int movieID;
  NavigateToMovieDetails(this.movieID);
}
