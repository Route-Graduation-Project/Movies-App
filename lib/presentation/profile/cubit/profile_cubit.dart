import 'package:injectable/injectable.dart';
import 'package:movies_app/core/base/base_cubit.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/domain/entity/movie_entity.dart';
import 'package:movies_app/domain/use_case/use_case.dart';
import 'package:movies_app/presentation/profile/cubit/profile_state.dart';
import 'package:movies_app/update_data/api_manager.dart';

@injectable
class ProfileCubit
    extends BaseCubit<ProfileState, ProfileActions, ProfileNavigations> {
  ProfileCubit() : super(ProfileState());
  ApiManager apiManager = ApiManager();
  UseCase useCase = getIt();

  @override
  Future<void> doAction(ProfileActions action) async {
    switch (action) {
      case GetProfileData():
        _getProfile();
      case GetAllFavMovies():
    }
  }

  Future<void> _getProfile() async {
    emit(state.copyWith(isLoading: true));
    try {
      var response = await apiManager.getProfile();
      var response2 = await useCase.getAllFavoriteMovies();
      emit(
        state.copyWith(
          name: response.data?.name ?? 'unKnown',
          avatarID: response.data?.avaterId ?? 0,
          wishListNumber: response2.data?.length ?? 0,
          movies:
              response2.data
                  ?.map(
                    (e) => MovieEntity(
                      id: int.parse(e.movieId ?? ''),
                      title: e.name ?? '',
                      rating: e.rating?.toDouble() ?? 0,
                      year: int.tryParse(e.year ?? ''),
                      smallCoverImage: e.imageURL,
                    ),
                  )
                  .toList(),
          isLoading: false,
        ),
      );
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
