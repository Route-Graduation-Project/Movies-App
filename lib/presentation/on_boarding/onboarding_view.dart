import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/app_colors.dart' show AppColors;
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/core/routing/routes.dart';
import 'package:movies_app/core/utils/theme_extension.dart';
import 'package:movies_app/core/utils/white_space_extension.dart';
import 'package:movies_app/presentation/on_boarding/cubit/onboarding_contract.dart';
import 'cubit/onboarding_cubit.dart';
import 'models/onboarding_models.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});


  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {

  @override
  void initState() {
    super.initState();
    cubit.doAction(SetupAction(0));
    cubit.navigation.listen((navigation){
      switch (navigation) {
        case NavigateToLoginScreen():
          {
            Navigator.pushReplacementNamed(context, Routes.loginRoute);
          }
      }
    });
  }
  final cubit = getIt<OnboardingCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (_ , state) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(onboarding[state.currentIndex!].image),
                fit: BoxFit.cover
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: onboarding[state.currentIndex!].gradient,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(20)
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      onboarding[state.currentIndex!].title,
                      textAlign: TextAlign.center,
                      style: context.textStyle.headlineLarge!.copyWith(color: AppColors.white),
                    ),
                    15.heightSpace,
                    if(onboarding[state.currentIndex!].description != null)
                      Text(
                        onboarding[state.currentIndex!].description!,
                        textAlign: TextAlign.center,
                        style: context.textStyle.bodyLarge!.copyWith(color: AppColors.white.withAlpha(100)),
                      ),
                    15.heightSpace,
                    FilledButton(
                        onPressed: (){
                          cubit.doAction(GoToNextAction(state.currentIndex!));
                        },
                        child: Text(onboarding[state.currentIndex!].buttonText,)
                    ),
                    10.heightSpace,
                    if(onboarding[state.currentIndex!].isBack)
                      ElevatedButton(
                          onPressed: (){
                            cubit.doAction(GoToBackAction(state.currentIndex!));
                          },
                          style: ElevatedButton.styleFrom(

                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  side: const BorderSide(
                                    color: AppColors.yellow,
                                  )
                              )
                          ),
                          child: const Text("Back")
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
