import 'package:flutter/material.dart';

class CarouselSliderItem extends StatelessWidget {
  const CarouselSliderItem({
    super.key,
    required this.image,
    required this.avatarId,
  });
  final String image;
  final int avatarId;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 158 / 161,

      child: Image.asset(image, fit: BoxFit.fitWidth),
    );
  }
}
