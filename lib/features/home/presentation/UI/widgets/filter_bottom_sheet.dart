import 'package:ahmed_mahmoud_flutter_task/core/constants/app_constants.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/cubits/home_cubit/home_cubit.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/filter_option_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<dynamic> showFilterBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    barrierColor: Colors.black38,
    enableDrag: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return const FilterBottomSheet();
    },
  );
}

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Filter by Price",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilterOptionButton(
                name: "Highest to Lowest",
                isSelected: cubit.selectedFilter == 1,
                onTap: () {
                  cubit.selectedFilter = 1;
                  cubit.getSortedProducts(AppConstants.priceHeighestToLowest);
                  Navigator.pop(context);
                },
              ),
              FilterOptionButton(
                name: "Lowest to Highest",
                isSelected: cubit.selectedFilter == 2,
                onTap: () {
                  cubit.selectedFilter = 2;
                  cubit.getSortedProducts(AppConstants.priceLowestToHeighest);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            "Filter by Date",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilterOptionButton(
                name: "Oldest to Newest",
                isSelected: cubit.selectedFilter == 3,
                onTap: () {
                  cubit.selectedFilter = 3;
                  cubit.getSortedProducts(AppConstants.timeOldestToNewest);
                  Navigator.pop(context);
                },
              ),
              FilterOptionButton(
                name: "Newest to Oldest",
                isSelected: cubit.selectedFilter == 4,
                onTap: () {
                  cubit.selectedFilter = 4;
                  cubit.getSortedProducts(AppConstants.timeNewestToOldest);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
