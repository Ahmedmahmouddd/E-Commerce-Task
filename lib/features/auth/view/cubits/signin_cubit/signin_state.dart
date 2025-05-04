part of 'signin_cubit.dart';

// This file defines the states for the SigninCubit class. It utilizes Dart's sealed class feature, ensuring that all possible states are explicitly declared.
// The states represent different stages of the sign-in process: initial, loading, success, and failure.
// - SigninInitial: Represents the initial state before any action occurs.
// - SigninSuccess: Represents the state when the user has successfully signed in. It includes the user data.
// - SigninLoading: Represents the loading state while the user is being authenticated.
// - SigninFailure: Represents the failure state when sign-in fails, containing an error message.

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninLoading extends SigninState {}

final class SigninSuccess extends SigninState {
  final UserEntity user;
  SigninSuccess(this.user);
}

final class SigninFailure extends SigninState {
  final String message;
  SigninFailure({required this.message});
}
