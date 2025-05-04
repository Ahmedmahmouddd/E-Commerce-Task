import 'package:ahmed_mahmoud_flutter_task/features/cart/data/models/cart_send_model.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/domain/entities/cart_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CartRepository {
  Future<Either<String, OrderEntity>> addToCart(
    int userId,
    List<CartSendModel> list,
  );

  Future<Either<String, OrderEntity>> updateCart(
    int cartId,
    List<CartSendModel> list,
  );
}
