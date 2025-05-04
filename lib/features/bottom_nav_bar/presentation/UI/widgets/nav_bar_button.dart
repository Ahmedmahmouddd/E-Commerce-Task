import 'package:ahmed_mahmoud_flutter_task/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBarButton extends StatelessWidget {
  const BottomNavBarButton({
    super.key,
    required this.onTap,
    required this.selectedIcon,
    required this.isSelected,
  });
  final Function() onTap;
  final String selectedIcon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 54,
        child: Center(
          child: SvgPicture.asset(
            selectedIcon,
            height: 24,
            colorFilter: ColorFilter.mode(
              isSelected ? AppColors.primary : AppColors.white,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
