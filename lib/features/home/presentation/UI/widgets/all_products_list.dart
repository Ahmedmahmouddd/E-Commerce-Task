import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/cubits/home_cubit/home_cubit.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/loading_indicator.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/small_product_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllProductsList extends StatelessWidget {
  const AllProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.18,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading || state is HomeInitial) {
                return const LoadingCircle();
              } else if (state is HomeFailure) {
                return Center(child: Text(state.message));
              } else {
                return ListView.separated(
                  separatorBuilder:
                      (context, index) => const SizedBox(width: 12),
                  padding: const EdgeInsets.all(12),
                  scrollDirection: Axis.horizontal,
                  itemCount: cubit.products.length,
                  itemBuilder: (context, index) {
                    return SmallProductBox(product: cubit.products[index]);
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}
