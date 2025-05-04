import 'package:ahmed_mahmoud_flutter_task/core/constants/app_constants.dart';
import 'package:ahmed_mahmoud_flutter_task/core/theme/app_colors.dart';
import 'package:ahmed_mahmoud_flutter_task/core/theme/app_theme.dart';
import 'package:ahmed_mahmoud_flutter_task/core/widgets/snack_bar.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/data/models/cart_send_model.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/presentation/UI/cubits/cart_cubit/cart_cubit.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/domain/entities/product_entity.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/favorites_positioned_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final cartCubit = BlocProvider.of<CartCubit>(context);
    final size = MediaQuery.of(context).size;
    final double originalPrice =
        widget.product.price / (1 - (widget.product.discountPercentage / 100));

    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartError) {
          showCustomSnackBar(context, state.message);
        } else if (state is CartSuccessful) {
          showCustomSnackBar(context, " Successfully added Item to cart");
        }
      },
      child: Scaffold(
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
                                  image: CachedNetworkImageProvider(
                                    images[index],
                                  ),
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
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                width: _currentIndex == index ? 12 : 8,
                                height: _currentIndex == index ? 12 : 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      _currentIndex == index
                                          ? AppColors.grey
                                          : AppColors.grey.withValues(
                                            alpha: 0.3,
                                          ),
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
                                      color: AppColors.primary,
                                      size: 20,
                                    );
                                  } else if (widget.product.rating > index &&
                                      widget.product.rating < index + 1) {
                                    return const Icon(
                                      Icons.star_half,
                                      color: AppColors.primary,
                                      size: 20,
                                    );
                                  } else {
                                    return const Icon(
                                      Icons.star_border,
                                      color: AppColors.primary,
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
                                  '(${widget.product.reviews.length} ${AppConstants.reviews})',
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
                              AppConstants.description,
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
              const FavoritePositionedWidget(top: 16, right: 16),
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(color: Colors.transparent),
                child: ElevatedButton(
                  onPressed: () {
                    cartCubit.addToCart(1, [
                      CartSendModel(id: widget.product.id, quantity: 1),
                    ]);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    (cartCubit.orderEntity?.products != null &&
                            cartCubit.orderEntity!.products.any(
                              (item) => item.id == widget.product.id,
                            ))
                        ? AppConstants.itemAddedToCart
                        : AppConstants.addToCart,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
