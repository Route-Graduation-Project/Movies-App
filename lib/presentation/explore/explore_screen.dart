import 'package:flutter/material.dart';
import 'package:movies_app/core/app_colors.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/domain/entity/movie_entity.dart';
import 'package:movies_app/domain/repository/movies_api_remote_data.dart';
import 'package:movies_app/presentation/home/widgets/poster_widget.dart';
import 'package:movies_app/presentation/movie_details_screen/movie_details_view.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final MoviesApiData _moviesApiData = getIt<MoviesApiData>();

  String selectedGenre = 'action';
  final List<Map<String, String>> genres = [
    {'name': 'Action', 'value': 'action'},
    {'name': 'Adventure', 'value': 'adventure'},
    {'name': 'Animation', 'value': 'animation'},
    {'name': 'Biography', 'value': 'biography'},
    {'name': 'Comedy', 'value': 'comedy'},
    {'name': 'Crime', 'value': 'crime'},
    {'name': 'Drama', 'value': 'drama'},
    {'name': 'Fantasy', 'value': 'fantasy'},
    {'name': 'Horror', 'value': 'horror'},
    {'name': 'Mystery', 'value': 'mystery'},
    {'name': 'Romance', 'value': 'romance'},
    {'name': 'Sci-Fi', 'value': 'sci-fi'},
    {'name': 'Thriller', 'value': 'thriller'},
  ];

  List<MovieEntity> movies = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  void _onMovieTap(int movieId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailsView(movieID: movieId),
      ),
    );
  }

  Future<void> _loadMovies() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final moviesData = await _moviesApiData.getMovies(
        genre: selectedGenre,
        limit: 20,
        page: 1,
        sortBy: 'rating',
        orderBy: 'desc',
        minimumRating: 6,
      );

      if (mounted) {
        setState(() {
          movies = moviesData;
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          errorMessage = e.toString();
          isLoading = false;
        });
      }
    }
  }

  void _onGenreSelected(String genreValue, String genreName) {
    if (selectedGenre != genreValue) {
      setState(() {
        selectedGenre = genreValue;
      });
      _loadMovies();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Browse',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),

            // Genre chips
            SizedBox(
              height: 50,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: genres.length,
                itemBuilder: (context, index) {
                  final genre = genres[index];
                  final isSelected = genre['value'] == selectedGenre;

                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: _GenreChip(
                      genreName: genre['name']!,
                      isSelected: isSelected,
                      onTap: () =>
                          _onGenreSelected(genre['value']!, genre['name']!),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Movies grid
            Expanded(child: _buildBody()),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: AppColors.yellow,
          strokeWidth: 3,
        ),
      );
    }

    if (errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                color: AppColors.yellow,
                size: 64,
              ),
              const SizedBox(height: 16),
              const Text(
                'Oops! Something went wrong',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Unable to load movies',
                style: TextStyle(
                  color: AppColors.white.withOpacity(0.7),
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _loadMovies,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.yellow,
                  foregroundColor: AppColors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Try Again',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (movies.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.movie_filter_outlined,
              color: AppColors.white.withOpacity(0.3),
              size: 80,
            ),
            const SizedBox(height: 16),
            Text(
              'No movies found',
              style: TextStyle(
                color: AppColors.white.withOpacity(0.7),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Try selecting a different genre',
              style: TextStyle(
                color: AppColors.white.withOpacity(0.5),
                fontSize: 14,
              ),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.55,
        crossAxisSpacing: 16,
        mainAxisSpacing: 20,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return PosterWidget(movie: movies[index], movieTap: _onMovieTap);
      },
    );
  }
}

class _GenreChip extends StatelessWidget {
  const _GenreChip({
    required this.genreName,
    required this.isSelected,
    required this.onTap,
  });

  final String genreName;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.yellow : Colors.transparent,
            border: Border.all(color: AppColors.yellow, width: 2),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Center(
            child: Text(
              genreName,
              style: TextStyle(
                color: isSelected ? AppColors.black : AppColors.yellow,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
