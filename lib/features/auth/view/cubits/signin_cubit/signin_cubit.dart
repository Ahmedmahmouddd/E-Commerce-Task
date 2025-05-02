import 'package:ahmed_mahmoud_flutter_task/features/auth/domain/entity/user_entity.dart';
import 'package:ahmed_mahmoud_flutter_task/features/auth/domain/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final AuthRepository authRepository;

  SigninCubit(this.authRepository) : super(SigninInitial());
 
//  UserEntity? currentUser;
  Future<void> loginUser(String username, String password) async {
    emit(SigninLoading());

    final result = await authRepository.loginUser(username, password);
   
    result.fold(
      (failure) => emit(SigninFailure(message: failure)),
      (userEntity) {
        // currentUser = userEntity;
        emit(SigninSuccess(userEntity));},
    );
  }
}
