import 'package:ahmed_mahmoud_flutter_task/core/constants/app_constants.dart';
import 'package:ahmed_mahmoud_flutter_task/core/theme/app_colors.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/cubits/home_cubit/home_cubit.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/background_image.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/filter_bottom_sheet.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/loading_indicator.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/stagger_tile.dart';
import 'package:ahmed_mahmoud_flutter_task/features/search/presentation/widgets/no_results_found.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ShowAllScreen extends StatelessWidget {
  const ShowAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGroundImage(),
          SafeArea(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close_rounded,
                          color: AppColors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () => showFilterBottomSheet(context),
                        icon: const Icon(
                          Icons.settings_rounded,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if (state is SortedProductsSuccess) {
                        return Expanded(
                          child: MasonryGridView.builder(
                            padding: const EdgeInsets.all(12),
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
                                height: height,
                                product: state.products[index],
                              );
                            },
                          ),
                        );
                      } else if (state is SortedProductsFailure) {
                        return Center(
                          child: Text(
                            state.message,
                            style: const TextStyle(color: AppColors.white),
                          ),
                        );
                      } else if (state is SortedProductsLoading) {
                        return const Expanded(child: LoadingCircle());
                      } else {
                        return const FillterWidget(
                          icon: Icons.filter_vintage,
                          message: AppConstants.userFiltersToViewProducts,
                        );
                      }
                    },
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
