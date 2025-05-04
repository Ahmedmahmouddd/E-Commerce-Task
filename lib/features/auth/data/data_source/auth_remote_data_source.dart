import 'package:ahmed_mahmoud_flutter_task/core/constants/app_constants.dart';
import 'package:ahmed_mahmoud_flutter_task/core/models/failure_model.dart';
import 'package:ahmed_mahmoud_flutter_task/core/network/dio_client.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ahmed_mahmoud_flutter_task/features/auth/data/models/user_model.dart';

// This file defines the remote data source for user authentication,
// handling login functionality by sending a POST request to the login API.
// It uses Dio for networking and wraps responses in an Either type,
// returning either a UserModel on success or a FailureModel on failure.

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
          AppConstants.userName: username,
          AppConstants.password: password,
          AppConstants.expiresInMins: 30, // optional
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
        message:
            e.response?.data[AppConstants.message] ??
            e.message ??
            AppConstants.unKnownError,
      );
      return Left(failure);
    }
  }
}
