import 'package:ahmed_mahmoud_flutter_task/core/theme/app_colors.dart';
import 'package:ahmed_mahmoud_flutter_task/features/bottom_nav_bar/presentation/UI/cubit/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:ahmed_mahmoud_flutter_task/features/bottom_nav_bar/presentation/UI/widgets/nav_bar_button.dart';
import 'package:flutter/material.dart';

// BottomNavBar is a StatelessWidget that creates the bottom navigation bar for the app.
// The constructor takes the cubit (BottomNavBarCubit) as a required parameter to manage the selected page index.
// Inside the build method, SafeArea ensures the navigation bar is placed within the screen's safe area.
// The container is styled with padding, margin, and a semi-transparent black color with rounded corners.
// A Row widget is used to align the buttons horizontally with space between them.
// Each BottomNavBarButton updates the selected page index and changes the icon based on the active state.
// Each button onTap updates the index and reflects the selection state using the isSelected property.

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.cubit});

  final BottomNavBarCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.black.withValues(alpha: 0.8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavBarButton(
              onTap: () => cubit.changeIndex(0),
              isSelected: cubit.pageIndex == 0,
              selectedIcon: 'assets/icons/home.svg',
            ),
            BottomNavBarButton(
              onTap: () => cubit.changeIndex(1),
              isSelected: cubit.pageIndex == 1,
              selectedIcon: 'assets/icons/Search.svg',
            ),
            BottomNavBarButton(
              onTap: () => cubit.changeIndex(2),
              isSelected: cubit.pageIndex == 2,
              selectedIcon: 'assets/icons/cart.svg',
            ),
            BottomNavBarButton(
              onTap: () => cubit.changeIndex(3),
              isSelected: cubit.pageIndex == 3,
              selectedIcon: 'assets/icons/person.svg',
            ),
          ],
        ),
      ),
    );
  }
}
