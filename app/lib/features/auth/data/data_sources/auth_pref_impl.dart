import 'package:blue_spa/data/models/user_model.dart';

abstract class AuthPrefImpl {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> saveUser(UserModel user);
  Future<UserModel?> getUser();
}
