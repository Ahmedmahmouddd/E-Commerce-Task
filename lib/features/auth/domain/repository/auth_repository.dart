import 'package:ahmed_mahmoud_flutter_task/features/auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<String, UserEntity>> loginUser(String username, String password);
}
