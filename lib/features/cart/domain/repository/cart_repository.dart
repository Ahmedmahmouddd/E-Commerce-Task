import 'package:ahmed_mahmoud_flutter_task/core/models/failure_model.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/domain/entities/cart_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CartRepository {
  Future<Either<FailureModel, OrderEntity>> getCart(int id);
}
