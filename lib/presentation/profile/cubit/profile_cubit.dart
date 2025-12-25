import 'package:injectable/injectable.dart';
import 'package:movies_app/core/base/base_cubit.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/domain/entity/movie_entity.dart';
import 'package:movies_app/domain/use_case/use_case.dart';
import 'package:movies_app/presentation/home/home_cubit/home_cubit.dart';
import 'package:movies_app/presentation/profile/cubit/profile_state.dart';
import 'package:movies_app/update_data/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class ProfileCubit
    extends BaseCubit<ProfileState, ProfileActions, ProfileNavigations> {
  ProfileCubit() : super(ProfileState());
  ApiManager apiManager = ApiManager();
  UseCase useCase = getIt();
  HomeCubit cubit = getIt();

  @override
  Future<void> doAction(ProfileActions action) async {
    switch (action) {
      case GetProfileData():
        {
          _getProfile();
        }
      case GetAllFavMovies():
        {
          _getAllFavoriteMovies();
        }
      case GetAllHistoryMovies():
        {
          _getMovieHistory();
        }
    }
  }

  Future<void> _getProfile() async {
    emit(state.copyWith(isLoading: true));
    try {
      var response = await apiManager.getProfile();
      List<MovieEntity> favMovie = await _getAllFavoriteMovies();
      List<MovieEntity> historyMovie = await _getMovieHistory();
      emit(
        state.copyWith(
          name: response.data?.name ?? 'unKnown',
          avatarID: response.data?.avaterId,
          historyMovie: historyMovie,
          movies: favMovie,
          wishListNumber: favMovie.length,
          historyListNumber: historyMovie.length,
        ),
      );
    } catch (e) {
      rethrow;
    } finally {
      emit(state.copyWith(isLoading: false,));
    }
  }

  Future<List<MovieEntity>> _getMovieHistory() async {
    try {
      List<MovieEntity> result = [];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("token") ?? "";
      var history = prefs.getStringList("history$token") ?? [];
      if (history.isNotEmpty) {
        for (var id in history) {
          var response = await cubit.useCase.getMovieDetails(int.parse(id));
          MovieEntity movie = MovieEntity(
            id: int.parse(id),
            title: response.title ?? "",
            rating: response.rating ?? 0.0,
            mediumCoverImage: response.largeCoverImage ?? "",
          );
          result.add(movie);
        }
      }
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MovieEntity>> _getAllFavoriteMovies() async {
    try {
      var response = await useCase.getAllFavoriteMovies();
      List<MovieEntity> movies = response.data!
          .map(
            (e) => MovieEntity(
              id: int.parse(e.movieId ?? ''),
              title: e.name ?? '',
              rating: e.rating?.toDouble() ?? 0,
              year: int.tryParse(e.year ?? ''),
              mediumCoverImage: e.imageURL,
            ),
          )
          .toList();
      return movies;
    } catch (e) {
      rethrow;
    }
  }

  // Future<void> _getFavMovies() async {
  //   emit(state.copyWith(isLoading: true));
  //   try {
  //     var response = await apiManager.getProfile();
  //     emit(
  //       state.copyWith(
  //         name: response.data?.name ?? 'unKnown',
  //         avatarID: response.data?.avaterId ?? 0,
  //         isLoading: false,
  //       ),
  //     );
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
