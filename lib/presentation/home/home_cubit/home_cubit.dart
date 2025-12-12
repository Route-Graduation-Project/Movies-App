import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/data_source/movies_remote_data_source_impl.dart';
import 'package:movies_app/data/repository_imp/movies_repository_impl.dart';
import 'package:movies_app/domain/entity/movie_entity.dart';
import 'package:movies_app/domain/repository/movies_repository.dart';

part 'home_state.dart';

HomeCubit injectionHomeCubit() {
  return HomeCubit(
    moviesRepository: MoviesRepositoryImpl(MoviesRemoteDataSourceImpl()),
  );
}

class HomeCubit extends Cubit<HomeState> {
  final MoviesRepository moviesRepository;

  HomeCubit({required this.moviesRepository}) : super(HomeInitial());

  Future<void> getPopularMovies() async {
    emit(HomeLoading());
    try {
      final movies = await moviesRepository.getMovies();
      emit(HomeSuccess(movies));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
