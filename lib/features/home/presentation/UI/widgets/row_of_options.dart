import 'package:ahmed_mahmoud_flutter_task/core/constants/app_constants.dart';
import 'package:ahmed_mahmoud_flutter_task/core/theme/app_theme.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/cubits/home_cubit/home_cubit.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/screens/show_all_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RowOfOptions extends StatelessWidget {
  const RowOfOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                AppConstants.mostRecent,
                style: AppTextStyles.font20BlackBold,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => ShowAllScreen(
                            products:
                                BlocProvider.of<HomeCubit>(context).products,
                          ),
                    ),
                  );
                },
                child: const Text(
                  AppConstants.showAll,
                  style: AppTextStyles.font20PrimaryBold,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.primary,
                size: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
