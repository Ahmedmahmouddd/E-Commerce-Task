import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/cubits/home_cubit/home_cubit.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/filter_bottom_sheet.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/loading_indicator.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/stagger_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

class ShowAllScreen extends StatelessWidget {
  const ShowAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/icons/wavesOpacity.svg',
            height: MediaQuery.of(context).size.height / 1.5,
            fit: BoxFit.cover,
          ),
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
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () => showFilterBottomSheet(context),
                        icon: const Icon(
                          Icons.settings_rounded,
                          color: Colors.white,
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
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      } else if (state is SortedProductsLoading) {
                        return const Expanded(child: LoadingCircle());
                      } else {
                        return const SizedBox();
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
