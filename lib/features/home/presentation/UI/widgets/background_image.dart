import 'package:ahmed_mahmoud_flutter_task/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/wavesOpacity.svg',
      height: MediaQuery.of(context).size.height / 1.5,
      colorFilter: const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
      fit: BoxFit.cover,
    );
  }
}
