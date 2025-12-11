import 'package:injectable/injectable.dart';
import 'package:movies_app/core/base/base_cubit.dart';
import 'package:movies_app/presentation/on_boarding/cubit/onboarding_contract.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class OnboardingCubit extends BaseCubit<OnboardingState, OnBoardingAction, OnBoardingNavigation>{
  OnboardingCubit() : super(OnboardingState());

  @override
  Future<void> doAction(OnBoardingAction action) async{
    switch (action) {

      case GoToNextAction():{
          _goToNext(action.index);
        }
      case GoToBackAction():{
        _goToBack(action.index);
      }
      case SetupAction():
        {
          _setup(action.index);
        }
    }
  }

  void _setup(int index){
    emit(state.copyWith(0));
  }

  Future<void> _goToNext(int index)async{
    if(index == 5) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setBool("onboarding", true);
      emitNavigation(NavigateToLoginScreen());
    }
    else
      {
        emit(state.copyWith(index+1));
      }

  }

  void _goToBack(int index){
    emit(state.copyWith(index-1));
  }
}