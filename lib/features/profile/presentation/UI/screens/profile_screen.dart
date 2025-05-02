import 'package:ahmed_mahmoud_flutter_task/core/constants/app_constants.dart';
import 'package:ahmed_mahmoud_flutter_task/core/theme/app_theme.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/background_image.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          BackGroundImage(),
          SafeArea(
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      AppConstants.profile,
                      style: AppTextStyles.font38WhiteBold,
                    ),
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
