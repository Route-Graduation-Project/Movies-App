import 'package:flutter/material.dart';
import 'package:movies_app/domain/entity/search_entity.dart';
import 'package:movies_app/presentation/movie_details_screen/movie_details_view.dart';

import '../../../core/app_colors.dart';

class SearchGridItem extends StatelessWidget {
  final SearchEntity movie;

  const SearchGridItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MovieDetailsView(movieID: movie.id ?? 10),
          ),
        );
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              movie.largeCoverImage ?? movie.mediumCoverImage ?? '',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              errorBuilder: (_, __, ___) =>
              const Center(child: Icon(Icons.broken_image)),
            ),
          ),

          Positioned(
            top: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(Icons.star, color: AppColors.yellow, size: 14),
                  const SizedBox(width: 4),
                  Text(
                    movie.rating?.toStringAsFixed(1) ?? 'N/A',
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
