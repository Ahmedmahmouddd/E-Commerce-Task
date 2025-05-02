import 'package:ahmed_mahmoud_flutter_task/core/theme/app_colors.dart';
import 'package:ahmed_mahmoud_flutter_task/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class FilterOptionButton extends StatelessWidget {
  final String name;
  final Function()? onTap;
  final bool isSelected;
  const FilterOptionButton({
    super.key,
    required this.name,
    this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryDark : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.black12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Text(name, style: AppTextStyles.font14BlackSemiBold),
      ),
    );
  }
}
