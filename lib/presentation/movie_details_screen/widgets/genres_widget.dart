import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/context_extension.dart';
import 'package:movies_app/core/utils/theme_extension.dart';

import '../../../core/app_colors.dart';

class GenresWidget extends StatelessWidget {
  const GenresWidget({super.key, required this.genres});

  final List<String> genres;
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
      maxCrossAxisExtent: context.widthSize *0.3,
      childAspectRatio: (context.widthSize*0.3) / (context.heightSize * 0.05) ,// width / height,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: genres.map((g) => Container(
        decoration: BoxDecoration(
          color: AppColors.gray,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            g,
            textAlign: TextAlign.center,
            style: context.textStyle.bodyMedium!.copyWith(color: AppColors.white),
          ),
        ),
      )).toList(),
    );
  }
}
