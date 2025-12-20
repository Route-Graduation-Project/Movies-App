import 'package:movies_app/domain/entity/movie_entity.dart';

class ProfileState {
  String? name;
  num? avatarId;
  int? wishListNumber;
  bool isLoading;
  List<MovieEntity> movies;
  ProfileState({
    this.wishListNumber,
    this.name,
    this.avatarId,
    List<MovieEntity>? movies,
    this.isLoading = false,
  }): movies = movies ?? const [];
  ProfileState copyWith({
    String? name,
    num? avatarID,
    int? wishListNumber,
    List<MovieEntity>? movies,
    bool isLoading = false,
  }) {
    return ProfileState(
      avatarId: avatarID ?? avatarId,
      name: name ?? this.name,
      isLoading: isLoading,
      wishListNumber: wishListNumber,
      movies: movies ?? this.movies,
    );
  }
}

sealed class ProfileActions {}

final class GetProfileData extends ProfileActions {}

final class GetAllFavMovies extends ProfileActions {}

sealed class ProfileNavigations {}

final class NavigateToEditProfile extends ProfileNavigations {}

final class LogoutNavigation extends ProfileNavigations {}
