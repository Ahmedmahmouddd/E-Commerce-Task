import 'package:ahmed_mahmoud_flutter_task/features/cart/domain/entities/cart_entity.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/domain/repository/cart_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepository repository;

  CartCubit(this.repository) : super(CartInitial());

  Future<void> fetchCart(int id) async {
    emit(CartLoading());
    final result = await repository.getCart(id);
    result.fold(
      (failure) => emit(CartError(failure.message)),
      (order) => emit(CartLoaded(order)),
    );
  }
}
