import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/cubits/home_cubit/home_cubit.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/home_product_card.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeProductCardListView extends StatelessWidget {
  const HomeProductCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Expanded(child: LoadingCircle());
        } else if (state is HomeFailure) {
          return Center(child: Text(state.message));
        } else if (state is HomeSuccess) {
          return Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              padding: const EdgeInsets.all(12),
              scrollDirection: Axis.horizontal,
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return HomeBigProductCard(product: state.products[index]);
              },
            ),
          );
        }
        return const Center(child: Text("Something went wrong"));
      },
    );
  }
}
