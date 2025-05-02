import 'dart:convert';

import 'package:ahmed_mahmoud_flutter_task/features/auth/data/models/user_model.dart';
import 'package:ahmed_mahmoud_flutter_task/features/auth/domain/entity/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheSaver {
  static SharedPreferences? sharedPreferences;

  // Initialize SharedPreferences
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // Save data based on type
  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences?.setString(key, value) ??
          Future.value(false);
    } else if (value is int) {
      return await sharedPreferences?.setInt(key, value) ?? Future.value(false);
    } else if (value is bool) {
      return await sharedPreferences?.setBool(key, value) ??
          Future.value(false);
    } else if (value is List<String>) {
      return await sharedPreferences?.setStringList(key, value) ??
          Future.value(false);
    } else {
      throw ArgumentError('Unsupported value type');
    }
  }

  // Save a list of strings
  static Future<bool> saveList({
    required String key,
    required List<String> value,
  }) async {
    return await sharedPreferences?.setStringList(key, value) ??
        Future.value(false);
  }

  // Retrieve data of various types
  static dynamic getData({required String key}) {
    return sharedPreferences?.get(key);
  }

  // Retrieve a list of strings
  static List<String>? getStringList({required String key}) {
    return sharedPreferences?.getStringList(key);
  }

  // Clear data
  static Future<bool> clearData({required String key}) async {
    return await sharedPreferences?.remove(key) ?? Future.value(false);
  }

  // Clear all data
  static Future<bool> clearAllData() async {
    return await sharedPreferences?.clear() ?? Future.value(false);
  }

  /// for user
  static const String _userKey = 'user_data';
  // Save user data to cache
  static Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = user.toJson();
    await prefs.setString(_userKey, jsonEncode(userJson));
  }

  static UserEntity? user;

  // Retrieve user data from cache
  static Future<UserModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_userKey);
    if (userJson != null) {
      return UserModel.fromJson(jsonDecode(userJson));
    }

    user = UserModel.fromJson(jsonDecode(userJson!)).toEntity();
    return null;
  }

  // Clear user data from cache (e.g., on logout)
  static Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }

  static Future<bool> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_userKey); // True if user data exists
  }
}
