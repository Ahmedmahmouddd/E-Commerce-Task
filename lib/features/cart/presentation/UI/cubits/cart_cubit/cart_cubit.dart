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

  List<ProductEntity>? cartItems;

  Future<void> addToCart(int id, List<CartSendModel> list) async {
    emit(CartLoading());
    final result = await repository.addCart(id, list);
    result.fold(
      (failure) => {log('error: $failure'), emit(CartError(failure))},
      (order) {
        cartItems = cartItems ?? [];
        cartItems?.add(order.products.first);
        log('order: ${cartItems}');
        emit(CartSuccessful(order));
      },
    );
  }
}
