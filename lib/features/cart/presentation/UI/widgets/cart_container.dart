import 'package:ahmed_mahmoud_flutter_task/core/theme/app_colors.dart';
import 'package:ahmed_mahmoud_flutter_task/core/theme/app_theme.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/data/models/cart_send_model.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/domain/entities/cart_entity.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/presentation/UI/cubits/cart_cubit/cart_cubit.dart';
import 'package:ahmed_mahmoud_flutter_task/main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// CartContainer: Displays individual product in the cart with quantity management.
// Uses CachedNetworkImage to display product image and CartCubit to manage cart updates.
// Includes a slidable action to remove items and buttons to increase/decrease quantity.
// Updates cart state and UI when product quantity is changed or removed.

// ignore: must_be_immutable
class CartContainer extends StatelessWidget {
  CartContainer({super.key, required this.productEntity});

  ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.25,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              cubit.updateCart(user?.id ?? 1, [
                CartSendModel(
                  id: productEntity.id,
                  quantity: productEntity.quantity - 1,
                ),
              ]);

              cubit.orderEntity!.products.remove(productEntity);
              cubit.updateState();
            },
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            backgroundColor: AppColors.red,
            foregroundColor: AppColors.white,
            icon: Icons.delete,
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: CachedNetworkImage(
                imageUrl: productEntity.thumbnail,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          productEntity.title,
                          style: AppTextStyles.font16BlackSemiBold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "\$ ${productEntity.price.toString()}",
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.font16BlackSemiBold,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (productEntity.quantity == 1) {
                          cubit.updateCart(1, [
                            CartSendModel(
                              id: productEntity.id,
                              quantity: productEntity.quantity - 1,
                            ),
                          ]);

                          cubit.orderEntity!.products.remove(productEntity);
                          cubit.updateState();
                        } else {
                          cubit.updateCart(user?.id ?? 1, [
                            CartSendModel(
                              id: productEntity.id,
                              quantity: productEntity.quantity - 1,
                            ),
                          ]);
                          productEntity.quantity--;
                          cubit.updateState();
                        }
                      },
                      child: const Icon(Icons.remove),
                    ),
                    Text(productEntity.quantity.toString()),
                    GestureDetector(
                      onTap: () {
                        cubit.updateCart(user?.id ?? 1, [
                          CartSendModel(
                            id: productEntity.id,
                            quantity: productEntity.quantity + 1,
                          ),
                        ]);
                        productEntity.quantity++;
                        cubit.updateState();
                      },
                      child: const Icon(Icons.add),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
