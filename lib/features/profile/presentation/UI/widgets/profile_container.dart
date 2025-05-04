import 'package:ahmed_mahmoud_flutter_task/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white12),
      ),
      child: const Row(
        children: [
          Icon(Icons.email, color: Colors.white),
          SizedBox(width: 12),
          Text("emilys", style: AppTextStyles.font14BlackSemiBold),
        ],
      ),
    );
  }
}
