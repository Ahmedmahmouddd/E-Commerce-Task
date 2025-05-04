import 'package:ahmed_mahmoud_flutter_task/core/constants/app_constants.dart';
import 'package:ahmed_mahmoud_flutter_task/core/models/failure_model.dart';
import 'package:ahmed_mahmoud_flutter_task/core/network/dio_client.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/data/model/product_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class ProductRemoteDataSource {
  Future<Either<FailureModel, ProductsResponseModel>> fetchAllProduct();
  Future<Either<FailureModel, ProductsResponseModel>> fetchSortedProducts(
    String sort,
  );
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final Dio dio;
  ProductRemoteDataSourceImpl(this.dio);

  @override
  Future<Either<FailureModel, ProductsResponseModel>> fetchAllProduct() async {
    try {
      final response = await DioClient().get(AppConstants.apiPproducts);
      if (response.statusCode == 200 && response.data != null) {
        final productList = ProductsResponseModel.fromJson(response.data);
        return Right(productList);
      } else {
        final failure = FailureModel.fromJson(response.data);
        return Left(failure);
      }
    } on DioException catch (e) {
      final failure = FailureModel(
        message:
            e.response?.data[AppConstants.message] ??
            e.message ??
            AppConstants.unKnownError,
      );
      return Left(failure);
    }
  }

  @override
  Future<Either<FailureModel, ProductsResponseModel>> fetchSortedProducts(
    String? sort,
  ) async {
    try {
      final response = await DioClient().get(
        "${AppConstants.apiPproducts}$sort",
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
        message:
            e.response?.data[AppConstants.message] ??
            e.message ??
            AppConstants.unKnownError,
      );
      return Left(failure);
    }
  }
}
