import 'package:ahmed_mahmoud_flutter_task/core/constants/app_constants.dart';
import 'package:ahmed_mahmoud_flutter_task/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class YouMightAlsoLikeText extends StatelessWidget {
  const YouMightAlsoLikeText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 12),
      child: Text(
        AppConstants.youMightAlsoLike,
        style: AppTextStyles.font20BlackBold,
      ),
    );
  }
}
