import 'package:flutter/material.dart';
import 'package:movies_app/core/routing/routes.dart';
import 'package:movies_app/presentation/on_boarding/models/on_boarding_model.dart';
import 'package:movies_app/presentation/on_boarding/on_boarding_page.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<OnBoardingModel> pages = [
    OnBoardingModel(
      image: 'assets/images/Movies Posters Group.png',
      title: 'Find Your Next Favorite Movie Here',
      subTitle:
          'Get access to a huge library of movies to suit all tastes. You will surely like it.',
      nextText: 'Next',
      backText: '',
    ),
    OnBoardingModel(
      image: 'assets/images/image_1.png',
      title: 'Discover Movies',
      subTitle:
          'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.',
      nextText: 'Next',
      backText: '',
    ),
    OnBoardingModel(
      image: 'assets/images/image_2.png',
      title: 'Explore All Genres',
      subTitle:
          'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.',
      nextText: 'Next',
      backText: 'Back',
    ),
    OnBoardingModel(
      image: 'assets/images/image_3.png',
      title: 'Create Watchlists',
      subTitle:
          'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.',
      nextText: 'Next',
      backText: 'Back',
    ),
    OnBoardingModel(
      image: 'assets/images/image_4.png',
      title: 'Rate, Review, and Learn',
      subTitle:
          "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
      nextText: 'Next',
      backText: 'Back',
    ),
    OnBoardingModel(
      image: 'assets/images/image_5.png',
      title: 'Start Watching Now',
      subTitle: '',
      nextText: 'Finish',
      backText: 'Back',
    ),
  ];

  void goNext() {
    if (currentIndex < pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else if (currentIndex == pages.length - 1) {
      Navigator.pushReplacementNamed(context, Routes.loginRoute);
    }
  }

  void goBack() {
    if (currentIndex > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: pages.length,
        onPageChanged: (index) => setState(() => currentIndex = index),
        itemBuilder: (context, index) {
          final model = pages[index];
          return OnBoardingPage(model: model, onNext: goNext, onBack: goBack);
        },
      ),
    );
  }
}
