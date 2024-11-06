import 'package:blue_spa/data/models/user_model.dart';

abstract class AuthRepositoryImpl {
  Future<UserModel> signUp(Map<String, dynamic> data);
  Future<UserModel> signIn(Map<String, dynamic> data);
}
