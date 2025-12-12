import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/context_extension.dart';
import 'package:movies_app/core/utils/theme_extension.dart';
import 'package:movies_app/core/utils/white_space_extension.dart';

import '../../../core/app_colors.dart';

class CharacterWidget extends StatelessWidget {
  const CharacterWidget({
    required this.urlImage,
    required this.originName,
    required this.characterName,
    super.key,
  });

  final String urlImage;
  final String originName;
  final String characterName;

  @override
  Widget build(BuildContext context) {
    print(characterName);
    return Container(
      height: context.heightSize * 0.12,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              width: context.widthSize * 0.2,
              height: context.heightSize * 0.1,
              fit: BoxFit.cover,
              imageUrl:
                  urlImage,
              placeholder:
                  (context, url) => const Center(
                    child: CircularProgressIndicator(color: AppColors.yellow),
                  ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          12.widthSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    "Name: ",
                    style: context.textStyle.titleMedium!.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    originName,
                    style: context.textStyle.titleMedium!.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Character: ",
                    style: context.textStyle.titleMedium!.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    characterName,
                    style: context.textStyle.titleMedium!.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
