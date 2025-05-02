import 'package:ahmed_mahmoud_flutter_task/core/theme/app_colors.dart';
import 'package:flutter/material.dart';



class AppTextStyles {
  static const TextStyle font38WhiteBold = TextStyle(
    fontSize: 38,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static const TextStyle font38PrimaryBold = TextStyle(
    fontSize: 38,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static const TextStyle font32BlackBold = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static const TextStyle font24PrimaryBold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static const TextStyle font22WhiteBold = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
  static const TextStyle font22BlackBold = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );
  static const TextStyle font20PrimaryBold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

static const TextStyle font20BlackBold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static const TextStyle font20WhiteBold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static const TextStyle font16BlackSemiBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

static const TextStyle font16WhiteSemiBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static const TextStyle font16GreySemiBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.grey,
  );
  static const TextStyle font14DarkWhiteSemiBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.darkWhite,
  );

  static const TextStyle font14BlackSemiBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );
  static const TextStyle font14GreySemiBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.grey,
  );
  static const TextStyle font14RedSemiBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.red,
  );
}

final ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primary,
  hintColor: AppColors.primaryLight,

  colorScheme: const ColorScheme(
    primary: AppColors.primary,
    secondary: AppColors.primaryLight,
    surface: AppColors.white,
    error: Colors.redAccent,
    onPrimary: AppColors.white,
    onSecondary: AppColors.black,
    onSurface: AppColors.black,
    onError: AppColors.white,
    brightness: Brightness.light,
  ),

  scaffoldBackgroundColor: AppColors.white,

  appBarTheme: const AppBarTheme(
    color: AppColors.primary,
    iconTheme: IconThemeData(color: AppColors.white),
    titleTextStyle: TextStyle(
      color: AppColors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),
);
