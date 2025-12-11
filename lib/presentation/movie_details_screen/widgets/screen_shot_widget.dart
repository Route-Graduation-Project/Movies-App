import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/app_colors.dart';
import 'package:movies_app/core/utils/context_extension.dart';
import 'package:movies_app/core/utils/padding_extension.dart';

class ScreenShotWidget extends StatelessWidget {
  const ScreenShotWidget({required this.urlImage, super.key});

  final String urlImage;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        height: context.heightSize *0.17,
        width: double.infinity,
        imageUrl: urlImage,
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
      ),
    ).allPadding(16);
  }
}
