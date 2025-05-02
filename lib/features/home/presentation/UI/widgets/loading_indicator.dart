import 'package:ahmed_mahmoud_flutter_task/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class LoadingCircle extends StatelessWidget {
  const LoadingCircle({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 6,
        color: color ?? AppColors.white,
      ),
    );
  }
}
