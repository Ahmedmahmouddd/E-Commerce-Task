import 'package:ahmed_mahmoud_flutter_task/core/models/failure_model.dart';
import 'package:ahmed_mahmoud_flutter_task/core/network/dio_client.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/data/models/cart_model.dart';
import 'package:ahmed_mahmoud_flutter_task/features/cart/data/models/cart_send_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class CartRemoteDataSource {
  Future<Either<FailureModel, OrderModel>> addCart(
    int userId,
    List<CartSendModel> list,
  );
  Future<Either<FailureModel, OrderModel>> updateCart(
    int userId,
    List<CartSendModel> list,
  );
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final Dio dio;

  CartRemoteDataSourceImpl(this.dio);

  @override
  Future<Either<FailureModel, OrderModel>> addCart(
    int userId,
    List<CartSendModel> list,
  ) async {
    try {
      final response = await DioClient().post(
        'carts/add',
        data: {'userId': userId, 'products': list},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(OrderModel.fromJson(response.data));
      } else {
        return Left(FailureModel(message: 'Failed to add cart'));
      }
    } catch (e) {
      return Left(FailureModel(message: e.toString()));
    }
  }

  @override
  Future<Either<FailureModel, OrderModel>> updateCart(
    int cartId,
    List<CartSendModel> list,
  ) async {
    try {
      final response = await DioClient().put(
        'carts/$cartId',
        data: {'merge': true, 'products': list},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(OrderModel.fromJson(response.data));
      } else {
        return Left(FailureModel(message: response.data['message']));
      }
    } catch (e) {
      return Left(FailureModel(message: e.toString()));
    }
  }
}
