part of 'movie_details_cubit.dart';

abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsSuccess extends MovieDetailsState {
  final MovieDetailsEntity movie;
  final MoviesSuggestionResultEntity suggestions;

  MovieDetailsSuccess({required this.movie, required this.suggestions});
}

class MovieDetailsError extends MovieDetailsState {
  final String message;
  MovieDetailsError(this.message);
}
