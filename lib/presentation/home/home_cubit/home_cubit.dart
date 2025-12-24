import 'dart:math';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/base/base_cubit.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/domain/entity/movie_entity.dart';
import 'package:movies_app/domain/use_case/use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'home_state.dart';


@injectable
class HomeCubit extends BaseCubit<HomeState, HomeAction, NavigationHome> {
  HomeCubit() : super(HomeState());

  UseCase useCase = getIt();

  @override
  Future<void> doAction(HomeAction action) async{
    switch (action) {
      case SetupHome():{
        _setup();
      }
      case GetMovieList():{
        _getMovie();
      }
      case GoToDetailsScreenAction():{
        await _goToDetailsScreen(action.movieId);
      }
    }
  }


  void _setup(){
    emit(state.copyWith(isMovieOfDateLoading: true,isMovieOfGenresLoading: true));
  }

  Future<void> _getMovie()async{
    try{
      int indexOfGenres = Random().nextInt(state.genres.length+1);
      var responseOfSortedMovieByDate = await useCase.getMovie(
        sortBy: "date_added",
        orderBy: "desc",
      );
      var responseOfSortedMovieByGenres = await useCase.getMovie(
        genre: state.genres[indexOfGenres],
      );


      emit(state.copyWith(
        moviesSortedByDate: responseOfSortedMovieByDate,
        moviesSortedByGenres: responseOfSortedMovieByGenres,
        indexOfGenres: indexOfGenres
      ));

    }
    catch(e){
      rethrow;
    } finally {
      emit(
        state.copyWith(
          isMovieOfDateLoading: false,
          isMovieOfGenresLoading: false,
        ),
      );
    }
  }

  Future<void> _goToDetailsScreen(int movieId) async{
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("token") ?? "";
      List<String> history = prefs.getStringList("history$token") ?? [];
      if(!history.contains(movieId.toString()))
        {
          history.add(movieId.toString());
        }
      await prefs.setStringList("history$token", history);
    }
    catch(e){
      rethrow;
    }
    finally{
      emitNavigation(NavigateToMovieDetails(movieId));
    }
  }

}
