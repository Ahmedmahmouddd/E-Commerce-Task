import 'package:ahmed_mahmoud_flutter_task/features/auth/domain/entity/user_entity.dart';
import 'package:ahmed_mahmoud_flutter_task/features/auth/domain/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'signin_state.dart';

// This file defines the SigninCubit class, which is responsible for handling the state of the user sign-in process.
// It uses the AuthRepository to login the user, and manages various states such as loading, success, and failure using the BLoC pattern.
// The SigninCubit also caches the user data once the login is successful.

class SigninCubit extends Cubit<SigninState> {
  final AuthRepository authRepository;

  SigninCubit(this.authRepository) : super(SigninInitial());

  UserEntity? userEntity;

  Future<void> loginUser(String username, String password) async {
    emit(SigninLoading());

    final result = await authRepository.loginUser(username, password);

    result.fold((failure) => emit(SigninFailure(message: failure)), (
      userEntity,
    ) async {
      this.userEntity = userEntity;

      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('email', userEntity.email);
      sharedPreferences.setString('accessToken', userEntity.accessToken);
      sharedPreferences.setInt('id', userEntity.id);
      emit(SigninSuccess(userEntity));
    });
  }
}
