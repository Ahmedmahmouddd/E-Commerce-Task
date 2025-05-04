import 'package:ahmed_mahmoud_flutter_task/core/constants/app_constants.dart';
import 'package:ahmed_mahmoud_flutter_task/core/theme/app_colors.dart';
import 'package:ahmed_mahmoud_flutter_task/core/theme/app_theme.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/presentation/UI/cubits/cart_cubit/cart_cubit.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/presentation/UI/screens/checkout_page.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/presentation/UI/widgets/cart_container.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/background_image.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CartCubit>(context);
    return Scaffold(
      body: Stack(
        children: [
          const BackGroundImage(),
          SafeArea(
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              AppConstants.cart,
                              style: AppTextStyles.font38WhiteBold,
                            ),
                            if (cubit.orderEntity?.products != null)
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: AppColors.white.withValues(alpha: 0.5),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return const CheckoutPage();
                                        },
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    AppConstants.checkOutPage,
                                    style: AppTextStyles.font16WhiteSemiBold,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        BlocBuilder<CartCubit, CartState>(
                          builder: (context, state) {
                            if (state is CartLoading) {
                              return const LoadingCircle();
                            } else if (state is CartError) {
                              return Center(child: Text(state.message));
                            } else {
                              return cubit.orderEntity?.products == null
                                  ? const Expanded(
                                    child: Center(
                                      child: Text("No items in cart"),
                                    ),
                                  )
                                  : Expanded(
                                    child: ListView.separated(
                                      itemBuilder: (
                                        BuildContext context,
                                        int index,
                                      ) {
                                        return CartContainer(
                                          productEntity:
                                              cubit
                                                  .orderEntity!
                                                  .products[index],
                                        );
                                      },
                                      separatorBuilder: (
                                        BuildContext context,
                                        int index,
                                      ) {
                                        return const SizedBox(height: 12);
                                      },
                                      itemCount:
                                          cubit.orderEntity!.products.length,
                                    ),
                                  );
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
