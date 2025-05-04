import 'package:ahmed_mahmoud_flutter_task/features/auth/domain/entity/user_entity.dart';

// This file defines the UserModel class, which represents the user data structure
// and handles JSON serialization/deserialization as well as conversion to a UserEntity.
// It centralizes JSON keys as static constants for maintainability and consistency.

class UserModel {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  final String accessToken;
  final String refreshToken;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
    required this.accessToken,
    required this.refreshToken,
  });

  static const String idKey = 'id';
  static const String usernameKey = 'username';
  static const String emailKey = 'email';
  static const String firstNameKey = 'firstName';
  static const String lastNameKey = 'lastName';
  static const String genderKey = 'gender';
  static const String imageKey = 'image';
  static const String accessTokenKey = 'accessToken';
  static const String refreshTokenKey = 'refreshToken';

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json[idKey],
      username: json[usernameKey],
      email: json[emailKey],
      firstName: json[firstNameKey],
      lastName: json[lastNameKey],
      gender: json[genderKey],
      image: json[imageKey],
      accessToken: json[accessTokenKey],
      refreshToken: json[refreshTokenKey],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      idKey: id,
      usernameKey: username,
      emailKey: email,
      firstNameKey: firstName,
      lastNameKey: lastName,
      genderKey: gender,
      imageKey: image,
      accessTokenKey: accessToken,
      refreshTokenKey: refreshToken,
    };
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      username: username,
      email: email,
      firstName: firstName,
      lastName: lastName,
      gender: gender,
      image: image,
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
