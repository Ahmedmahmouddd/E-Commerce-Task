import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/favorites_positioned_widget.dart';
import 'package:flutter/material.dart';
import 'package:ahmed_mahmoud_flutter_task/core/theme/app_theme.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/domain/entities/product_entity.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/screens/product_details_screen.dart';

class SmallProductBox extends StatelessWidget {
  const SmallProductBox({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final boxSize = size.height * 0.18 - 12;

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
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: boxSize,
          height: boxSize,
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.1),
                spreadRadius: 1,
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(product.images.first, fit: BoxFit.cover),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                      AppColors.black.withValues(alpha: 0.2),
                    ],
                  ),
                ),
              ),

              const FavoritePositionedWidget(top: 8, right: 8),
            ],
          ),
        ),
      ),
    );
  }
}
