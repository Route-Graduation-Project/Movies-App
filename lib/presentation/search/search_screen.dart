import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/core/app_colors.dart';
import 'package:movies_app/presentation/search/cubit/search_cubit.dart';
import 'package:movies_app/presentation/search/cubit/search_state.dart';
import 'widgets/search_bar.dart';
import 'widgets/search_grid_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchCubit cubit = getIt();
  // final UseCase _useCase = getIt<UseCase>();

  // List<SearchEntity> movies = [];
  // bool isLoading = false;
  // String query = '';

  // Future<void> searchMovies(String value) async {
  //   query = value;

  //   if (value.isEmpty) {
  //     setState(() => movies.clear());
  //     return;
  //   }

  //   setState(() => isLoading = true);

  //   try {
  //     final result = await _useCase.getSearchResults(value);

  //     movies = result;
  //     isLoading = false;
  //   } catch (e) {
  //     print("Search error: $e");
  //     setState(() => isLoading = false);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            return SafeArea(
              child: Column(
                children: [
                  SearchBarWidget(
                    onChanged: (value) async {
                      await cubit.doAction(SearchResults(value));
                    },
                  ),
                  Expanded(
                    child: state.loading
                        ? const Center(child: CircularProgressIndicator())
                        : state.movies.isEmpty
                        ? const Center(
                      child: Text(
                        'No Movies To Show',
                        style: TextStyle(color: AppColors.white),
                      ),
                    )
                        : GridView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: state.movies.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.65,
                      ),
                      itemBuilder: (context, index) {
                        return SearchGridItem(movie: state.movies[index]);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
