import 'package:agro_hack23/common/errors/exceptions.dart';
import 'package:agro_hack23/data/models/user_modal.dart';
import 'package:agro_hack23/domain/entities/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalData {
  Future<void> setTokenToCache(String token);
  Future<String> getTokenFromCache();
  Future<void> removeTokenFromCache();
  Future<void> setUserDataToCache(UserModel user);
  Future<UserModel> getUserDataFromCache();
}

class UserLocalDataImpl implements UserLocalData {
  final SharedPreferences sharedPreferences;
  final FlutterSecureStorage securedStorage;

  UserLocalDataImpl({
    required this.securedStorage,
    required this.sharedPreferences,
  });
  @override
  Future<void> setTokenToCache(String token) {
    return sharedPreferences.setString('auth_token', token);
  }

  @override
  Future<String> getTokenFromCache() {
    String? token = sharedPreferences.getString('auth_token');
    if (token == null) throw CacheException('Auth token are not set');
    return Future.value(token);
  }

  @override
  Future<void> removeTokenFromCache() {
    return sharedPreferences.remove('auth_token');
  }

  @override
  Future<UserModel> getUserDataFromCache() async {
    String? user = await securedStorage.read(key: 'user_info');
    if (user == null) throw CacheException('The user_info is not set');
    return Future.value(UserModel.fromRawJson(user));
  }

  @override
  Future<void> setUserDataToCache(UserModel user) {
    return securedStorage.write(key: 'user_info', value: user.toRawJson());
  }
}
