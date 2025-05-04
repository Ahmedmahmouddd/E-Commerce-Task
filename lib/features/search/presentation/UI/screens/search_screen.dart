import 'dart:async';

import 'package:ahmed_mahmoud_flutter_task/core/constants/app_constants.dart';
import 'package:ahmed_mahmoud_flutter_task/core/theme/app_theme.dart';
import 'package:ahmed_mahmoud_flutter_task/features/auth/view/widgets/text_form_field.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/background_image.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/loading_indicator.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/stagger_tile.dart';
import 'package:ahmed_mahmoud_flutter_task/features/search/presentation/UI/cubit/search_cubit/search_cubit.dart';
import 'package:ahmed_mahmoud_flutter_task/features/search/presentation/widgets/no_results_found.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

/// This file defines the `SearchScreen` widget, which is a stateful widget
/// responsible for providing a search functionality within the application.
///
/// The `SearchScreen` includes the following key features:
///
/// - A search bar implemented using a `CustomTextFormField` that allows users
///   to input search queries. The search input is debounced to avoid excessive
///   API calls.
/// - Integration with the `SearchCubit` to handle search logic and state
///   management.
/// - Displays a loading indicator (`LoadingCircle`) while search results are
///   being fetched.
/// - Shows an error message if the search fails.
/// - Displays search results in a staggered grid layout using
///   `MasonryGridView.builder`.
/// - If no results are found, a placeholder widget (`FillterWidget`) is shown.
///
/// Key Components:
/// - `TextEditingController`: Manages the text input for the search bar.
/// - `_onSearchChanged`: A debounced function that triggers the search query
///   when the user types in the search bar.
/// - `BlocBuilder<SearchCubit, SearchState>`: Listens to the `SearchCubit`
///   state and updates the UI accordingly.

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (query.length < 2) return;

    _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<SearchCubit>().searchProducts(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGroundImage(),
          SafeArea(
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      AppConstants.search,
                      style: AppTextStyles.font38WhiteBold,
                    ),
                    const SizedBox(height: 12),
                    CustomTextFormField(
                      icon: Icons.search_rounded,
                      onChanged: _onSearchChanged,
                      controller: searchController,
                      hint: AppConstants.search,
                    ),

                    BlocBuilder<SearchCubit, SearchState>(
                      builder: (context, state) {
                        if (state is SearchLoading) {
                          return const Expanded(child: LoadingCircle());
                        } else if (state is SearchFailure) {
                          return Center(child: Text(state.message));
                        } else if (state is SearchSuccess) {
                          if (state.products.isEmpty) {
                            return const FillterWidget();
                          } else {
                            return Expanded(
                              child: MasonryGridView.builder(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 12,
                                gridDelegate:
                                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                    ),
                                itemCount: state.products.length,
                                itemBuilder: (context, index) {
                                  final height = (index.isEven) ? 260.0 : 230.0;
                                  return StaggerTile(
                                    product: state.products[index],
                                    height: height,
                                  );
                                },
                              ),
                            );
                          }
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
