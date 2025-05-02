import 'package:ahmed_mahmoud_flutter_task/core/constants/app_constants.dart';
import 'package:ahmed_mahmoud_flutter_task/core/theme/app_theme.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/domain/entities/cart_entity.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/presentation/UI/cubits/cart_cubit/cart_cubit.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/background_image.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      AppConstants.cart,
                      style: AppTextStyles.font38WhiteBold,
                    ),
                    const SizedBox(height: 12),
                    BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        if (state is CartLoading) {
                          return const LoadingCircle();
                        } else if (state is CartError) {
                          return Center(child: Text(state.message));
                        } else {
                          return cubit.cartItems == null
                              ? const Expanded(
                                child: Center(child: Text("No items in cart")),
                              )
                              : Expanded(
                                child: ListView.separated(
                                  itemBuilder: (
                                    BuildContext context,
                                    int index,
                                  ) {
                                    return CartContainer(
                                      productEntity: cubit.cartItems![index],
                                    );
                                  },
                                  separatorBuilder: (
                                    BuildContext context,
                                    int index,
                                  ) {
                                    return const SizedBox(height: 12);
                                  },
                                  itemCount: cubit.cartItems!.length,
                                ),
                              );
                        }
                      },
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

class CartContainer extends StatelessWidget {
  const CartContainer({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.25,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {},
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
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
            Column(
              children: [
                GestureDetector(onTap: () {}, child: const Icon(Icons.remove)),
                const Text("1"),
                GestureDetector(onTap: () {}, child: const Icon(Icons.add)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
