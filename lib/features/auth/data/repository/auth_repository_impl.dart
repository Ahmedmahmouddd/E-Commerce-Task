import 'package:ahmed_mahmoud_flutter_task/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:ahmed_mahmoud_flutter_task/features/auth/domain/entity/user_entity.dart';
import 'package:ahmed_mahmoud_flutter_task/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<String, UserEntity>> loginUser(
    String username,
    String password,
  ) async {
    final result = await remoteDataSource.loginUser(username, password);
    return result.fold(
      (failure) => Left(failure.message),
      (userModel) => Right(userModel.toEntity()),
    );
  }
}
