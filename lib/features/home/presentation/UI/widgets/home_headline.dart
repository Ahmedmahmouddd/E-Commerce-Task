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
          Text("New Arrivals Just", style: AppTextStyles.font38WhiteBold),
          Row(
            children: [
              Text("For ", style: AppTextStyles.font38WhiteBold),
              Text("You", style: AppTextStyles.font38PrimaryBold),
            ],
          ),
        ],
      ),
    );
  }
}
