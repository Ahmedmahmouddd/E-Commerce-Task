import 'package:ahmed_mahmoud_flutter_task/core/constants/app_constants.dart';
import 'package:ahmed_mahmoud_flutter_task/core/theme/app_colors.dart';
import 'package:ahmed_mahmoud_flutter_task/core/theme/app_theme.dart';
import 'package:ahmed_mahmoud_flutter_task/features/auth/view/screens/signin_screen.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/background_image.dart';
import 'package:ahmed_mahmoud_flutter_task/features/profile/presentation/UI/widgets/profile_container.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGroundImage(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        AppConstants.profile,
                        style: AppTextStyles.font38WhiteBold,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.white.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.remove('email');
                            if (context.mounted) {
                              Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SigninScreen(),
                              ),
                              (route) => false,
                              );
                            }
                          },
                          child: const Text(
                            AppConstants.logOut,
                            style: AppTextStyles.font16WhiteSemiBold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  // Email Container
                  const ProfileContainer(email: "emilys"),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
