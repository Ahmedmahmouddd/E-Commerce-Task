import 'dart:developer';

import 'package:ahmed_mahmoud_flutter_task/core/theme/app_theme.dart';
import 'package:ahmed_mahmoud_flutter_task/dependency_injection.dart';
import 'package:ahmed_mahmoud_flutter_task/features/auth/view/cubits/signin_cubit/signin_cubit.dart';
import 'package:ahmed_mahmoud_flutter_task/features/auth/view/screens/signin_screen.dart';
import 'package:ahmed_mahmoud_flutter_task/features/bottom_nav_bar/presentation/UI/cubit/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:ahmed_mahmoud_flutter_task/features/bottom_nav_bar/presentation/UI/screens/bottom_nav_bar_screen.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/presentation/UI/cubits/cart_cubit/cart_cubit.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/cubits/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String? email;
  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainerEmail = sharedPreferences.getString('email');
    email = obtainerEmail;
    log('email: $email');
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<SigninCubit>()),
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
        child: FutureBuilder(
          future: getValidationData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return MaterialApp(
                theme: appTheme,
                debugShowCheckedModeBanner: false,
                home:
                    email != null && email!.isNotEmpty
                        ? const NavBarHome()
                        : const SigninScreen(),
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
