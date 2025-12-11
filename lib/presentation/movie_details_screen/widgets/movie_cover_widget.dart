import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/context_extension.dart';

import '../../../core/app_colors.dart';

class MovieCoverWidget extends StatelessWidget {
  MovieCoverWidget({required this.urlImage, super.key});

  final String urlImage;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: context.heightSize *0.7,
      width: double.infinity,
      imageUrl: urlImage,
      fit: BoxFit.cover,
      placeholder: (context, url) => Center(child: CircularProgressIndicator(
        color: AppColors.gray,
      )),
      errorWidget: (context, url, error) => Icon(Icons.error),
      imageBuilder: (context, imageProvider) =>
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image(image: imageProvider,
              width: double.infinity,
              fit: BoxFit.cover,),
          ),
    );
  }
}
