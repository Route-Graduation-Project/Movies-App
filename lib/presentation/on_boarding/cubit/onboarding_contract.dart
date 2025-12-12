class OnboardingState{
  int? currentIndex;

  OnboardingState({this.currentIndex});

  OnboardingState copyWith(int? index)
  {
    return OnboardingState(
      currentIndex: index ?? currentIndex,
    );
  }
}

sealed class OnBoardingAction{}

class SetupAction extends OnBoardingAction{
  int index;
  SetupAction(this.index);
}

class GoToNextAction extends OnBoardingAction{
  int index;
  GoToNextAction(this.index);
}

class GoToBackAction extends OnBoardingAction{
  int index;
  GoToBackAction(this.index);
}

sealed class OnBoardingNavigation{}

class NavigateToLoginScreen extends OnBoardingNavigation{}
