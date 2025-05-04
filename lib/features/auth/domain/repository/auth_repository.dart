import 'package:ahmed_mahmoud_flutter_task/features/auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';

// This file defines the AuthRepository abstract class, which specifies the contract for authentication logic.
// It declares a method to handle user login, returning either a failure message or a UserEntity upon success.

abstract class AuthRepository {
  Future<Either<String, UserEntity>> loginUser(
    String username,
    String password,
  );
}
