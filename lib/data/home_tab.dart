import 'package:flutter/material.dart';
import '../../models/movie_model.dart';
import '..//services/movies_api_service.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final MoviesApiService _moviesApiService = MoviesApiService();
  late Future<List<MovieModel>> _moviesFuture;

  @override
  void initState() {
    super.initState();
    _moviesFuture = _moviesApiService.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies Home'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<MovieModel>>(
        future: _moviesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                textAlign: TextAlign.center,
              ),
            );
          }

          final movies = snapshot.data ?? [];

          if (movies.isEmpty) {
            return const Center(child: Text('No movies found'));
          }

          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.6,
            ),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];

              return GestureDetector(
                onTap: () {
                  // هنا بعدين هنوصلها ب MovieDetailsScreen
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          movie.imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) =>
                          const Center(child: Icon(Icons.broken_image)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      movie.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          movie.year.toString(),
                          style: const TextStyle(fontSize: 12),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star, size: 14),
                            const SizedBox(width: 2),
                            Text(
                              movie.rating.toString(),
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}