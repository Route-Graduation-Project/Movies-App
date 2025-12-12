part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<MovieEntity> movies;
  HomeSuccess(this.movies);
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
