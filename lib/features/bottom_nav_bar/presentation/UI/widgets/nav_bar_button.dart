import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBarButton extends StatelessWidget {
  const BottomNavBarButton({
    super.key,
    required this.onTap,
    required this.selectedIcon,
    required this.isSelected,
    required this.unSelectedIcon,
  });
  final Function() onTap;
  final String selectedIcon;
  final String unSelectedIcon;

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 54,
        child: Center(
          child: SvgPicture.asset(
            isSelected ? selectedIcon : unSelectedIcon,
            height: 24,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
