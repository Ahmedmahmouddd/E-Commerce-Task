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
                            return const NoResultsFound();
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
