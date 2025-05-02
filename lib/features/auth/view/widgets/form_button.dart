import 'package:ahmed_mahmoud_flutter_task/core/theme/app_theme.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.loading,
    this.width,
    this.height,
  });

  final void Function() onPressed;
  final String text;
  final bool loading;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 200,
      height: height ?? 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          overlayColor: AppColors.grey,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
        ),
        onPressed: onPressed,
        child:
            loading
                ? const SizedBox(
                  width: 25,
                  height: 50,
                  child: LoadingCircle(),
                )
                : SizedBox(
                  child: Text(text, style: AppTextStyles.font16BlackSemiBold),
                ),
      ),
    );
  }
}
