import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/presentation/auth/widgets/carousel_slider_items_list.dart';

class CarouselSliderItemBuilder extends StatelessWidget {
  const CarouselSliderItemBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: carouselSliderItemsList,
      options: CarouselOptions(
        enableInfiniteScroll: true,
        enlargeFactor: .5,
        enlargeCenterPage: true,
        viewportFraction: 0.5,
      ),
    );
  }
}
