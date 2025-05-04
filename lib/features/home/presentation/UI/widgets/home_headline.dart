import 'package:ahmed_mahmoud_flutter_task/core/constants/app_constants.dart';
import 'package:ahmed_mahmoud_flutter_task/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HomeHeadline extends StatelessWidget {
  const HomeHeadline({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppConstants.newArrivalsJust,
            style: AppTextStyles.font38WhiteBold,
          ),
          Row(
            children: [
              Text(AppConstants.forY, style: AppTextStyles.font38WhiteBold),
              Text(AppConstants.you, style: AppTextStyles.font38PrimaryBold),
            ],
          ),
        ],
      ),
    );
  }
}
