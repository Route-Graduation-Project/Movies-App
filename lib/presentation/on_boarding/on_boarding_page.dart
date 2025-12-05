import 'package:flutter/material.dart';
import 'package:movies_app/presentation/on_boarding/models/on_boarding_model.dart';
import 'package:movies_app/presentation/on_boarding/widgets/on_boarding_standard_item.dart';
import 'package:movies_app/presentation/on_boarding/widgets/on_oarding_special_item.dart';

class OnBoardingPage extends StatelessWidget {
  final OnBoardingModel model;
  final VoidCallback onNext;
  final VoidCallback onBack;

  const OnBoardingPage({
    super.key,
    required this.model,
    required this.onNext,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    int index = _getPageIndex(model.image);

    bool isSpecialLayout = index == 0 || index == 1;

    if (isSpecialLayout) {
      return OnBoardingSpecialItem(
        image: model.image,
        title: model.title,
        subTitle: model.subTitle,
        buttonText: model.nextText,
        onNext: onNext,
      );
    }

    return OnBoardingStandardItem(
      image: model.image,
      title: model.title,
      subTitle: model.subTitle,
      nextText: model.nextText,
      backText: model.backText,
      onNext: onNext,
      onBack: onBack,
    );
  }

  int _getPageIndex(String imagePath) {
    if (imagePath.contains("assets/images/Movies Posters Group.png")) return 0;
    if (imagePath.contains("image_1")) return 1;
    if (imagePath.contains("image_2")) return 2;
    if (imagePath.contains("image_3")) return 3;
    if (imagePath.contains("image_4")) return 4;
    if (imagePath.contains("image_5")) return 5;
    return 6;
  }
}
