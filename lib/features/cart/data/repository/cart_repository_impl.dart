import 'package:ahmed_mahmoud_flutter_task/core/models/failure_model.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/data/data_source.dart/cart_data_source.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/data/models/cart_model.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/domain/entities/cart_entity.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/domain/repository/cart_repository.dart';
import 'package:dartz/dartz.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource dataSource;

  CartRepositoryImpl(this.dataSource);

  @override
  Future<Either<FailureModel, OrderEntity>> getCart(int id) async {
    final result = await dataSource.fetchCart(id);
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model.toEntity()),
    );
  }
}
