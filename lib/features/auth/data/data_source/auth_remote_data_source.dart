import 'package:ahmed_mahmoud_flutter_task/core/constants/app_constants.dart';
import 'package:ahmed_mahmoud_flutter_task/core/models/failure_model.dart';
import 'package:ahmed_mahmoud_flutter_task/core/network/dio_client.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ahmed_mahmoud_flutter_task/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<Either<FailureModel, UserModel>> loginUser(
    String username,
    String password,
  );
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final Dio dio;
  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<Either<FailureModel, UserModel>> loginUser(
    String username,
    String password,
  ) async {
    try {
      final response = await DioClient().post(
        AppConstants.apiLogin,
        data: {
          'username': username,
          'password': password,
          'expiresInMins': 30, // optional
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        final userModel = UserModel.fromJson(response.data);
        return Right(userModel);
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
