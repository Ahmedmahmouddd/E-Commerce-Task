import 'package:ahmed_mahmoud_flutter_task/features/bottom_nav_bar/presentation/UI/cubit/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:ahmed_mahmoud_flutter_task/features/bottom_nav_bar/presentation/UI/widgets/nav_bar_button.dart';
import 'package:flutter/material.dart';

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
          color: Colors.black,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavBarButton(
              onTap: () => cubit.changeIndex(0),
              isSelected: cubit.pageIndex == 0,
              selectedIcon: 'assets/icons/selectedHome.svg',
              unSelectedIcon: 'assets/icons/home.svg',
            ),
            BottomNavBarButton(
              onTap: () => cubit.changeIndex(1),
              isSelected: cubit.pageIndex == 1,
              selectedIcon: 'assets/icons/selectedSearch.svg',
              unSelectedIcon: 'assets/icons/searchh.svg',
            ),
            BottomNavBarButton(
              onTap: () => cubit.changeIndex(2),
              isSelected: cubit.pageIndex == 2,
              unSelectedIcon: 'assets/icons/add.svg',
              selectedIcon: 'assets/icons/selectedAdd.svg',
            ),
            BottomNavBarButton(
              onTap: () => cubit.changeIndex(3),
              isSelected: cubit.pageIndex == 3,
              unSelectedIcon: 'assets/icons/cart.svg',
              selectedIcon: 'assets/icons/selectedCart.svg',
            ),
            BottomNavBarButton(
              onTap: () => cubit.changeIndex(4),
              isSelected: cubit.pageIndex == 4,
              unSelectedIcon: 'assets/icons/person.svg',
              selectedIcon: 'assets/icons/selectedPerson.svg',
            ),
          ],
        ),
      ),
    );
  }
}
