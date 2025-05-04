import 'dart:developer';

import 'package:ahmed_mahmoud_flutter_task/features/cart/data/models/cart_send_model.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/domain/entities/cart_entity.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/domain/repository/cart_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepository repository;

  CartCubit(this.repository) : super(CartInitial());

  // List<ProductEntity>? cartItems;
  OrderEntity? orderEntity;

  void updateState() {
    emit(CartInitial());
  }

  Future<void> addToCart(int id, List<CartSendModel> list) async {
    emit(CartLoading());

    final result = await repository.addToCart(id, list);

    result.fold(
      (failure) {
        log('error: $failure');
        emit(CartError(failure));
      },
      (order) {
        orderEntity = orderEntity ?? order;
        final newProduct = order.products.first;
        final alreadyExists = orderEntity!.products.any(
          (item) => item.id == newProduct.id,
        );

        if (alreadyExists) {
          emit(CartAlreadyExist());
        } else {
          orderEntity!.products.add(newProduct);
          emit(CartSuccessful(order));
        }
      },
    );
  }

  Future<void> updateCart(int cartId, List<CartSendModel> products) async {
    emit(CartLoading());

    final result = await repository.updateCart(cartId, products);

    result.fold(
      (failure) {
        log('Update error: $failure');
        emit(CartError(failure));
      },
      (order) {
        emit(CartSuccessful(order));
      },
    );
  }
}
