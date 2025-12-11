import 'package:flutter/material.dart';
import 'package:movies_app/core/app_colors.dart';


class onboardingModel {
  String title;
  String? description;
  String image;
  String buttonText;
  LinearGradient gradient;
  bool isBack;

  onboardingModel({
    required this.image,
    required this.title,
    required this.buttonText,
    this.description,
    required this.gradient,
    required this.isBack,
  });
}

List<onboardingModel> onboarding = [
  onboardingModel(
    image: "assets/images/Movies Posters Group.png",
    title: "Find Your Next Favorite Movie Here",
    buttonText: "Explore Now",
    description:
    "Get access to a huge library of movies to suit all tastes. You will surely like it.",
    gradient: LinearGradient(
      colors: [AppColors.black.withAlpha(70), AppColors.black],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    isBack: false,
  ),
  onboardingModel(
    image: "assets/images/image_1.png",
    buttonText: "Next",
    title: "Discover Movies",
    isBack: false,
    description:
    "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
    gradient: LinearGradient(
      colors: [Color(0xFF084250).withAlpha(70), Color(0xFF084250)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ),
  onboardingModel(
    image: "assets/images/image_2.png",
    buttonText: "Next",
    title: "Explore All Genres",
    isBack: true,
    description:
    "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
    gradient: LinearGradient(
      colors: [Color(0xFF85210E).withAlpha(70), Color(0xFF85210E)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ),
  onboardingModel(
    image: "assets/images/image_3.png",
    title: "Create Watchlists",
    buttonText: "Next",
    isBack: true,
    description:
    "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
    gradient: LinearGradient(
      colors: [Color(0xFF4C2471).withAlpha(70), Color(0xFF4C2471)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ),
  onboardingModel(
    image: "assets/images/image_4.png",
    title: "Rate, Review, and Learn",
    buttonText: "Next",
    isBack: true,
    description:
    "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
    gradient: LinearGradient(
      colors: [Color(0xFF601321).withAlpha(70), Color(0xFF601321)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ),
  onboardingModel(
    image: "assets/images/image_5.png",
    isBack: true,
    title: "Start Watching Now",
    buttonText: "Finish",
    gradient: LinearGradient(
      colors: [Color(0xFF2A2C30).withAlpha(70), Color(0xFF2A2C30)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ),
];
