import 'package:flutter/material.dart';

class CarouselSliderItem extends StatelessWidget {
  const CarouselSliderItem({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 158 / 161,

      child: Image.asset(image, fit: BoxFit.fitWidth),
    );
  }
}
