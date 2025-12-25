import 'package:flutter/material.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/core/app_colors.dart';
import 'package:movies_app/domain/entity/search_entity.dart';
import 'package:movies_app/domain/use_case/use_case.dart';
import 'widgets/search_bar.dart';
import 'widgets/search_grid_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final UseCase _useCase = getIt<UseCase>();

  List<SearchEntity> movies = [];
  bool isLoading = false;
  String query = '';
  Future<void> searchMovies(String value) async {
    query = value;
    if (value.isEmpty) {
      setState(() => movies.clear());
      return;
    }
    setState(() => isLoading = true);
    try {
      final result = await _useCase.getSearchResults(value);
      setState(() {
        movies = result;
        isLoading = false;
      });
    } catch (e) {
      print("Search error: $e");
      setState(() => isLoading = false);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            SearchBarWidget(
              onChanged: (value) async {
                await searchMovies(value);
              },
            ),

            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : movies.isEmpty
                  ? Center(
                child: Text(
                  query.isEmpty
                      ? "Search for movies..."
                      : "No movies found for '$query'",
                  style: const TextStyle(color: AppColors.white),
                ),
              )
                  : GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: movies.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  return SearchGridItem(movie: movies[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
