import 'package:ahmed_mahmoud_flutter_task/core/shared_preferences/shared_preferences.dart';
import 'package:ahmed_mahmoud_flutter_task/core/theme/app_theme.dart';
import 'package:ahmed_mahmoud_flutter_task/dependency_injection.dart';
import 'package:ahmed_mahmoud_flutter_task/features/bottom_nav_bar/presentation/UI/cubit/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:ahmed_mahmoud_flutter_task/features/bottom_nav_bar/presentation/UI/screens/bottom_nav_bar_screen.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/presentation/UI/cubits/cart_cubit/cart_cubit.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/cubits/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheSaver.init();
  await CacheSaver.getUser();

  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<BottomNavBarCubit>()),
          BlocProvider(
            create:
                (context) =>
                    sl<HomeCubit>()
                      ..getSortedProducts('')
                      ..getProducts(),
          ),
          BlocProvider(create: (context) => sl<CartCubit>()),
        ],
        child: MaterialApp(
          theme: appTheme,
          debugShowCheckedModeBanner: false,
          home: const NavBarHome(),
        ),
      ),
    );
  }
}
