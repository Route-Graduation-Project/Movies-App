import 'package:injectable/injectable.dart';
import 'package:movies_app/core/base/base_cubit.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/domain/use_case/use_case.dart';
import 'package:movies_app/presentation/search/cubit/search_state.dart';

@injectable
class SearchCubit extends BaseCubit<SearchState, SearchAction, void> {
  SearchCubit() : super(SearchState());
  final UseCase _useCase = getIt();
  @override
  Future<void> doAction(SearchAction action) async {
    switch (action) {
      case SearchResults():
        _returnSearchList(action.param);
    }
  }

  Future<void> _returnSearchList(String input) async {
    emit(state.copyWith(loading: true));
    var response = await _useCase.getSearchResults(input);
    try {
      if (response.isEmpty) {
        emit(state.copyWith(errMessage: 'No Movies Found For "$input"'));
      }
      emit(state.copyWith(movies: response));
    } catch (e) {
      emit(state.copyWith(errMessage: 'Something went wrong'));
    } finally {
      emit(state.copyWith(loading: false));
    }
  }
}
