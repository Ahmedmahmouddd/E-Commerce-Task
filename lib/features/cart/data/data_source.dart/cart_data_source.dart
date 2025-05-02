import 'package:ahmed_mahmoud_flutter_task/core/models/failure_model.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/data/models/cart_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class CartRemoteDataSource {
  Future<Either<FailureModel, OrderModel>> fetchCart(int id);
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final Dio dio;

  CartRemoteDataSourceImpl(this.dio);

  @override
  Future<Either<FailureModel, OrderModel>> fetchCart(int id) async {
    try {
      final response = await dio.get('https://dummyjson.com/carts/$id');
      if (response.statusCode == 200) {
        return Right(OrderModel.fromJson(response.data));
      } else {
        return Left(FailureModel(message: 'Failed to load cart'));
      }
    } catch (e) {
      return Left(FailureModel(message: e.toString()));
    }
  }
}
