import 'package:ahmed_mahmoud_flutter_task/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class FavoritePositionedWidget extends StatelessWidget {
  const FavoritePositionedWidget({super.key, this.top, this.right});

  final double? top;
  final double? right;
  
  @override 

  Widget build(BuildContext context) {
    return  Positioned(
      top: top?? 12,
      right: right ??12,
      child: const Icon(
        Icons.favorite_border,
        color: AppColors.primaryDark,
        size: 28,
      ),
    );
  }
}
