import 'package:blue_spa/data/models/user_model.dart';
import 'package:blue_spa/data/services/api_client.dart';
import 'package:blue_spa/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthRepository extends AuthRepositoryImpl {
  
  final ApiClient _apiClient;
  AuthRepository(ApiClient apiClient) : _apiClient = apiClient;

  @override
  Future<UserModel> signUp(Map<String, dynamic> data) async {
    try {
      final res = await _apiClient.signUp(data);
      return UserModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }
  @override
  Future<UserModel> signIn(Map<String, dynamic> data) async {
    try {
      final res = await _apiClient.signIn(data);
      return UserModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

 


}
