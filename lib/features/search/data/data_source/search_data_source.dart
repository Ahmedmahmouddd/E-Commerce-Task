import 'package:ahmed_mahmoud_flutter_task/core/constants/app_constants.dart';
import 'package:ahmed_mahmoud_flutter_task/core/models/failure_model.dart';
import 'package:ahmed_mahmoud_flutter_task/core/network/dio_client.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/data/model/product_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class SearchRemoteDataSource {
  Future<Either<FailureModel, ProductsResponseModel>> searchProduct(
    String name,
  );
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final Dio dio;
  SearchRemoteDataSourceImpl(this.dio);

  @override
  Future<Either<FailureModel, ProductsResponseModel>> searchProduct(
    String name,
  ) async {
    try {
      final response = await DioClient().get(
        "${AppConstants.apiSearch}?q=$name",
      );
      if (response.statusCode == 200 && response.data != null) {
        final productList = ProductsResponseModel.fromJson(response.data);
        return Right(productList);
      } else {
        final failure = FailureModel.fromJson(response.data);
        return Left(failure);
      }
    } on DioException catch (e) {
      final failure = FailureModel(
        message: e.response?.data["message"] ?? e.message ?? "Unknown error",
      );
      return Left(failure);
    }
  }
}
