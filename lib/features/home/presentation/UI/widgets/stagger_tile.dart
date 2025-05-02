import 'package:ahmed_mahmoud_flutter_task/core/theme/app_colors.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/favorites_positioned_widget.dart';
import 'package:flutter/material.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/screens/product_details_screen.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/domain/entities/product_entity.dart';
import 'package:ahmed_mahmoud_flutter_task/core/theme/app_theme.dart';

class StaggerTile extends StatelessWidget {
  const StaggerTile({super.key, required this.height, required this.product});

  final double height;
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product: product),
          ),
        );
      },
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.1),
              spreadRadius: 1,
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(product.images.first, fit: BoxFit.cover),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      AppColors.black.withValues(alpha: 0.8),
                    ],
                  ),
                ),
              ),
              const FavoritePositionedWidget(),
              Positioned(
                bottom: 12,
                left: 12,
                right: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: AppTextStyles.font22WhiteBold.copyWith(
                        shadows: [
                          const Shadow(
                            color: AppColors.grey,
                            offset: Offset(2, 2),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product.description,
                      style: AppTextStyles.font14DarkWhiteSemiBold,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\$${product.price}',
                      style: AppTextStyles.font22WhiteBold,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
