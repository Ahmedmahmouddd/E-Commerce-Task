import 'package:ahmed_mahmoud_flutter_task/features/cart/data/data_source.dart/cart_data_source.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/data/models/cart_model.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/data/models/cart_send_model.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/domain/entities/cart_entity.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/domain/repository/cart_repository.dart';
import 'package:dartz/dartz.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource dataSource;

  CartRepositoryImpl(this.dataSource);

  @override
  Future<Either<String, OrderEntity>> addToCart(
    int userId,
    List<CartSendModel> list,
  ) async {
    final result = await dataSource.addCart(userId, list);
    return result.fold(
      (failure) => Left(failure.message),
      (orderModel) => Right(orderModel.toEntity()),
    );
  }
  
  @override
  Future<Either<String, OrderEntity>> updateCart(int cartId,
    List<CartSendModel> list,
  ) async {
    final result = await dataSource.updateCart(cartId, list);
    return result.fold(
      (failure) => Left(failure.message),
      (orderModel) => Right(orderModel.toEntity()),
    );
  }
}
