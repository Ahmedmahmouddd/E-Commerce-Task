import 'package:ahmed_mahmoud_flutter_task/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class NoResultsFound extends StatelessWidget {
  const NoResultsFound({super.key, this.message = 'No results found!'});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.search_off, size: 80, color: AppColors.primary),
            const SizedBox(height: 8),
            Text(message, style: AppTextStyles.font24PrimaryBold),
          ],
        ),
      ),
    );
  }
}
