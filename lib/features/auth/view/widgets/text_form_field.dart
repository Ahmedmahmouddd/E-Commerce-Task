import 'package:ahmed_mahmoud_flutter_task/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.hint,
    this.icon,
    this.validator,
    this.suffixIcon,
    this.obsecure = false,
    this.onChanged,
  });

  final IconButton? suffixIcon;
  final TextEditingController? controller;
  final String? hint;
  final IconData? icon;
  final String? Function(String?)? validator;
  final bool? obsecure;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: const InputDecorationTheme(
          errorStyle: AppTextStyles.font14RedSemiBold,
        ),
      ),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        obscureText: obsecure!,
        obscuringCharacter: "*",
        cursorWidth: 2.5,
        cursorColor: AppColors.primary,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: [LengthLimitingTextInputFormatter(50)],
        style: AppTextStyles.font16BlackSemiBold,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hint,
          hintStyle: AppTextStyles.font16GreySemiBold.copyWith(
            color: AppColors.grey.withValues(alpha: 0.7),
          ),
          prefixIcon:
              icon != null
                  ? Icon(icon, color: AppColors.grey.withValues(alpha: 0.7))
                  : null,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
