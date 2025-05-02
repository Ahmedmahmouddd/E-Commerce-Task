import 'package:ahmed_mahmoud_flutter_task/core/theme/app_colors.dart';
import 'package:ahmed_mahmoud_flutter_task/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class FillterWidget extends StatelessWidget {
  const FillterWidget({
    super.key,
    this.message = 'No results found!',
    this.icon,
  });

  final String message;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.filter_vintage,
              size: 80,
              color: AppColors.primary,
            ),
            const SizedBox(height: 8),
            Text(message, style: AppTextStyles.font20BlackBold),
          ],
        ),
      ),
    );
  }
}
