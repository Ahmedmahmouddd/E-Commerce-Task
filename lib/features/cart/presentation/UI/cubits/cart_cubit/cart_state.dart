part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartAlreadyExist extends CartState {}

class CartSuccessful extends CartState {
  final OrderEntity cart;
  CartSuccessful(this.cart);
}

class CartError extends CartState {
  final String message;
  CartError(this.message);
}
