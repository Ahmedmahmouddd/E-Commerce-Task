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

class NavBarHome extends StatelessWidget {
  const NavBarHome({super.key});

  static final List<Widget> pageList = [
    const HomeScreen(),
    BlocProvider(
      create: (context) => sl<SearchCubit>(),
      child: const SearchScreen(),
    ),
    const HomeScreen(),
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

//

//

//

//

//

//

//

//

//

//
