import 'package:flutter/material.dart';
import 'package:movies_app/core/app_colors.dart';
import 'package:movies_app/presentation/home/widgets/poster_widget.dart';

class MovieList extends StatelessWidget {
  final List<PosterWidget> movies;

  const MovieList({required this.movies, super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black,
      child:
          movies.isEmpty
              ? Center(child: Image.asset("assets/images/Empty 1.png"))
              : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                padding: const EdgeInsets.all(16),
                itemCount: movies.length,
                itemBuilder: (_, index) => movies[index],
              ),
    );
  }
}
