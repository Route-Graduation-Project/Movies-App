import 'package:movies_app/domain/entity/movie_entity.dart';

class ProfileState {
  String? name;
  num? avatarId;
  int? wishListNumber;
  int? historyListNumber;
  bool isLoading;

  List<MovieEntity> movies;
  List<MovieEntity>? historyMovie;

  ProfileState({
    this.wishListNumber,
    this.historyListNumber,
    this.name,
    this.avatarId,
    List<MovieEntity>? movies,
    this.isLoading = false,
    this.historyMovie,
  }) : movies = movies ?? const [];

  ProfileState copyWith({
    String? name,
    num? avatarID,
    int? wishListNumber,
    int? historyListNumber,
    List<MovieEntity>? movies,
    bool isLoading = false,
    List<MovieEntity>? historyMovie,
  }) {
    return ProfileState(
      avatarId: avatarID ?? avatarId,
      name: name ?? this.name,
      isLoading: isLoading,
      wishListNumber: wishListNumber ?? this.wishListNumber,
      historyListNumber: historyListNumber ?? this.historyListNumber,
      movies: movies ?? this.movies,
      historyMovie: historyMovie ?? this.historyMovie,
    );
  }
}

sealed class ProfileActions {}

final class GetProfileData extends ProfileActions {}

final class GetAllFavMovies extends ProfileActions {

}
final class GetAllHistoryMovies extends ProfileActions {}

sealed class ProfileNavigations {}

final class NavigateToEditProfile extends ProfileNavigations {}

final class LogoutNavigation extends ProfileNavigations {}
