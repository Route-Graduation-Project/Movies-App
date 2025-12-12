import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/data_source/movies_remote_data_source_impl.dart';
import 'package:movies_app/data/repository_imp/movies_repository_impl.dart';
import 'package:movies_app/domain/entity/movie_entity.dart';
import 'package:movies_app/domain/repository/movies_repository.dart';

part 'movie_details_state.dart';

MovieDetailsCubit injectionMovieDetailsCubit() {
  return MovieDetailsCubit(
    moviesRepository: MoviesRepositoryImpl(MoviesRemoteDataSourceImpl()),
  );
}

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final MoviesRepository moviesRepository;

  MovieDetailsCubit({required this.moviesRepository})
    : super(MovieDetailsInitial());

  Future<void> getMovieDetails(int movieId) async {
    emit(MovieDetailsLoading());
    try {
      final movie = await moviesRepository.getMovieDetails(movieId);
      final suggestions = await moviesRepository.getMovieSuggestions(movieId);
      emit(MovieDetailsSuccess(movie: movie, suggestions: suggestions));
    } catch (e) {
      emit(MovieDetailsError(e.toString()));
    }
  }
}
