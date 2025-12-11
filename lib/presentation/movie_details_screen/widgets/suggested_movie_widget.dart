import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/context_extension.dart';
import 'package:movies_app/core/utils/theme_extension.dart';
import 'package:movies_app/domain/entity/movies_suggestion_entity.dart';

import '../../../core/app_colors.dart';

class SuggestedMovieWidget extends StatelessWidget {
  const SuggestedMovieWidget({required this.movieSuggestion,required this.movieSuggestionTap, super.key});

  final MoviesSuggestionEntity movieSuggestion;
  final Function(int movieId) movieSuggestionTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        movieSuggestionTap(movieSuggestion.id!);
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              height: context.heightSize *0.3,
              width: double.infinity,
              imageUrl: movieSuggestion.mediumCoverImage!,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator(
                color: AppColors.gray,
              )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageBuilder: (context, imageProvider) =>
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image(image: imageProvider,
                      width: double.infinity,
                      fit: BoxFit.cover,),
                  ),
            )
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: AppColors.black.withAlpha(400),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      movieSuggestion.rating.toString(),
                      style: context.textStyle.bodyMedium!.copyWith(color: AppColors.white),
                    ),
                    const Icon(Icons.star,color: AppColors.yellow,),
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}
