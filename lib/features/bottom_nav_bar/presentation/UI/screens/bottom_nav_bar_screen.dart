import 'package:ahmed_mahmoud_flutter_task/dependency_injection.dart';
import 'package:ahmed_mahmoud_flutter_task/features/bottom_nav_bar/presentation/UI/cubit/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/presentation/UI/screens/cart_screen.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/screens/home_screen.dart';
import 'package:ahmed_mahmoud_flutter_task/features/bottom_nav_bar/presentation/UI/widgets/bottom_nav_bar.dart';
import 'package:ahmed_mahmoud_flutter_task/features/profile/presentation/UI/screens/profile_screen.dart';
import 'package:ahmed_mahmoud_flutter_task/features/search/presentation/UI/cubit/search_cubit/search_cubit.dart';
import 'package:ahmed_mahmoud_flutter_task/features/search/presentation/UI/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// NavBarHome is the main screen with a bottom navigation bar that allows users to switch between different pages.
// It uses BlocBuilder to manage the state of the current selected page from the BottomNavBarCubit.

// The pageList contains all the pages that can be accessed from the navigation bar:
// - HomeScreen
// - SearchScreen (wrapped in a BlocProvider for SearchCubit)
// - CartScreen
// - ProfileScreen

// BlocBuilder listens to the BottomNavBarCubit to determine the currently selected page and rebuild the UI accordingly.
// The BottomNavBar widget is responsible for rendering the navigation bar and passing the correct cubit to it.

class NavBarHome extends StatelessWidget {
  const NavBarHome({super.key});

  static final List<Widget> pageList = [
    const HomeScreen(),
    BlocProvider(
      create: (context) => sl<SearchCubit>(),
      child: const SearchScreen(),
    ),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BottomNavBarCubit>();
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        return Scaffold(
          body: pageList[cubit.pageIndex],
          bottomNavigationBar: BottomNavBar(cubit: cubit),
        );
      },
    );
  }
}
