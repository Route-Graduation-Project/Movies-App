import 'package:movies_app/domain/entity/search_entity.dart';

class SearchState {
  final bool loading;
  final List<SearchEntity> movies;
  final String errMessage;
  SearchState({
    this.loading = false,
    this.movies = const [],
    this.errMessage = '',
  });
  SearchState copyWith({
    bool? loading,
    List<SearchEntity>? movies,
    String? errMessage,
  }) {
    return SearchState(
      loading: loading ?? this.loading,
      movies: movies ?? this.movies,
      errMessage: errMessage ?? this.errMessage,
    );
  }
}

sealed class SearchAction {}

final class SearchResults extends SearchAction {
  final String param;
  SearchResults(this.param);
}
