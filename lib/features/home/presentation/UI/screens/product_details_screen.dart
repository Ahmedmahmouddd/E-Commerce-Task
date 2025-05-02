import 'package:ahmed_mahmoud_flutter_task/core/constants/app_constants.dart';
import 'package:ahmed_mahmoud_flutter_task/core/theme/app_theme.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final ProductEntity product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final images = widget.product.images;

    final size = MediaQuery.of(context).size;
    final double originalPrice =
        widget.product.price / (1 - (widget.product.discountPercentage / 100));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Product image
                SizedBox(
                  height: size.height * 0.35,
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      PageView.builder(
                        controller: _pageController,
                        itemCount: images.length,
                        onPageChanged: (index) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(images[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                      Positioned(
                        bottom: 16,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            images.length,
                            (index) => AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: _currentIndex == index ? 12 : 8,
                              height: _currentIndex == index ? 12 : 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    _currentIndex == index
                                        ? AppColors.grey
                                        : AppColors.grey.withValues(alpha: 0.3),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(32),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 16,
                          offset: Offset(0, -4),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          Text(
                            widget.product.title,
                            style: AppTextStyles.font22BlackBold,
                          ),
                          const SizedBox(height: 8),

                          // Rating + Reviews
                          Row(
                            children: [
                              ...List.generate(5, (index) {
                                if (widget.product.rating >= index + 1) {
                                  return const Icon(
                                    Icons.star,
                                    color: AppColors.yellow,
                                    size: 20,
                                  );
                                } else if (widget.product.rating > index &&
                                    widget.product.rating < index + 1) {
                                  return const Icon(
                                    Icons.star_half,
                                    color: AppColors.yellow,
                                    size: 20,
                                  );
                                } else {
                                  return const Icon(
                                    Icons.star_border,
                                    color: AppColors.yellow,
                                    size: 20,
                                  );
                                }
                              }),
                              const SizedBox(width: 8),
                              Text(
                                '${widget.product.rating}',
                                style: AppTextStyles.font14RedSemiBold,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '(${widget.product.reviews.length} reviews)',
                                style: AppTextStyles.font14GreySemiBold,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),

                          // Price
                          Row(
                            children: [
                              Text(
                                "\$${originalPrice.toStringAsFixed(2)} ",
                                style: AppTextStyles.font22BlackBold.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              Text(
                                "\$${widget.product.price} ",
                                style: AppTextStyles.font22BlackBold,
                              ),
                              Text(
                                "(% ${widget.product.discountPercentage}) ",
                                style: AppTextStyles.font14GreySemiBold,
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),

                          // Availability
                          Text(
                            widget.product.availabilityStatus,
                            style: AppTextStyles.font16BlackSemiBold,
                          ),
                          const SizedBox(height: 8),

                          // Shipping Info
                          Row(
                            children: [
                              const Icon(Icons.local_shipping_outlined),
                              const SizedBox(width: 8),
                              Text(
                                widget.product.shippingInformation,
                                style: AppTextStyles.font14GreySemiBold,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // Description
                          const Text(
                            "Description",
                            style: AppTextStyles.font16BlackSemiBold,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.product.description,
                            style: AppTextStyles.font14GreySemiBold,
                            maxLines: 6,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 12,
              left: 12,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Positioned(
              top: 12,
              right: 12,
              child: IconButton(
                icon: const Icon(
                  Icons.favorite_border_rounded,
                  color: Colors.black,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(color: Colors.transparent),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              AppConstants.addToCart,
              style: TextStyle(fontSize: 16, color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }
}
