import 'package:ahmed_mahmoud_flutter_task/core/theme/app_colors.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/favorites_positioned_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ahmed_mahmoud_flutter_task/core/theme/app_theme.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/domain/entities/product_entity.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/screens/product_details_screen.dart';

class HomeBigProductCard extends StatelessWidget {
  const HomeBigProductCard({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailsScreen(product: product),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: size.width * 0.6,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.white.withValues(alpha: 0.1),
                spreadRadius: 1,
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: product.images.first,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.transparent,
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
